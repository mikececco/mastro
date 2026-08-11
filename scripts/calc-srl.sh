#!/usr/bin/env sh
# Mastro — scripts/calc-srl.sh
# Pure-arithmetic SRL calculator (IRES + IRAP + acconti). Numbers in, key=value out.
#
# DESIGN (same contract as calc.sh):
#   - Pure arithmetic. NO fiscal-year constants hardcoded: aliquote, soglie e
#     percentuali di acconto arrivano come argomenti, letti dalla conoscenza
#     (knowledge/<anno>/srl/*.md). L'unica eccezione sono le meccaniche statutarie
#     dell'acconto (split 40/60, soglia minima), stabili da decenni e comunque
#     sovrascrivibili da CLI.
#   - Deterministic and unit-testable (tests/calc-srl.test.sh).
#
# COMPETENZA, non cassa: l'SRL è tassata per competenza (art. 109 TUIR). Questo
# script parte dall'UTILE ANTE IMPOSTE di bilancio, non dalle fatture incassate.
# Chi lo chiama è responsabile di dire che, se l'utile è stimato dalle fatture,
# il risultato è una STIMA (mancano ammortamenti, rimanenze, ratei, TFR...).
#
# Catena di calcolo:
#   reddito_lordo        = utile + variazioni_aumento - variazioni_diminuzione
#   perdite_scomputate   = min(perdite_pregresse, reddito_lordo * limite_perdite)
#   reddito_imponibile   = max(0, reddito_lordo - perdite_scomputate)
#   ires                 = reddito_imponibile * ires_aliquota
#   irap                 = max(0, irap_imponibile) * irap_aliquota
#
# NOTA IRAP: la base IRAP NON è il reddito IRES. È il valore della produzione
# netta (lettere A meno B dell'art. 2425 c.c., con esclusioni: art. 5 D.Lgs.
# 446/1997), quindi ignora interessi e proventi finanziari, e ha regole proprie
# sul costo del lavoro (indeducibile in via generale come voce B9, ma poi
# integralmente deducibile per i dipendenti a tempo indeterminato ex art. 11
# c. 4-octies, riscritto dal D.L. 73/2022 — le vecchie deduzioni forfettarie
# del "cuneo fiscale" sono ABROGATE). Per questo `--irap-imponibile` è un input
# separato: lo calcola chi chiama, leggendo knowledge/2026/srl/irap.md.
# Non derivarlo dall'utile: una SRL con utile zero può dovere IRAP.

set -eu

die() { echo "ERRORE: $*" >&2; exit 2; }

is_num() {
  # accept non-negative integer/decimal only
  case "$1" in
    ''|*[!0-9.]*) return 1 ;;
  esac
  awk -v x="$1" 'BEGIN { if (x+0==x && x>=0) exit 0; exit 1 }'
}

is_signed_num() {
  # accept optionally-negative integer/decimal (utile può essere una perdita)
  case "$1" in
    ''|*[!0-9.-]*) return 1 ;;
  esac
  awk -v x="$1" 'BEGIN { if (x+0==x) exit 0; exit 1 }'
}

utile=""; var_aum="0"; var_dim="0"
perdite="0"; limite_perdite="0.80"
ires_aliquota=""
irap_imponibile=""; irap_aliquota="0"
ires_precedente=""; irap_precedente=""
acconto_perc="1.00"; acconto_primo_perc="0.40"; acconto_soglia="20.66"

while [ $# -gt 0 ]; do
  case "$1" in
    --utile)                utile="${2:-}"; shift 2 ;;
    --variazioni-aumento)   var_aum="${2:-}"; shift 2 ;;
    --variazioni-diminuzione) var_dim="${2:-}"; shift 2 ;;
    --perdite-pregresse)    perdite="${2:-}"; shift 2 ;;
    --limite-perdite)       limite_perdite="${2:-}"; shift 2 ;;
    --ires-aliquota)        ires_aliquota="${2:-}"; shift 2 ;;
    --irap-imponibile)      irap_imponibile="${2:-}"; shift 2 ;;
    --irap-aliquota)        irap_aliquota="${2:-}"; shift 2 ;;
    --ires-precedente)      ires_precedente="${2:-}"; shift 2 ;;
    --irap-precedente)      irap_precedente="${2:-}"; shift 2 ;;
    --acconto-perc)         acconto_perc="${2:-}"; shift 2 ;;
    --acconto-primo-perc)   acconto_primo_perc="${2:-}"; shift 2 ;;
    --acconto-soglia)       acconto_soglia="${2:-}"; shift 2 ;;
    -h|--help)
      cat <<'EOF'
