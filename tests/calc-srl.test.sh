#!/usr/bin/env sh
# Mastro — tests/calc-srl.test.sh
# Deterministic unit tests for scripts/calc-srl.sh. No API key, no network, CI-friendly.
# Run: sh tests/calc-srl.test.sh   (exit 0 = all pass)

set -u
CALC="$(CDPATH= cd "$(dirname "$0")/.." && pwd)/scripts/calc-srl.sh"
pass=0; fail=0

field() {
  desc="$1"; key="$2"; want="$3"; shift 3
  got=$(sh "$CALC" "$@" 2>/dev/null | awk -F= -v k="$key" '$1==k{print $2}')
  if [ "$got" = "$want" ]; then
    pass=$((pass+1))
  else
    fail=$((fail+1)); echo "FAIL: $desc -> $key want=$want got='$got'"
  fi
}

exits() {
  desc="$1"; want="$2"; shift 2
  sh "$CALC" "$@" >/dev/null 2>&1; code=$?
  if [ "$code" = "$want" ]; then
    pass=$((pass+1))
  else
    fail=$((fail+1)); echo "FAIL: $desc -> exit want=$want got=$code"
  fi
}

# --- IRES: happy path ---
# utile 100000, nessuna variazione -> imponibile 100000; IRES 24% = 24000
field "ires base"        ires 24000.00 --utile 100000 --ires-aliquota 0.24
field "imponibile base"  reddito_imponibile_ires 100000.00 --utile 100000 --ires-aliquota 0.24

# --- variazioni fiscali (il cuore della derivazione: utile != imponibile) ---
# 100000 + 5000 - 2000 = 103000 -> IRES 24720
field "variazioni"       reddito_imponibile_ires 103000.00 \
  --utile 100000 --variazioni-aumento 5000 --variazioni-diminuzione 2000 --ires-aliquota 0.24
field "variazioni ires"  ires 24720.00 \
  --utile 100000 --variazioni-aumento 5000 --variazioni-diminuzione 2000 --ires-aliquota 0.24

# --- perdite pregresse: limite 80% (art. 84 TUIR) ---
# reddito 100000, perdite 100000 -> scomputo max 80000, imponibile 20000, IRES 4800
field "perdite cap 80%"  perdite_scomputate 80000.00 \
  --utile 100000 --perdite-pregresse 100000 --ires-aliquota 0.24
field "perdite imponib." reddito_imponibile_ires 20000.00 \
  --utile 100000 --perdite-pregresse 100000 --ires-aliquota 0.24
field "perdite ires"     ires 4800.00 \
  --utile 100000 --perdite-pregresse 100000 --ires-aliquota 0.24
# perdite minori del cap: scomputo pieno (30000 < 80000)
field "perdite sotto cap" perdite_scomputate 30000.00 \
  --utile 100000 --perdite-pregresse 30000 --ires-aliquota 0.24
# limite sovrascrivibile (es. 100% per perdite dei primi 3 esercizi)
field "perdite limite 100%" perdite_scomputate 100000.00 \
  --utile 100000 --perdite-pregresse 100000 --limite-perdite 1.00 --ires-aliquota 0.24

# --- perdita d'esercizio: niente imposte, niente scomputo ---
field "perdita: ires 0"    ires 0.00 --utile -50000 --ires-aliquota 0.24
field "perdita: imponib 0" reddito_imponibile_ires 0.00 --utile -50000 --ires-aliquota 0.24
field "perdita: no scomputo" perdite_scomputate 0.00 \
  --utile -50000 --perdite-pregresse 100000 --ires-aliquota 0.24

# --- IRAP: base separata dall'IRES (costo del lavoro indeducibile) ---
# irap_imponibile 150000 * 3,9% = 5850
field "irap"        irap 5850.00 \
  --utile 100000 --ires-aliquota 0.24 --irap-imponibile 150000 --irap-aliquota 0.039
# IRAP dovuta anche con utile a zero (base IRAP diversa: è il punto)
field "irap con utile 0" irap 3900.00 \
  --utile 0 --ires-aliquota 0.24 --irap-imponibile 100000 --irap-aliquota 0.039
# senza --irap-imponibile l'IRAP non si inventa
field "irap assente" irap 0.00 --utile 100000 --ires-aliquota 0.24
# totale imposte = IRES + IRAP
field "imposte totali" imposte_totali 29850.00 \
  --utile 100000 --ires-aliquota 0.24 --irap-imponibile 150000 --irap-aliquota 0.039

# --- acconti: split e soglia ---
# IRES 24000 -> acconto 100% = 24000, split 40/60 = 9600 / 14400
field "acconto ires tot"  acconto_ires_totale  24000.00 --utile 100000 --ires-aliquota 0.24
field "acconto ires 1a"   acconto_ires_primo    9600.00 --utile 100000 --ires-aliquota 0.24
field "acconto ires 2a"   acconto_ires_secondo 14400.00 --utile 100000 --ires-aliquota 0.24
# metodo storico: base = imposta dell'anno precedente, non quella corrente
field "acconto storico"   acconto_ires_totale  10000.00 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 10000
# sotto soglia -> nessun acconto
field "acconto sotto soglia" acconto_ires_totale 0.00 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 10
field "acconto modo nessuno" acconto_ires_modo "nessuno" \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 10
# acconto IRAP calcolato a sua volta
field "acconto irap tot" acconto_irap_totale 5850.00 \
  --utile 100000 --ires-aliquota 0.24 --irap-imponibile 150000 --irap-aliquota 0.039

# --- acconto: collasso a rata unica se la prima rata non supera 103 € (art. 17 c.3 DPR 435/2001) ---
# base 200 -> tot 200, prima rata teorica 80 <= 103 -> tutto a novembre
field "acconto unica tot"    acconto_ires_totale  200.00 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 200
field "acconto unica primo"  acconto_ires_primo   0.00 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 200
field "acconto unica secondo" acconto_ires_secondo 200.00 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 200
field "acconto unica modo"   acconto_ires_modo "unica (30/11)" \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 200
# confine esatto: prima rata = 103.00 (base 257.5) -> ancora unica ("non supera" = <=)
field "acconto confine unica" acconto_ires_modo "unica (30/11)" \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 257.5
# appena sopra il confine: prima rata 103.20 (base 258) -> due rate
field "acconto confine split" acconto_ires_modo "due rate (30/06 + 30/11)" \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 258
field "acconto confine split primo" acconto_ires_primo 103.20 \
  --utile 100000 --ires-aliquota 0.24 --ires-precedente 258

# --- validazione input ---
exits "reject missing utile"     2 --ires-aliquota 0.24
exits "reject missing aliquota"  2 --utile 100000
exits "reject non-numeric utile" 2 --utile abc --ires-aliquota 0.24
exits "reject bad arg"           2 --utile 100000 --ires-aliquota 0.24 --boh 1
exits "accept negative utile"    0 --utile -1000 --ires-aliquota 0.24

echo "-----------------------------------------"
echo "PASS=$pass  FAIL=$fail"
[ "$fail" = 0 ]
