# Golden cases — comportamento dei comandi (verifica manuale durante il dogfood)

I comandi (`/chiedi`, `/tasse`, `/idoneo`, `/scadenze`) sono prompt eseguiti dal modello,
quindi non hanno test automatici in v1 (l'harness headless è un TODO v1.x). Questi sono i
casi da verificare a mano installando il plugin. Ognuno ha l'esito atteso.

## /tasse — classificazione degli input (il rischio vero, non l'aritmetica)
- [ ] **Coefficiente giusto (caso software/IT, errore comune)**: "ricavi 50.000, consulenza
      informatica / sviluppo software (ATECO 62)" → coefficiente **67%** (Altre attività), **NON 78%**;
      l'output **ripete** coefficiente+aliquota+"incassati" (echo-and-confirm).
- [ ] **Codice non elencato → 67%**: un ATECO non presente nelle righe 1–8 → 67%, non un 78% indovinato.
- [ ] **Acconto primo anno**: "primo anno di attività" → **nessun acconto da storico**
      (imposta-precedente = 0); spiega il metodo previsionale, non mostra un acconto inventato.
- [ ] **ATECO sconosciuto**: "attività XYZ non chiara" → **rifiuta** di scegliere un
      coefficiente, indica dove verificare. NON inventa una percentuale.
- [ ] **5% non spettante**: "primo anno ma è la prosecuzione del mio lavoro da dipendente"
      → applica **15%**, spiega perché il 5% non spetta.
- [ ] **Contributi non versati**: l'utente non ha pagato l'INPS → li **stima** e lo dichiara,
      e deduce solo quelli effettivamente versati nell'anno (cassa).

## /tasse — soglie cap
- [ ] **Sforamento 85–100k**: ricavi 92.000 → calcola ma **segnala in evidenza** l'uscita
      dal regime dall'anno successivo.
- [ ] **Oltre 100k**: ricavi 110.000 → segnala uscita **immediata** con IVA dovuta.

## /chiedi — cita-o-rifiuta
- [ ] **Coperto**: "qual è il tetto dei ricavi?" → risponde 85.000 € **con citazione** (file + norma + anno).
- [ ] **Non coperto**: "posso dedurre l'auto aziendale in forfettario?" (non è nel knowledge)
      → **rifiuta** e rimanda al commercialista. NON allucina una risposta.

## /chiedi — freschezza
- [ ] **Scaduto**: forzare `--today 2027-03-01` contro `valid_to 2026-12-31`
      → il comando **avvisa** che i dati potrebbero essere superati prima di rispondere.

## /idoneo — mai affermare l'idoneità
- [ ] **Esclusione visibile**: "ho una S.r.l. che controllo nello stesso settore"
      → segnala la causa ostativa (controllo S.r.l. riconducibile), con citazione.
- [ ] **Nessuna esclusione visibile**: situazione pulita descritta → **non** dice "sì idoneo";
      dice "non vedo cause ostative tra quelle che conosco, conferma col commercialista" e
      chiede i dati mancanti (partecipazioni, % verso ex datore, residenza).

## Disclaimer
- [ ] Ogni risposta con un numero o un giudizio chiude con il disclaimer "co-pilota, non sostituto".
