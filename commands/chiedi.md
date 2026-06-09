---
description: Rispondi a una domanda sul regime forfettario, citando la fonte o rifiutando se non c'è.
argument-hint: "[la tua domanda sul forfettario]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Domanda dell'utente: $ARGUMENTS

Procedura:
1. Leggi `regole.md` e i file pertinenti in `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/`.
2. Controlla la freschezza del file che stai per usare:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/freshness.sh --valid-to <valid_to del file>`.
   Se `STATO=scaduto`, avvisa prima di rispondere.
3. Rispondi **solo** con quanto presente nei file. Cita file + riferimento normativo + anno.
4. Se nessun file copre la domanda: dillo e fermati. Non inventare ("Non ho una fonte
   verificata su questo. Chiedi al commercialista.").
5. Chiusura, in base al tipo di risposta:
   - Se hai dato **un numero o un giudizio** (anche solo in parte fondato): cita la fonte **e**
     chiudi con il disclaimer (regole.md §4).
   - Se è un **puro rifiuto** (nessun numero/giudizio): basta la frase "Chiedi al commercialista",
     senza citazione né disclaimer.
