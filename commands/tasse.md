---
description: Stima imposta sostitutiva, INPS e acconti del forfettario (principio di cassa).
argument-hint: "[ricavi incassati, codice ATECO, anni di attività, gestione INPS, contributi versati]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Input grezzo dell'utente: $ARGUMENTS

Procedura:
1. **Raccogli gli input** (chiedi quelli mancanti, uno alla volta se serve):
   - ricavi **incassati** nell'anno (principio di cassa: non il fatturato emesso)
   - codice ATECO o descrizione attività → serve per il coefficiente
   - sei nei **primi 5 anni** e hai i requisiti start-up? (aliquota 5% vs 15% — vedi forfettario.md)
   - **gestione INPS**: separata | artigiani | commercianti | cassa professionale
   - **contributi già versati** nell'anno (per la deduzione, principio di cassa). Se non noti,
     puoi stimarli dall'INPS — dillo chiaramente.
2. **Risolvi il coefficiente** da `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/coefficienti-ateco.md`.
   Se l'attività/ATECO non è determinabile con certezza → **non inventare**: fermati e indica
   dove verificare (regola cita-o-rifiuta).
3. Leggi aliquote/minimali INPS da `forfettario.md` (ricorda all'utente che le cifre INPS
   vanno confermate per l'anno corrente).
4. **Esegui il calcolo deterministico** (non fare i conti a mente):
   ```
   sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc.sh \
     --ricavi <incassati> --coefficiente <0..1> --aliquota <0.05|0.15> \
     [--contributi <versati>] \
     [--inps separata|artigiani --inps-aliquota <F> --inps-fisso <N> --inps-minimale <N> --inps-riduzione <0|0.35>] \
     [--imposta-precedente <N>]
   ```
5. **ECHO-AND-CONFIRM**: prima dei numeri, ripeti il **coefficiente**, l'**aliquota** e
   l'assunzione "**ricavi incassati**" che hai usato. Così l'utente vede subito se si è
   classificato male.
6. Se i ricavi superano **85.000 €**: segnala in evidenza la conseguenza sul regime
   (uscita anno successivo vs immediata, vedi forfettario.md), non limitarti al numero.
7. Cita le fonti. Chiudi con il disclaimer.
