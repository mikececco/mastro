---
description: Domande sulla SRL (IRES, IRAP, IVA, deducibilità). v2 in costruzione — risponde solo da fonte verificata.
argument-hint: "[la tua domanda sulla SRL]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Domanda dell'utente: $ARGUMENTS

Procedura:
1. Leggi `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/srl.md`.
2. Rispondi **solo** con quanto presente nel file. Cita fonte + anno.
3. **Importante:** `srl.md` è ancora uno scheletro (v2). Se la domanda riguarda dettagli non
   ancora scritti (percentuali di deducibilità di auto/telefonia/rappresentanza, ammortamenti,
   bilancio, calcolo IRES/IRAP puntuale), **dillo chiaramente e fermati**:
   "L'edizione SRL è in costruzione: non ho ancora una fonte verificata su questo. Chiedi al
   commercialista." Non inventare numeri SRL.
4. Per un confronto con il forfettario usa invece `/confronta`.
5. Chiudi con il disclaimer.
