# TODOS

## v1 — da completare prima del "pubblico"
- [x] **Verifica fiscale di `forfettario.md` e `esclusioni.md`** contro fonti ufficiali
      (AdE, Normattiva L. 190/2014, prassi). Fatto 2026-06-09 → `status: VERIFICATO`.
      Resta utile una conferma finale del titolare/commercialista.
- [x] **Aliquote/minimali INPS 2026** verificate contro INPS Circ. 8/2026 (Gestione Separata)
      e 14/2026 (Artigiani/Commercianti): minimale 18.808 €, fissi 4.521,36/4.611,64 €,
      separata 26,07%/24%, scaglione 56.224 €, riduzione 35% a domanda. In `forfettario.md`.
- [x] **Dogfood (esecuzione comandi)**: 19/19 scenari superati eseguendo i comandi sui file
      reali (cita-o-rifiuta, never-affirm, flag del tetto, rifiuti onesti). Bug trovato e corretto:
      ATECO 62 (software/IT) → **67%**, non 78% (errore di classificazione); aggiunto handling
      acconto primo anno e chiarita la regola disclaimer di `/chiedi`.
- [ ] **Dogfood (install reale)**: installare il plugin in Claude Code e far tornare `/tasse`
      sui propri numeri reali "all'euro". ← conferma finale.
- [ ] **Riverificare per il 2027** i valori temporanei: limite 35.000 € (base 30.000 €) e
      tutte le cifre INPS (annuali).

## v1.x
- [ ] **Harness di valutazione automatica dei comandi**: script che esegue ogni comando con
      `claude -p` (plugin caricato) e verifica che citi / rifiuti / avvisi sui dati scaduti.
      Serve una API key in CI: per questo è fuori dalla v1 (i test deterministici di
      `calc.sh`/`freshness.sh` restano CI-friendly senza chiave).
- [ ] **Split della conoscenza** in più file (requisiti, aliquote, INPS, scadenzario,
      esclusioni) quando `forfettario.md` diventa troppo grande. Prima, confrontare la
      granularità della repo svedese `smb-sverige` con la complessità reale del forfettario.

## v1.5 (la vera killer feature)
- [ ] **Lettore FatturaPA**: puntare Mastro alla cartella degli XML che già possiedi e farsi
      dire la posizione fiscale dell'anno (ricavi YTD, proiezione a fine anno, allerta vicino
      agli 85k, stima imposta/INPS/acconti sui numeri reali). Read-only, **consapevole del
      principio di cassa** (l'XML ha la data di emissione, non l'incasso: va riconciliato
      emesso-vs-pagato).

## CI / qualità
- [x] **CI**: GitHub Actions esegue `calc.test.sh` + `freshness.test.sh` a ogni push/PR.

## v2 — Edizione SRL
- [x] **Scheletro avviato**: comandi `/srl` e `/confronta` + conoscenza SRL iniziale.
- [x] **Conoscenza SRL strutturata** in `knowledge/2026/srl/`: `panoramica`, `ires`, `irap`,
      `soci`, `deducibilita`, `incentivi`. Introdotto il livello `status: CITATO`
      (`regole.md` §7): ogni cifra ha la sua fonte primaria, ma manca la seconda lettura →
      i comandi lo dichiarano nelle risposte.
- [x] **Calcolatore SRL** `scripts/calc-srl.sh` (IRES, IRAP, perdite art. 84, acconti) con
      28 test in CI. IRAP presa come input separato: la sua base non si deriva dall'utile.
- [x] **Corretta la regola trasversale cassa/competenza** (`regole.md` §3): il forfettario è
      per cassa, l'SRL per competenza, con l'eccezione dei compensi amministratori (cassa
      allargata al 12 gennaio).
- [x] **Chiuse le lacune di `deducibilita.md` §4** (2026-08-11): auto (art. 164: 20/70/80/100%),
      telefonia (art. 102 c. 9: 80%), rappresentanza (art. 108 + DM 19/11/2008: scaglioni
      1,5/0,6/0,4%, omaggi ≤50€), vitto/alloggio/trasferte (75%, tetti 180,76€/258,23€, **e la
      tracciabilità obbligatoria dal 2025**: contanti → indeducibilità totale), ammortamenti
      ordinari (artt. 102-103 + DM 31/12/1988: mobili 12%, EDP 20%, auto 25%; marchi/avviamento
      1/18 anche ai fini IRES), interessi passivi/ROL (art. 96, 30% del ROL fiscale post-ATAD,
      riporto ROL limitato a 5 anni). Restano scoperti solo IMU (lato IRES) e acconti/F24.
- [ ] **Acconti, scadenze e codici tributo F24** di IRES e IRAP: ricerca avviata 2026-08-11,
      **interrotta per limite di sessione API** (non per assenza di fonti) — da ripetere.
      ⚠️ I default di `calc-srl.sh` (`--acconto-perc 1.00`, `--acconto-primo-perc 0.40`,
      `--acconto-soglia 20.66`) sono **valori di lavoro non verificati**: da chiudere su
      fonte primaria e poi far leggere dalla conoscenza.
- [ ] **IMU su immobili strumentali**: percentuale di deducibilità ai fini IRES non ancora
      verificata (nota: ai fini IRAP è indeducibile, quello è già in `irap.md`).
- [ ] **Adempimenti dichiarativi SRL**: Redditi SC, approvazione e deposito bilancio (XBRL),
      LIPE, dichiarazione IVA annuale, 770, CU, diritto camerale, vidimazione libri.
- [ ] **Seconda lettura dei file `CITATO`** per promuoverli a `VERIFICATO` (idealmente con un
      commercialista). Coda di verifica già annotata dentro ciascun file.
- [ ] Generazione/trasmissione fattura elettronica via SDI; sync con piattaforme contabili.

## Strategia (vedi `docs/`)
- [x] Posizionamento deciso (2026-08-06): **intelligence layer + open rules layer**, beachhead
      SRL, il ledger non lo facciamo. `docs/strategia-opensource.md` +
      `docs/landscape-2026-08.md` + `docs/awareness-playbook.md`.
- [x] Sito `mastrofisco.it` (Astro) + deploy GitHub Pages; issue form, PR checklist, cron di
      freshness, release v0.2.0.
- [ ] Eseguire il playbook di awareness (marketplace Anthropic, awesome-italia-opensource,
      openaccountants, italia-corpus, issue OCA).
