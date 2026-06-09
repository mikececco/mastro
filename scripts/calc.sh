#!/usr/bin/env sh
# Mastro — scripts/calc.sh
# Pure-arithmetic forfettario calculator. Numbers in, key=value out.
#
# DESIGN (locked in /plan-eng-review):
#   - Pure arithmetic. The skill resolves ATECO->coefficiente and reads every
#     year-varying rate from knowledge/, then passes them here as arguments.
#   - NO fiscal-year constants are hardcoded, with one exception: the acconto
#     mechanics (the EUR 51.65 trigger, the EUR 257.52 single-vs-split threshold,
#     and the 40/60 split) are statutory mechanics, stable for decades.
#   - Deterministic and unit-testable (see tests/calc.test.sh). The model never
#     does this arithmetic; this script does.
#
# Formula (canonical):
#   reddito_imponibile = ricavi_incassati * coefficiente
#   imponibile_netto   = max(0, reddito_imponibile - contributi_versati_in_anno)
#   imposta            = imponibile_netto * aliquota        (aliquota = 0.05 | 0.15)
#
# Cash basis: 'ricavi' must be INCASSATI (collected), 'contributi' must be the
# amount actually VERSATO in the year. The skill is responsible for that framing.

set -eu

die() { echo "ERRORE: $*" >&2; exit 2; }

is_num() {
  # accept non-negative integer/decimal only; reject empty, negative, non-numeric, multi-dot
  case "$1" in
    ''|*[!0-9.]*) return 1 ;;
  esac
  awk -v x="$1" 'BEGIN { if (x+0==x && x>=0) exit 0; exit 1 }'
}

ricavi=""; coefficiente=""; aliquota=""; contributi="0"
inps="none"; inps_aliquota="0"; inps_fisso="0"; inps_minimale="0"; inps_riduzione="0"
imposta_precedente=""

while [ $# -gt 0 ]; do
  case "$1" in
    --ricavi)             ricavi="${2:-}"; shift 2 ;;
    --coefficiente)       coefficiente="${2:-}"; shift 2 ;;
    --aliquota)           aliquota="${2:-}"; shift 2 ;;
    --contributi)         contributi="${2:-}"; shift 2 ;;
    --inps)               inps="${2:-}"; shift 2 ;;
    --inps-aliquota)      inps_aliquota="${2:-}"; shift 2 ;;
    --inps-fisso)         inps_fisso="${2:-}"; shift 2 ;;
    --inps-minimale)      inps_minimale="${2:-}"; shift 2 ;;
    --inps-riduzione)     inps_riduzione="${2:-}"; shift 2 ;;
    --imposta-precedente) imposta_precedente="${2:-}"; shift 2 ;;
    -h|--help)
      echo "usage: calc.sh --ricavi N --coefficiente F --aliquota F [--contributi N]"
      echo "               [--inps none|separata|artigiani --inps-aliquota F"
      echo "                --inps-fisso N --inps-minimale N --inps-riduzione F]"
      echo "               [--imposta-precedente N]"
      exit 0 ;;
    *) die "argomento sconosciuto: $1" ;;
  esac
done

[ -n "$ricavi" ]       || die "manca --ricavi (ricavi incassati nell'anno)"
[ -n "$coefficiente" ] || die "manca --coefficiente (0..1)"
[ -n "$aliquota" ]     || die "manca --aliquota (0.05 | 0.15)"

for pair in \
  "$ricavi:ricavi" "$coefficiente:coefficiente" "$aliquota:aliquota" "$contributi:contributi" \
  "$inps_aliquota:inps-aliquota" "$inps_fisso:inps-fisso" "$inps_minimale:inps-minimale" \
  "$inps_riduzione:inps-riduzione"
do
  val=${pair%:*}; name=${pair#*:}
  is_num "$val" || die "$name non è un numero valido (>=0): '$val'"
done
[ -z "$imposta_precedente" ] || is_num "$imposta_precedente" || die "imposta-precedente non valida: '$imposta_precedente'"
case "$inps" in none|separata|artigiani) ;; *) die "--inps deve essere none|separata|artigiani" ;; esac

awk \
  -v ricavi="$ricavi" -v coeff="$coefficiente" -v aliq="$aliquota" -v contributi="$contributi" \
  -v inps="$inps" -v inps_aliq="$inps_aliquota" -v inps_fisso="$inps_fisso" \
  -v inps_min="$inps_minimale" -v inps_rid="$inps_riduzione" \
  -v imposta_prec="${imposta_precedente:-}" '
BEGIN {
  reddito = ricavi * coeff

  imponibile_netto = reddito - contributi
  if (imponibile_netto < 0) imponibile_netto = 0

  imposta = imponibile_netto * aliq
  if (imposta < 0) imposta = 0

  inps_dovuto = 0
  if (inps == "separata") {
    inps_dovuto = reddito * inps_aliq
  } else if (inps == "artigiani") {
    ecc = reddito - inps_min
    if (ecc < 0) ecc = 0
    inps_dovuto = (inps_fisso + ecc * inps_aliq) * (1 - inps_rid)
  }
  if (inps_dovuto < 0) inps_dovuto = 0

  base = (imposta_prec == "") ? imposta : imposta_prec
  acc_tot = 0; acc_1 = 0; acc_2 = 0; acc_modo = "nessuno"
  if (base > 51.65) {
    acc_tot = base
    if (base <= 257.52) { acc_1 = 0; acc_2 = base; acc_modo = "unico (30/11)" }
    else { acc_1 = 0.40 * base; acc_2 = 0.60 * base; acc_modo = "40/60 (30/06 + 30/11)" }
  }

  printf "reddito_imponibile=%.2f\n", reddito
  printf "imponibile_netto=%.2f\n", imponibile_netto
  printf "imposta_sostitutiva=%.2f\n", imposta
  printf "inps_stimato=%.2f\n", inps_dovuto
  printf "acconto_totale=%.2f\n", acc_tot
  printf "acconto_primo=%.2f\n", acc_1
  printf "acconto_secondo=%.2f\n", acc_2
  printf "acconto_modo=%s\n", acc_modo
}'
