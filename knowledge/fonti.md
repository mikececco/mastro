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

Coefficienti, contributi INPS e prassi non sono "legge" in senso stretto e hanno fonti dedicate:
- **Coefficienti di redditività** → Allegato 2, L. 190/2014 (vedi `2026/coefficienti-ateco.md`).
- **Aliquote/minimali INPS** → circolari INPS dell'anno (es. Circ. 8/2026 e 14/2026), su inps.it.
- **Prassi interpretativa** → circolari e risposte a interpello dell'Agenzia delle Entrate (es. Circ. 9/E/2019).

> Nota: italia-corpus contiene il testo delle leggi, non l'interpretazione. Per i casi limite
> vale sempre la regola di Mastro: conferma col commercialista.
