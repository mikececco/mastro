#!/usr/bin/env sh
# Mastro — tests/calc.test.sh
# Deterministic unit tests for scripts/calc.sh. No API key, no network, CI-friendly.
# Run: sh tests/calc.test.sh   (exit 0 = all pass)

set -u
CALC="$(CDPATH= cd "$(dirname "$0")/.." && pwd)/scripts/calc.sh"
pass=0; fail=0

# assert that field=value appears in calc output for the given args
field() {
  desc="$1"; key="$2"; want="$3"; shift 3
  got=$(sh "$CALC" "$@" 2>/dev/null | awk -F= -v k="$key" '$1==k{print $2}')
  if [ "$got" = "$want" ]; then
    pass=$((pass+1))
  else
    fail=$((fail+1)); echo "FAIL: $desc -> $key want=$want got='$got'"
  fi
}

# assert exit code (for input-validation edges)
exits() {
  desc="$1"; want="$2"; shift 2
  sh "$CALC" "$@" >/dev/null 2>&1; code=$?
  if [ "$code" = "$want" ]; then
    pass=$((pass+1))
  else
    fail=$((fail+1)); echo "FAIL: $desc -> exit want=$want got=$code"
  fi
}

# --- imposta: happy paths (both aliquote) ---
# reddito = 50000*0.78 = 39000; netto = 39000-4000 = 35000
field "happy 5%"  imposta_sostitutiva 1750.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --contributi 4000
field "happy 15%" imposta_sostitutiva 5250.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.15 --contributi 4000
field "reddito"   reddito_imponibile  39000.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05

# --- edge: imposta floored at 0 when contributi exceed the base ---
field "imposta floor" imposta_sostitutiva 0.00 --ricavi 1000 --coefficiente 0.40 --aliquota 0.15 --contributi 5000

# --- edge: zero ricavi ---
field "zero ricavi" imposta_sostitutiva 0.00 --ricavi 0 --coefficiente 0.78 --aliquota 0.05

# --- edge: reject non-numeric / negative ricavi (exit 2) ---
exits "reject non-numeric" 2 --ricavi abc --coefficiente 0.78 --aliquota 0.05
exits "reject negative"    2 --ricavi -5  --coefficiente 0.78 --aliquota 0.05
exits "reject missing aliquota" 2 --ricavi 50000 --coefficiente 0.78
exits "reject bad inps mode" 2 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --inps gestione

# --- INPS: gestione separata (reddito * rate) ---
# 39000 * 0.2607 = 10167.30
field "inps separata" inps_stimato 10167.30 \
  --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --inps separata --inps-aliquota 0.2607

# --- INPS: artigiani/commercianti (fisso + eccedenza*rate) with and without 35% reduction ---
# reddito 39000; ecc = 39000-18555 = 20445; (4500 + 20445*0.24) = 9406.80
field "inps artigiani full"  inps_stimato 9406.80 \
  --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 \
  --inps artigiani --inps-aliquota 0.24 --inps-fisso 4500 --inps-minimale 18555 --inps-riduzione 0
# with 35% reduction: 9406.80 * 0.65 = 6114.42
field "inps artigiani -35%" inps_stimato 6114.42 \
  --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 \
  --inps artigiani --inps-aliquota 0.24 --inps-fisso 4500 --inps-minimale 18555 --inps-riduzione 0.35

# --- acconto branches ---
# below trigger (<=51.65) -> nothing due
field "acconto none" acconto_totale 0.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 50
# single rate (<=257.52)
field "acconto single tot"  acconto_totale  200.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 200
field "acconto single sec"  acconto_secondo 200.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 200
field "acconto single first" acconto_primo  0.00   --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 200
# split 40/60 (>257.52): 1750 -> 700 / 1050
field "acconto split first"  acconto_primo   700.00  --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 1750
field "acconto split second" acconto_secondo 1050.00 --ricavi 50000 --coefficiente 0.78 --aliquota 0.05 --imposta-precedente 1750

echo "-----------------------------------------"
echo "PASS=$pass  FAIL=$fail"
[ "$fail" = 0 ]
