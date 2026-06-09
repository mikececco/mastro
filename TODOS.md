# TODOS

## v1 — da completare prima del "pubblico"
- [ ] **Verifica fiscale di `forfettario.md` e `esclusioni.md`** dal titolare (forfettario) +
      controllo contro una fonte ufficiale. Oggi sono `status: DRAFT_DA_VERIFICARE`.
- [ ] **Confermare aliquote/minimali INPS dell'anno** (gestione separata, artigiani/commercianti,
      riduzione 35%) con la circolare INPS, poi passarle ai comandi come parametri.
- [ ] **Dogfood**: eseguire i golden cases (`tests/golden-cases.md`) installando il plugin;
      far tornare `/tasse` sui propri numeri reali "all'euro".

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
- [x] **Scheletro avviato**: comandi `/srl` e `/confronta` + `knowledge/2026/srl.md` (solo i
      fatti stabili: IRES 24%, IRAP ~3,9%, IVA con detrazione, principio di inerenza). Grazie al
      cita-o-rifiuta, `/srl` è onesto fin da subito su ciò che non è ancora scritto.
- [ ] **Contenuto fiscale SRL di dettaglio** (da scrivere e verificare): percentuali di
      deducibilità (auto, telefonia, rappresentanza, vitto/alloggio), ammortamenti, calcolo
      IRES/IRAP puntuale, regime dividendi, bilancio.
- [ ] **Calcolatore SRL** dedicato (es. `scripts/calc-srl.sh`) per dare a `/confronta` un numero
      SRL deterministico invece di una stima qualitativa.
- [ ] Generazione/trasmissione fattura elettronica via SDI; sync con piattaforme contabili.
