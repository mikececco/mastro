#!/usr/bin/env sh
# Mastro — scripts/freshness.sh
# Deterministic staleness gate. The model is unreliable at date-vs-valid_to
# arithmetic, so this script makes the call. A command runs it before answering
# with a given year's data.
#
# Usage:  freshness.sh --valid-to YYYY-MM-DD [--today YYYY-MM-DD]
# Output: STATO=fresco | STATO=scaduto  (+ a human message on stderr)
# Exit:   0 = fresco, 3 = scaduto, 2 = input error

set -eu

valid_to=""
today=""

while [ $# -gt 0 ]; do
  case "$1" in
    --valid-to) valid_to="${2:-}"; shift 2 ;;
    --today)    today="${2:-}"; shift 2 ;;
    -h|--help)  echo "usage: freshness.sh --valid-to YYYY-MM-DD [--today YYYY-MM-DD]"; exit 0 ;;
    *) echo "ERRORE: argomento sconosciuto: $1" >&2; exit 2 ;;
  esac
done

[ -n "$valid_to" ] || { echo "ERRORE: manca --valid-to" >&2; exit 2; }

# default today = system date (UTC) unless overridden (override keeps tests deterministic)
[ -n "$today" ] || today=$(date -u +%Y-%m-%d)

valid_re='^[0-9][0-9][0-9][0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$'
echo "$valid_to" | grep -Eq "$valid_re" || { echo "ERRORE: --valid-to non è YYYY-MM-DD: '$valid_to'" >&2; exit 2; }
echo "$today"    | grep -Eq "$valid_re" || { echo "ERRORE: --today non è YYYY-MM-DD: '$today'" >&2; exit 2; }

# lexicographic comparison works for zero-padded ISO dates
if [ "$today" \> "$valid_to" ]; then
  echo "STATO=scaduto"
  echo "⚠️  Dati validi fino al $valid_to; oggi è $today. Verifica la Legge di Bilancio corrente." >&2
  exit 3
else
  echo "STATO=fresco"
  exit 0
fi
