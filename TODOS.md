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
- [x] **Scheletro avviato**: comandi `/srl` e `/confronta` + `knowledge/2026/srl.md` (solo i
      fatti stabili: IRES 24%, IRAP ~3,9%, IVA con detrazione, principio di inerenza). Grazie al
      cita-o-rifiuta, `/srl` è onesto fin da subito su ciò che non è ancora scritto.
- [ ] **Contenuto fiscale SRL di dettaglio** (da scrivere e verificare): percentuali di
      deducibilità (auto, telefonia, rappresentanza, vitto/alloggio), ammortamenti, calcolo
      IRES/IRAP puntuale, regime dividendi, bilancio.
- [ ] **Calcolatore SRL** dedicato (es. `scripts/calc-srl.sh`) per dare a `/confronta` un numero
      SRL deterministico invece di una stima qualitativa.
- [ ] Generazione/trasmissione fattura elettronica via SDI; sync con piattaforme contabili.
