---
title: Mappa delle fonti — da ogni regola di Mastro alla norma
description: Collega ogni affermazione fiscale al testo di legge, su Normattiva e su italia-corpus.
status: STABLE
---

# Mappa delle fonti

Mastro cita la normativa, non la memoria del modello. Questo file collega ogni tema alla
**norma vigente**: il link **Normattiva** (fonte ufficiale) e il file corrispondente su
**[italia-corpus](https://github.com/ahmeabd/italia-corpus)** — un dataset pubblico (MIT /
pubblico dominio) che pubblica *tutta* la legislazione italiana di Normattiva come Markdown,
aggiornato ogni giorno con un commit per ogni modifica legislativa. È la stessa fonte contro
cui è stata verificata la conoscenza di Mastro, ma come Markdown stabile e versionato.

| Tema in Mastro | Norma | Normattiva | italia-corpus |
|---|---|---|---|
| Regime forfettario (requisiti, calcolo, esclusioni, 5%, acconti) | L. 23/12/2014 n. 190 (Legge di stabilità 2015) | [urn:nir:...legge:2014-12-23;190](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2014-12-23;190) | [Leggi finanziarie e di bilancio › …legge di stabilita 2015. 14G00203.md](https://github.com/ahmeabd/italia-corpus/blob/main/Leggi%20finanziarie%20e%20di%20bilancio/Disposizioni%20per%20la%20formazione%20del%20bilancio%20annuale%20e%20pluriennale%20dello%20Stato%20legge%20di%20stabilita%202015.%2014G00203.md) |
| Soglia 85.000 € e uscita immediata oltre 100.000 € | L. 29/12/2022 n. 197 (Bilancio 2023) | [urn:nir:...legge:2022-12-29;197](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2022-12-29;197) | [Leggi finanziarie e di bilancio › Bilancio 2023. 22G00211.md](https://github.com/ahmeabd/italia-corpus/blob/main/Leggi%20finanziarie%20e%20di%20bilancio/Bilancio%20di%20previsione%20dello%20Stato%20per%20lanno%20finanziario%202023%20e%20bilancio%20pluriennale%20per%20il%20triennio%202023-2025.%2022G00211.md) |
| Limite redditi da lavoro dipendente 35.000 € (per 2025-2026) | L. 30/12/2024 n. 207 (Bilancio 2025) | [urn:nir:...legge:2024-12-30;207](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2024-12-30;207) | [Leggi finanziarie e di bilancio › Bilancio 2025. 24G00229.md](https://github.com/ahmeabd/italia-corpus/blob/main/Leggi%20finanziarie%20e%20di%20bilancio/Bilancio%20di%20previsione%20dello%20Stato%20per%20lanno%20finanziario%202025%20e%20bilancio%20pluriennale%20per%20il%20triennio%202025-2027.%2024G00229.md) |
| IRES, deducibilità (inerenza/competenza, art. 109) | DPR 22/12/1986 n. 917 (TUIR) | [urn:nir:...dpr:1986-12-22;917](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.del.presidente.della.repubblica:1986-12-22;917) | [Testi Unici › Approvazione del testo unico delle imposte sui redditi.md](https://github.com/ahmeabd/italia-corpus/blob/main/Testi%20Unici/Approvazione%20del%20testo%20unico%20delle%20imposte%20sui%20redditi.md) |
| IRAP (aliquota ordinaria 3,9%) | D.Lgs. 15/12/1997 n. 446 | [urn:nir:...decreto.legislativo:1997-12-15;446](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:1997-12-15;446) | collezione `Decreti Legislativi/` (cerca per codice GU del 446/1997) |
| IVA (aliquota ordinaria 22%, detrazione) | DPR 26/10/1972 n. 633 | [urn:nir:...dpr:1972-10-26;633](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.del.presidente.della.repubblica:1972-10-26;633) | collezione `DPR/` (cerca per codice GU del 633/1972) |
| Obbligo fattura elettronica forfettari (dal 2024) | DL 30/04/2022 n. 36 | [urn:nir:...decreto.legge:2022-04-30;36](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2022-04-30;36) | collezione `DL e leggi di conversione/` |
| **Legge di Bilancio 2026**: IRPEF 2ª aliquota 35%→33%, iperammortamento, +2 punti IRAP banche/assicurazioni, proroga soglia 35.000 € forfettario | L. 30/12/2025 n. 199 | [urn:nir:...legge:2025-12-30;199](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2025-12-30;199) | ✅ [Leggi finanziarie e di bilancio › Bilancio 2026. 25G00212.md](https://github.com/ahmeabd/italia-corpus/blob/main/Leggi%20finanziarie%20e%20di%20bilancio/Bilancio%20di%20previsione%20dello%20Stato%20per%20lanno%20finanziario%202026%20e%20bilancio%20pluriennale%20per%20il%20triennio%202026-2028.%2025G00212.md) |
| Ritenuta 26% sui dividendi al socio persona fisica | DPR 29/09/1973 n. 600, art. 27 | [urn:nir:...dpr:1973-09-29;600](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.del.presidente.della.repubblica:1973-09-29;600) | collezione `DPR/` — path 🔎 da verificare |
| Gestione Separata INPS (istituzione, ripartizione 2/3–1/3) | L. 08/08/1995 n. 335, art. 2 c. 26 e 30 | [urn:nir:...legge:1995-08-08;335](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1995-08-08;335) | ⚠️ collezione da individuare (**non** esiste una collezione `Leggi/` generica) |
| Iscrizione dei soci di SRL alla gestione commercianti (abitualità e prevalenza) | L. 23/12/1996 n. 662, art. 1 c. 203 | [urn:nir:...legge:1996-12-23;662](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1996-12-23;662) | ⚠️ collezione da individuare |
| Deduzione integrale del costo del lavoro a tempo indeterminato ai fini IRAP (abrogazione del "cuneo fiscale" forfettario) | DL 21/06/2022 n. 73, art. 10 | [urn:nir:...decreto.legge:2022-06-21;73](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2022-06-21;73) | collezione `DL e leggi di conversione/` — path 🔎 da verificare |
| IRAP non dovuta dalle persone fisiche (dal 2022) | L. 30/12/2021 n. 234, art. 1 c. 8 | [urn:nir:...legge:2021-12-30;234](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2021-12-30;234) | collezione `Leggi finanziarie e di bilancio/` (bilancio 2022) — path 🔎 da verificare |
| Maggiorazione del costo per nuove assunzioni (+20%) | D.Lgs. 30/12/2023 n. 216, art. 4 | [urn:nir:...decreto.legislativo:2023-12-30;216](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2023-12-30;216) | collezione `Decreti Legislativi/` — path 🔎 da verificare |
| Erogazioni liberali a enti del Terzo settore (10% del reddito) | D.Lgs. 03/07/2017 n. 117, art. 83 | [urn:nir:...decreto.legislativo:2017-07-03;117](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2017-07-03;117) | collezione `Decreti Legislativi/` — path 🔎 da verificare |
| Abrogazione retroattiva delle soglie PEX; fine del vincolo "made in EU" per l'iperammortamento | DL 27/03/2026 n. 38 (conv. L. 88/2026), artt. 7 e 11 | [urn:nir:...decreto.legge:2026-03-27;38](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2026-03-27;38) | collezione `DL e leggi di conversione/` (legge di conversione) — path 🔎 da verificare |
| +2 punti IRAP per il settore energetico (2026-2027) | DL 20/02/2026 n. 21 (conv. L. 49/2026), art. 3 | [urn:nir:...decreto.legge:2026-02-20;21](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legge:2026-02-20;21) | ✅ presente in `DL e leggi di conversione/` (legge di conversione del DL 21/2026) |
| Deducibilità auto (20/70/80/100%), massimali | TUIR art. 164 | [urn:nir:...dpr:1986-12-22;917](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.del.presidente.della.repubblica:1986-12-22;917) | stesso file del TUIR (riga sopra) — cerca l'articolo nel testo |
| Spese di rappresentanza — scaglioni | TUIR art. 108 c. 2; DM 19/11/2008 | [urn:nir:...dpr:1986-12-22;917](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.del.presidente.della.repubblica:1986-12-22;917) | TUIR come sopra; il DM 19/11/2008 non è legge primaria — non è nel corpus (italia-corpus copre solo le collezioni legislative, non i decreti attuativi non numerati — vedi sotto) |
| Tracciabilità di trasferte/rappresentanza (dal 2025) | L. 30/12/2024 n. 207, art. 1 c. 81-83 (range da confermare) | [urn:nir:...legge:2024-12-30;207](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:2024-12-30;207) | stesso file della riga "Limite redditi..." sopra |
| Ammortamenti — coefficienti per gruppo di attività | DM 31/12/1988 (come modif. da DM 28/3/1996) | — | ⚠️ decreto ministeriale non numerato: **fuori dallo scope di italia-corpus per definizione** (vedi nota sotto) |
| Interessi passivi — limite 30% del ROL fiscale | D.Lgs. 29/11/2018 n. 142 (riscrive TUIR art. 96), attuazione ATAD (UE 2016/1164) | [urn:nir:...decreto.legislativo:2018-11-29;142](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2018-11-29;142) | collezione `Decreti Legislativi/` — path 🔎 da verificare |
| Indeducibilità dei costi da reato | L. 24/12/1993 n. 537, art. 14 c. 4-bis (come modif. da DL 2/3/2012 n. 16) | [urn:nir:...legge:1993-12-24;537](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:legge:1993-12-24;537) | ⚠️ collezione da individuare |

> 🔎 **Nota di trasparenza sulla colonna italia-corpus.** Solo le righe con ✅ sono state
> verificate aprendo il repository (agosto 2026). Le altre indicano la **collezione probabile**
> ma il file esatto va ancora confermato: sono puntatori di lavoro, non citazioni verificate.
> Due avvertenze rilevate verificando: **non esiste una collezione `Leggi/` generica** (le leggi
> ordinarie stanno in collezioni tematiche: `Leggi finanziarie e di bilancio`, `Leggi contenenti
> deleghe`, `Leggi di ratifica`…), e il corpus risulta **fermo al 18 luglio 2026**, quindi non
> garantisce gli atti più recenti.

## ⚠️ Cosa italia-corpus NON può contenere (e perché conta)

italia-corpus riproduce le **collezioni legislative** delle API pubbliche di Normattiva: leggi,
decreti-legge, decreti legislativi, DPR, codici, testi unici. **Non contiene la prassi né i dati
amministrativi.** Ma una parte grande di ciò che rende la conoscenza *utilizzabile* vive
esattamente là fuori:

| Cifra o regola | Da dove viene | In italia-corpus? |
|---|---|---|
| Aliquote e minimali INPS (33,72% · 18.808 € · 4.521,36 € · 4.611,64 €) | **Circolari INPS** 8/2026 e 14/2026 | ❌ mai (le circolari non sono legge) |
| Base imponibile IRAP e righi IS/IC, deduzioni sul costo del lavoro | **Istruzioni AdE** alla dichiarazione IRAP 2026 | ❌ mai |
| Aliquote IRAP delle 21 regioni (2,68%–4,97%) | **Banca dati MEF-DF** ex art. 16 c. 3-bis | ❌ mai (dato amministrativo regionale) |
| Procedura GSE dell'iperammortamento, perizia, comunicazioni | **DM interministeriale 7/5/2026** e decreti direttoriali MIMIT | ❌ in genere no |
| Base contributiva del socio di SRL su utili non distribuiti | **Circolari INPS** 102/2003 e 84/2021 | ❌ mai |
| Coefficienti di redditività per ATECO | Allegato 2 alla L. 190/2014 | ⚠️ dipende da come Normattiva espone gli allegati |
| Coefficienti di ammortamento per gruppo di attività | **DM 31/12/1988** (decreto ministeriale non numerato) | ❌ escluso per definizione — Normattiva stessa dichiara di coprire solo gli atti **numerati** |
| Scaglioni spese di rappresentanza | **DM 19/11/2008** (decreto attuativo) | ❌ escluso per lo stesso motivo |

**Perché è una buona notizia, non un problema.** Questo è precisamente il confine tra i due
progetti, e la ragione per cui Mastro non è una copia ridondante del corpus:
italia-corpus rende aperto e interrogabile il **testo della legge**; Mastro rende aperte,
citate e versionate le **regole operative che derivano dalla legge più la prassi** — la parte
che nessun corpus legislativo può darti. I due strati sono complementari: il corpus è la fonte
a cui *rimandare*, non la fonte da cui *estrarre* le aliquote.

Coefficienti, contributi INPS e prassi non sono "legge" in senso stretto e hanno fonti dedicate:
- **Coefficienti di redditività** → Allegato 2, L. 190/2014 (vedi `2026/coefficienti-ateco.md`).
- **Aliquote/minimali INPS** → circolari INPS dell'anno (es. Circ. 8/2026 e 14/2026), su inps.it.
- **Prassi interpretativa** → circolari e risposte a interpello dell'Agenzia delle Entrate (es. Circ. 9/E/2019).
- **Aliquote IRAP regionali** → banca dati del MEF-Dipartimento delle Finanze, alimentata dalle
  Regioni ex art. 16 c. 3-bis D.Lgs. 446/1997:
  [finanze.gov.it → aliquote applicabili](https://www.finanze.gov.it/it/fiscalita/fiscalita-regionale-e-locale/IRAP/aliquoteapplicabili/).
- **Base imponibile e deduzioni IRAP** → istruzioni AdE alla dichiarazione IRAP dell'anno
  (modello IRAP 2026 approvato con provv. 27/02/2026 n. 71997).
- **Iperammortamento** → DM interministeriale 7 maggio 2026 e decreti direttoriali MIMIT.

> ⚠️ **Trappola nota su Normattiva (art. 16 D.Lgs. 446/1997).** Il corpo dell'articolo mostra
> **3,50%**: è il testo sostituito dal D.L. 66/2014, il cui comma è stato **abrogato** dalla
> L. 190/2014 con la stessa decorrenza, facendo rivivere il **3,90%**. Normattiva registra il
> ripristino solo in nota. Per le aliquote IRAP fanno fede le istruzioni AdE e la banca dati MEF.

> Nota: italia-corpus contiene il testo delle leggi, non l'interpretazione. Per i casi limite
> vale sempre la regola di Mastro: conferma col commercialista.
