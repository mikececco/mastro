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
   - `deducibilita.md` → principi, accantonamenti, erogazioni liberali, deducibilità puntuale
     (auto, telefonia, rappresentanza, vitto/trasferte, ammortamenti, interessi passivi, IMU)
   - `incentivi.md` → iperammortamento 2026, maggiorazione nuove assunzioni
   - `acconti-scadenze.md` → acconti/saldo IRES-IRAP, codici tributo F24, LIPE, IVA annuale,
     CU/770, diritto camerale, vidimazione libri, deposito bilancio
2. Controlla la freschezza in modo deterministico:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/freshness.sh --valid-to <valid_to del file letto>`
3. Rispondi **solo** con quanto presente nei file, citando file + riferimento normativo + anno.
4. **Livello di verifica (`regole.md` §7).** I file SRL sono `status: CITATO`: rispondi, cita,
   e aggiungi l'avviso *"⚠️ Questa parte è documentata con le fonti ma non ancora
   ricontrollata: verifica col commercialista prima di decidere."*
5. **Rifiuta onestamente** su ciò che non è scritto — in particolare: costituzione e
   governance, operazioni straordinarie (vedi `panoramica.md` per l'elenco aggiornato).
   Formula: "L'edizione SRL non copre ancora questo: non ho una fonte verificata. Chiedi al
   commercialista." **Non inventare percentuali né codici tributo.**
   ⚠️ I **codici tributo F24 IRAP** (3800/3812/3813) **non** sono da rifiutare come assenti:
   sono in `acconti-scadenze.md` §4, `CITATO`. Rispondi **con** il codice, ma aggiungi il
   caveat rafforzato specifico: "non confermato sullo strumento ufficiale di ricerca AdE in
   questa sessione — verifica il codice esatto prima di usarlo in un F24." I codici IRES
   (2001/2002/2003) sono meglio documentati (Ris. AdE 76/E/2004): nessun caveat aggiuntivo
   oltre lo standard CITATO.
6. **Competenza, non cassa** (`regole.md` §3). Se l'utente ragiona su fatture o incassi,
   chiarisci che l'SRL è tassata per competenza e che dalle sole fatture non si ricava l'utile
   (mancano ammortamenti, rimanenze, ratei, TFR, costo del personale). Ricorda l'eccezione:
   compensi amministratori deducibili per **cassa**, allargata al 12 gennaio.
7. Se serve un calcolo IRES/IRAP deterministico, usa
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc-srl.sh` passando le aliquote lette dalla conoscenza
   (l'IRAP richiede `--irap-imponibile`: **non derivarlo dall'utile**, le basi sono diverse).
   Dichiara sempre che è una stima.
8. Per il confronto col forfettario usa invece `/confronta`.
9. **Chiusura** (`regole.md` §4, come `/chiedi`): se hai dato un numero, un'aliquota o un
   giudizio, cita la fonte **e** chiudi col disclaimer. Se è un **puro rifiuto** (nessun
   numero né giudizio, solo "chiedi al commercialista"), basta quello — niente disclaimer
   ridondante.
