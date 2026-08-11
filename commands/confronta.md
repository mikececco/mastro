---
description: Forfettario vs SRL — quale conviene e quando ha senso passare. Confronto orientativo, mostra i poli e non un numero unico.
argument-hint: "[ricavi, costi reali stimati, codice ATECO, regione, gestione INPS]"
---
Segui le regole in `${CLAUDE_PLUGIN_ROOT}/knowledge/regole.md`.

Input dell'utente: $ARGUMENTS

Obiettivo: capire se conviene il **forfettario** o la **SRL**, e quali leve spostano l'ago.
È un confronto **orientativo**: la decisione si prende col commercialista.

Procedura:
1. Leggi `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/forfettario.md` e
   `${CLAUDE_PLUGIN_ROOT}/knowledge/2026/srl/panoramica.md` (sezione "Forfettario vs SRL" e
   "le cinque leve"). Per i numeri SRL leggi anche `srl/irap.md` (aliquota della **regione**
   dell'utente) e `srl/soci.md` (dividendi, compenso, INPS).
2. Raccogli (chiedi se manca): ricavi attesi, **costi reali** stimati, codice ATECO,
   **regione** (l'IRAP va da 2,68% a 4,97% nel 2026: senza la regione il numero SRL è aria),
   gestione INPS, se il socio **lavora** nella società, e — per il lato forfettario — se è nei
   **primi 5 anni con requisiti start-up** (aliquota 5%) o no (15%): senza questo dato non hai
   `--aliquota` per `calc.sh` e non puoi inventarlo.
3. **Lato forfettario** — calcolo deterministico:
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc.sh --ricavi <N> --coefficiente <F> --aliquota <0.05|0.15> ...`
4. **Lato SRL** — calcolo deterministico con
   `sh ${CLAUDE_PLUGIN_ROOT}/scripts/calc-srl.sh --utile <ricavi−costi> --ires-aliquota 0.24
   --irap-imponibile <N> --irap-aliquota <aliquota della regione>`.
   L'IRAP ha una **base diversa**: non passare l'utile come `--irap-imponibile`. Se non hai
   elementi per stimare il valore della produzione netta, dillo e **omettila dichiarandolo**,
   invece di inventarla.
5. **Mostra i due poli del prelievo, non un numero unico** (`srl/soci.md`):
   - **via dividendo**: IRES 24% + IRAP, poi ritenuta **26%** su quanto distribuito
     (carico combinato ≈ **43,76%** sull'utile ante imposte, IRAP esclusa), **zero INPS**;
   - **via compenso amministratore**: **deduce** dall'IRES (ma **non** dall'IRAP), poi
     **IRPEF 23/33/43%** + addizionali sul percipiente e **INPS Gestione Separata 33,72%**
     (2/3 società, 1/3 amministratore).
   Dì esplicitamente che la risposta reale sta **in mezzo** e dipende dall'IRPEF marginale,
   dalle addizionali di residenza, dall'altra copertura previdenziale (33,72% vs 24%) e dal
   **massimale INPS di 122.295 €**, oltre il quale il costo marginale del compenso crolla.
   **Non produrre un punto di pareggio numerico.**
6. Aggiungi le avvertenze che cambiano la decisione:
   - se il socio **lavora** nella società, i contributi Artigiani/Commercianti si pagano sulla
     sua quota di reddito d'impresa **anche se non distribuito** (`srl/soci.md` §4): il
     differimento tipico della SRL **non funziona sull'INPS**;
   - **costi fissi di struttura** della SRL: contributo fisso minimo (4.521,36 € artigiani /
     4.611,64 € commercianti), IRAP, bilancio, commercialista;
   - fattori non fiscali: responsabilità limitata, immagine, accesso al credito, adempimenti.
7. **Competenza vs cassa**: il forfettario è per **cassa**, la SRL per **competenza**
   (`regole.md` §3). Se i numeri dell'utente vengono da fatture, dichiara che il lato SRL è
   una **stima** (mancano ammortamenti, rimanenze, ratei, TFR).
8. **Livello di verifica**: i file SRL sono `status: CITATO` → aggiungi l'avviso di
   `regole.md` §7. Rifiuta su ciò che non è scritto (acconti, scadenze, codici F24,
   deducibilità puntuale dei singoli costi).
9. **Conclusione**: niente verdetti secchi. Indica in quale direzione spingono i numeri dati,
   quali leve li ribaltano, e **rimanda al commercialista** per il calcolo puntuale.
10. **Chiusura** (`regole.md` §4): un confronto con numeri è sempre una "risposta con un
    numero" → cita le fonti **e** chiudi col disclaimer. (`/confronta` produce quasi sempre
    numeri; il caso di puro rifiuto — es. dati insufficienti su entrambi i lati — non
    richiede il disclaimer, solo il rimando a fornire i dati mancanti.)
