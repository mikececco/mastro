---
description: Segnala possibili cause di esclusione dal forfettario. Non afferma MAI l'idoneità.
argument-hint: "[la tua situazione: redditi, partecipazioni, datore di lavoro, residenza]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md` — **in particolare la §5:
non affermare mai l'idoneità**.

Situazione descritta dall'utente: $ARGUMENTS

Procedura:
1. Leggi `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/esclusioni.md` e `forfettario.md`.
2. Confronta la situazione descritta con **ogni** causa di esclusione e **ogni** soglia.
3. Output in tre parti:
   - **Cause ostative che vedo** nella situazione descritta (ognuna con citazione).
   - **Cosa non posso valutare** perché l'utente non ha dato il dato → chiediglielo
     esplicitamente (es. partecipazioni societarie, % verso ex datore, residenza).
   - **Conclusione**: mai "sì, sei idoneo". Al massimo: *"Non vedo cause ostative tra quelle
     che conosco e che mi hai descritto, ma l'idoneità va confermata col commercialista."*
4. Chiudi con il disclaimer.

Ricorda: una causa di esclusione che l'utente non ha menzionato può comunque escluderlo.
Per questo non si dà mai il via libera.
