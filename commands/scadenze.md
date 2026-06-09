---
description: Elenca le scadenze fiscali del forfettario per l'anno (acconti, saldo, INPS, dichiarazione).
argument-hint: "[anno, eventuale imposta dell'anno precedente]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Input dell'utente: $ARGUMENTS

Procedura:
1. Leggi la sezione "Acconti e saldo" di `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/forfettario.md`.
2. Controlla la freschezza del file:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/freshness.sh --valid-to 2026-12-31`. Se scaduto, avvisa.
3. Elenca le scadenze con le date:
   - **Acconto** imposta sostitutiva: dovuto se l'imposta dell'anno precedente > 51,65 €.
     Rata unica 30/11 se ≤ 257,52 €; altrimenti 40% entro 30/06 + 60% entro 30/11.
   - **Saldo** dell'imposta: con F24 (tipicamente 30/06, salvo proroghe dell'anno).
   - **INPS**: secondo la gestione (separata: con i redditi; artigiani/commercianti: rate fisse).
   - **Dichiarazione dei redditi** (modello Redditi PF).
4. Se l'utente fornisce l'imposta dell'anno precedente, usa
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc.sh --imposta-precedente <N> ...` per dire se e come
   è dovuto l'acconto e in quante rate.
5. Cita le fonti. Chiudi con il disclaimer.
