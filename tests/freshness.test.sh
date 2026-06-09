#!/usr/bin/env sh
# Mastro — tests/freshness.test.sh
# Deterministic tests for the staleness gate (uses --today to avoid wall-clock flakiness).
# Run: sh tests/freshness.test.sh

set -u
FR="$(CDPATH= cd "$(dirname "$0")/.." && pwd)/scripts/freshness.sh"
pass=0; fail=0

state() { # desc want_state args...
  desc="$1"; want="$2"; shift 2
  got=$(sh "$FR" "$@" 2>/dev/null | awk -F= '$1=="STATO"{print $2}')
  if [ "$got" = "$want" ]; then pass=$((pass+1)); else fail=$((fail+1)); echo "FAIL: $desc -> want=$want got='$got'"; fi
}
code() { # desc want_exit args...
  desc="$1"; want="$2"; shift 2
  sh "$FR" "$@" >/dev/null 2>&1; c=$?
  if [ "$c" = "$want" ]; then pass=$((pass+1)); else fail=$((fail+1)); echo "FAIL: $desc -> exit want=$want got=$c"; fi
}

state "before valid_to is fresh"   fresco  --valid-to 2026-12-31 --today 2026-06-09
state "on valid_to is fresh"       fresco  --valid-to 2026-12-31 --today 2026-12-31
state "after valid_to is stale"    scaduto --valid-to 2026-12-31 --today 2027-01-01
code  "fresh exits 0"  0 --valid-to 2026-12-31 --today 2026-06-09
code  "stale exits 3"  3 --valid-to 2026-12-31 --today 2027-03-15
code  "bad date exits 2" 2 --valid-to 2026-13-40 --today 2026-06-09
code  "missing valid-to exits 2" 2 --today 2026-06-09

echo "-----------------------------------------"
echo "PASS=$pass  FAIL=$fail"
[ "$fail" = 0 ]
