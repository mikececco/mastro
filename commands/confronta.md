---
description: Forfettario vs SRL — quale conviene e quando ha senso passare. Confronto orientativo, non definitivo.
argument-hint: "[ricavi, costi reali stimati, codice ATECO, gestione INPS]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Input dell'utente: $ARGUMENTS

Obiettivo: aiutare a capire se conviene il **forfettario** o la **SRL**, e dove sta il punto
di pareggio. È un confronto **orientativo**: la decisione si prende col commercialista.

Procedura:
1. Leggi `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/forfettario.md` e
   `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/srl.md` (sezione "Forfettario vs SRL").
2. Raccogli (chiedi se manca): ricavi attesi, **costi reali** stimati (la leva del confronto),
   codice ATECO (coefficiente), gestione INPS.
3. **Lato forfettario** — calcolo deterministico:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc.sh --ricavi <N> --coefficiente <F> --aliquota <0.05|0.15> ...`
4. **Lato SRL** — stima **orientativa** (l'edizione SRL è in costruzione, non c'è ancora un
   calcolatore SRL dedicato): utile ≈ ricavi − costi inerenti; carico ≈ IRES 24% + IRAP ~3,9%
   sull'utile, **più** i maggiori costi di struttura (commercialista, bilancio) e la diversa
   gestione dell'IVA. Dichiara esplicitamente che è una stima qualitativa e cita `srl.md`.
5. Spiega la logica del pareggio: più i **costi reali** sono alti rispetto ai ricavi, più la
   **deducibilità** della SRL pesa a suo favore; con pochi costi e sotto gli 85k, il forfettario
   di solito vince per semplicità. Aggiungi i fattori non fiscali: responsabilità limitata,
   immagine, accesso al credito, costi e adempimenti.
6. **Conclusione**: niente verdetti secchi. Indica in quale direzione spingono i numeri dati e
   **rimanda al commercialista** per la decisione e il calcolo puntuale.
7. Cita le fonti. Chiudi con il disclaimer.