usage: calc-srl.sh --utile N --ires-aliquota F
                   [--variazioni-aumento N] [--variazioni-diminuzione N]
                   [--perdite-pregresse N] [--limite-perdite F]
                   [--irap-imponibile N --irap-aliquota F]
                   [--ires-precedente N] [--irap-precedente N]
                   [--acconto-perc F] [--acconto-primo-perc F] [--acconto-soglia N]

--utile          utile ANTE IMPOSTE di bilancio (può essere negativo = perdita)
--irap-imponibile  valore della produzione netta IRAP (input separato: la base
                   IRAP non si deriva dall'utile — costo del lavoro indeducibile)
Le aliquote arrivano da knowledge/<anno>/srl/: questo script non le conosce.
EOF
      exit 0 ;;
    *) die "argomento sconosciuto: $1" ;;
  esac
done

[ -n "$utile" ]         || die "manca --utile (utile ante imposte di bilancio)"
[ -n "$ires_aliquota" ] || die "manca --ires-aliquota (es. 0.24)"

is_signed_num "$utile" || die "utile non è un numero valido: '$utile'"
for pair in \
  "$var_aum:variazioni-aumento" "$var_dim:variazioni-diminuzione" \
  "$perdite:perdite-pregresse" "$limite_perdite:limite-perdite" \
  "$ires_aliquota:ires-aliquota" "$irap_aliquota:irap-aliquota" \
  "$acconto_perc:acconto-perc" "$acconto_primo_perc:acconto-primo-perc" \
  "$acconto_soglia:acconto-soglia"
do
  val=${pair%:*}; name=${pair#*:}
  is_num "$val" || die "$name non è un numero valido (>=0): '$val'"
done
[ -z "$irap_imponibile" ] || is_signed_num "$irap_imponibile" || die "irap-imponibile non valido: '$irap_imponibile'"
[ -z "$ires_precedente" ] || is_num "$ires_precedente" || die "ires-precedente non valido: '$ires_precedente'"
[ -z "$irap_precedente" ] || is_num "$irap_precedente" || die "irap-precedente non valido: '$irap_precedente'"

awk \
  -v utile="$utile" -v var_aum="$var_aum" -v var_dim="$var_dim" \
  -v perdite="$perdite" -v lim_perdite="$limite_perdite" \
  -v ires_aliq="$ires_aliquota" \
  -v irap_imp="${irap_imponibile:-}" -v irap_aliq="$irap_aliquota" \
  -v ires_prec="${ires_precedente:-}" -v irap_prec="${irap_precedente:-}" \
  -v acc_perc="$acconto_perc" -v acc_primo_perc="$acconto_primo_perc" \
  -v acc_soglia="$acconto_soglia" '
function acconto(base, perc, primo_perc, soglia, prefix) {
  tot = 0; primo = 0; secondo = 0; modo = "nessuno"
  if (base > soglia) {
    tot = base * perc
    primo = tot * primo_perc
    secondo = tot - primo
    modo = "due rate"
  }
  printf "%s_totale=%.2f\n", prefix, tot
  printf "%s_primo=%.2f\n", prefix, primo
  printf "%s_secondo=%.2f\n", prefix, secondo
  printf "%s_modo=%s\n", prefix, modo
}
BEGIN {
  reddito_lordo = utile + var_aum - var_dim

  # perdite pregresse: scomputabili entro il limite (art. 84 TUIR), e solo su reddito positivo
  scomputo = 0
  if (reddito_lordo > 0 && perdite > 0) {
    max_scomputo = reddito_lordo * lim_perdite
    scomputo = (perdite < max_scomputo) ? perdite : max_scomputo
  }

  reddito_imponibile = reddito_lordo - scomputo
  if (reddito_imponibile < 0) reddito_imponibile = 0

  ires = reddito_imponibile * ires_aliq
  if (ires < 0) ires = 0

  irap = 0
  if (irap_imp != "") {
    base_irap = irap_imp + 0
    if (base_irap < 0) base_irap = 0
    irap = base_irap * irap_aliq
  }

  printf "reddito_lordo=%.2f\n", reddito_lordo
  printf "perdite_scomputate=%.2f\n", scomputo
  printf "reddito_imponibile_ires=%.2f\n", reddito_imponibile
  printf "ires=%.2f\n", ires
  printf "irap=%.2f\n", irap
  printf "imposte_totali=%.2f\n", ires + irap

  base_acc_ires = (ires_prec == "") ? ires : ires_prec + 0
  acconto(base_acc_ires, acc_perc, acc_primo_perc, acc_soglia, "acconto_ires")

  base_acc_irap = (irap_prec == "") ? irap : irap_prec + 0
  acconto(base_acc_irap, acc_perc, acc_primo_perc, acc_soglia, "acconto_irap")
}'
