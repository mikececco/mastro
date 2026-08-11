---
description: Domande sulla SRL (IRES, IRAP, IVA, deducibilità, dividendi, INPS di soci e amministratori). Risponde solo da fonte citata.
argument-hint: "[la tua domanda sulla SRL]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Domanda dell'utente: $ARGUMENTS

Procedura:
1. Leggi `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/srl/panoramica.md` (indice ed elenco di ciò che
   l'edizione **non** copre), poi **solo il file pertinente** alla domanda:
   - `ires.md` → IRES, aliquota, utile → reddito imponibile, perdite
   - `irap.md` → IRAP: aliquote regionali, base imponibile, deduzioni sul costo del lavoro
   - `soci.md` → dividendi, compenso amministratore, IRPEF, INPS di soci e amministratori
   - `deducibilita.md` → principi, accantonamenti, erogazioni liberali
   - `incentivi.md` → iperammortamento 2026, maggiorazione nuove assunzioni
2. Controlla la freschezza in modo deterministico:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/freshness.sh --valid-to <valid_to del file letto>`
3. Rispondi **solo** con quanto presente nei file, citando file + riferimento normativo + anno.
4. **Livello di verifica (`regole.md` §7).** I file SRL sono `status: CITATO`: rispondi, cita,
   e aggiungi l'avviso *"⚠️ Questa parte è documentata con le fonti ma non ancora
   ricontrollata: verifica col commercialista prima di decidere."*
5. **Rifiuta onestamente** su ciò che non è scritto — in particolare: **acconti, scadenze e
   codici tributo F24** di IRES/IRAP, **IMU** ai fini IRES, costituzione e governance,
   operazioni straordinarie (vedi `panoramica.md` per l'elenco aggiornato). Formula:
   "L'edizione SRL non copre ancora questo: non ho una fonte verificata. Chiedi al
   commercialista." **Non inventare percentuali né codici tributo.**
   (Auto, telefonia, rappresentanza, vitto/trasferte, ammortamenti e interessi passivi **sono**
   coperti in `deducibilita.md` §4: rispondi da lì, citando.)
6. **Competenza, non cassa** (`regole.md` §3). Se l'utente ragiona su fatture o incassi,
   chiarisci che l'SRL è tassata per competenza e che dalle sole fatture non si ricava l'utile
   (mancano ammortamenti, rimanenze, ratei, TFR, costo del personale). Ricorda l'eccezione:
   compensi amministratori deducibili per **cassa**, allargata al 12 gennaio.
7. Se serve un calcolo IRES/IRAP deterministico, usa
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc-srl.sh` passando le aliquote lette dalla conoscenza
   (l'IRAP richiede `--irap-imponibile`: **non derivarlo dall'utile**, le basi sono diverse).
   Dichiara sempre che è una stima.
8. Per il confronto col forfettario usa invece `/confronta`.
9. Chiudi con il disclaimer.
