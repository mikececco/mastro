---
title: SRL — acconti, saldo, codici tributo F24 e calendario adempimenti
anno: 2026
sources:
  - "art. 1 c. 301 L. 27 dicembre 2004, n. 311: acconto IRES/IRPEG al 100%"
  - "art. 17 c. 3 DPR 7 dicembre 2001, n. 435: split 40/60, rata unica se prima rata ≤103€"
  - "art. 30 c. 3 D.Lgs. 15 dicembre 1997, n. 446: acconto IRAP con le stesse modalità IRES"
  - "Risoluzione Agenzia delle Entrate n. 76/E del 27 maggio 2004: codici tributo IRES 2001/2002/2003"
  - "art. 21-bis D.L. 78/2010 (come modif. da D.L. 73/2022): scadenze LIPE trimestrali"
  - "DPR 22 luglio 1998, n. 322: dichiarazione Redditi SC, dichiarazione IVA annuale, CU"
  - "D.Lgs. 8 gennaio 2024, n. 1 (Decreto Adempimenti): esonero 770 per sostituti fino a 5 dipendenti"
  - "DPR 26 ottobre 1972, n. 641, Tariffa art. 23: tassa di concessione governativa (vidimazione libri sociali)"
  - "L. 383/2001 art. 8 c. 1 (numero di legge da riconfermare, vedi caveat §6): numerazione libro giornale/inventari senza bollatura preventiva"
  - "D.L. 21 giugno 2021, n. 34 art. 12-quater e D.L. 21 giugno 2022, n. 73: assorbimento dell'esterometro nel flusso SdI ordinario (TD17/18/19)"
  - "artt. 2364, 2435, 2478-bis c.c.: approvazione e deposito bilancio"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: CITATO   # meccaniche e scadenze con fonte primaria o secondaria qualificata convergente; i 6 codici tributo NON sono stati letti sullo strumento ufficiale AdE (bloccato per limite tecnico di sessione, non per assenza di fonte). Vedi regole.md §7.
---

# SRL — acconti, saldo, F24 e calendario adempimenti (2026)

> ⚠️ **`status: CITATO`** — meccaniche e importi documentati e convergenti su più fonti, ma
> **non tutti letti sul testo primario o sullo strumento ufficiale AdE** in questa sessione
> (motivi tecnici, non assenza di fonte — vedi i singoli caveat). Dire sempre: *"verifica col
> commercialista prima di decidere."*

## 1. Acconto IRES — meccanica confermata

I **default di `scripts/calc-srl.sh` sono corretti** (non placeholder): questa ricerca li
conferma.

- **Percentuale: 100%** dell'imposta del periodo precedente (metodo storico), per una SRL
  ordinaria *(art. 1 c. 301 L. 311/2004)*.
- **Split: 40% prima rata / 60% seconda rata** *(art. 17 c. 3 DPR 435/2001)*.
- **Soglia minima: 20,66 €** — sotto questo importo l'acconto non è dovuto. *(fonte: Fisco
  Oggi/AdE, convergente su 3+ fonti fiscali indipendenti; il testo di legge originario — L.
  97/1977 e successive — non è stato letto direttamente in questa sessione per limiti tecnici
  di fetch su Normattiva)*.
- **🚨 Non confondere con le soglie IRPEF/forfettario.** Alcune fonti secondarie citano
  103 €/257,52 € come soglie IRAP — quei valori sono quelli del regime **persone fisiche**
  (vedi `knowledge/2026/forfettario.md`), **non** quelli di una SRL. Per una SRL, IRES e IRAP
  seguono **entrambe** le regole sopra (100%, 40/60, soglia 20,66 €).
- **Rata unica invece di due rate**: se la **prima rata** (40% del totale) non supera
  **103 €**, tutto l'acconto si versa in un'unica soluzione alla scadenza della seconda rata
  (novembre) *(stesso art. 17 c. 3 DPR 435/2001)*. Equivale a una soglia sul totale di ~257,50 €.
  Implementato in `calc-srl.sh` come `--acconto-primo-min` (default 103).
- **Metodo storico vs previsionale**: entrambi ammessi. Storico = 100% dell'imposta
  dell'anno precedente (quello che usa `calc-srl.sh` di default via `--ires-precedente`).
  Previsionale = stima dell'imposta dell'anno corrente, con rischio di sanzione se
  sottostimata oltre le soglie di tolleranza — non ancora modellato nel calcolatore.

## 2. Acconto IRAP — stessa meccanica dell'IRES

**L'IRAP segue esattamente le stesse regole dell'IRES** per un soggetto IRES come la SRL:
100%, split 40/60, soglia 20,66 €, stessa regola della rata unica *(art. 30 c. 3 D.Lgs.
446/1997, che rinvia esplicitamente alle disposizioni sulle imposte sui redditi)*.
`calc-srl.sh` applica la stessa funzione `acconto()` a entrambe le imposte, indipendentemente.

## 3. Saldo e scadenze di versamento (esercizio solare 2026)

| Cosa | Quando |
|---|---|
| Saldo IRES/IRAP anno precedente + 1ª rata acconto | **30 giugno 2026**, differibile al **30 luglio 2026** con maggiorazione **0,40%** |
| 2ª rata acconto (o rata unica) | **30 novembre 2026** |
| Rateizzazione | fino a **7 rate mensili** nel 2026 (elevate da 6), interesse ~0,33%/mese sulle rate successive alla prima ⚠️ *solo fonte secondaria (Optlyx), non confermata su circolare AdE* |

*(fonte scadenze: Il Sole 24 Ore NT+Fisco, DeQuo — nota: se l'approvazione del bilancio slitta
ai 180 giorni, anche il pagamento slitta di conseguenza — vedi §5)*

## 4. Codici tributo F24

| Codice | Descrizione | Verifica |
|---|---|---|
| **2001** | IRES — acconto prima rata | Ris. AdE n. 76/E del 27/05/2004 |
| **2002** | IRES — acconto seconda rata o unica soluzione | Ris. AdE n. 76/E del 27/05/2004 |
| **2003** | IRES — saldo | Ris. AdE n. 76/E del 27/05/2004 |
| **3800** | IRAP — saldo | convergente su più fonti secondarie, risoluzione istitutiva non identificata |
| **3812** | IRAP — acconto prima rata | idem |
| **3813** | IRAP — acconto seconda rata o unica soluzione | idem |

> ⚠️ **Nessuno di questi codici è stato letto direttamente sullo strumento ufficiale di ricerca
> codici tributo dell'Agenzia delle Entrate** in questa sessione (blocco tecnico HTTP 500 su
> ogni tentativo, non conferma di assenza). I codici IRES sono ben documentati (risoluzione
> istitutiva citata su più fonti indipendenti); quelli IRAP solo su convergenza di fonti
> secondarie. **Verificare da browser su
> [agenziaentrate.gov.it/portale/web/guest/ricerca-codici-tributo](https://www.agenziaentrate.gov.it/portale/web/guest/ricerca-codici-tributo)
> prima di promuovere questa sezione a `VERIFICATO`.**

## 5. Dichiarazione Redditi SC — scadenza 2026

**2 novembre 2026** per una SRL a esercizio solare (il 31 ottobre cade di sabato, si slitta al
lunedì) *(fonte: pagina ufficiale Agenzia delle Entrate — Redditi società di capitali 2026)*.

⚠️ **Contraddizione da chiarire**: la regola generale è "ultimo giorno del **decimo** mese
successivo alla chiusura del periodo d'imposta" per il calendario solare confermato qui, ma
altre fonti aggregate citano il **nono** mese per esercizi infrannuali. Non risolto in questa
sessione — per l'esercizio solare 2026 usare comunque il **2 novembre 2026**, confermato dalla
pagina ufficiale AdE.

## 6. Calendario dichiarativo e adempimenti ricorrenti

### LIPE (Comunicazione Liquidazioni Periodiche IVA) *(art. 21-bis D.L. 78/2010)*
Ultimo giorno del secondo mese successivo al trimestre — **eccetto il 2° trimestre, spostato
strutturalmente a fine settembre dal D.L. 73/2022** (non una proroga annuale, è il regime
corrente).

| Trimestre | Scadenza 2026 |
|---|---|
| IV trim. 2025 | 2 marzo 2026 |
| I trim. 2026 | 1° giugno 2026 |
| II trim. 2026 | 30 settembre 2026 |
| III trim. 2026 | 30 novembre 2026 |

### Dichiarazione IVA annuale
**1 febbraio – 30 aprile 2026.** Obbligo **distinto e autonomo** dal modello Redditi, non
assorbito — dovuto anche senza operazioni imponibili nell'anno.

### CU e modello 770 — due obblighi diversi, spesso confusi
- **Certificazione Unica (CU) 2026**: **16 marzo 2026** (lavoro dipendente/assimilati, lavoro
  autonomo occasionale); **30 aprile 2026** (compensi a professionisti abituali).
- **Modello 770/2026**: ordinariamente 31 ottobre, nel 2026 slitta al **2 novembre 2026**
  (31/10 è sabato). Non abolito: dal 2024 i sostituti con **massimo 5 dipendenti** possono
  veicolare i dati via F24 mensile invece del 770 *(D.Lgs. 1/2024, fase pilota, non
  abolizione generale)*.

### Esterometro — 🚨 non esiste più come comunicazione separata dal 1° luglio 2022
Le operazioni transfrontaliere si trasmettono **via SdI** in formato XML (tipi documento
**TD17, TD18, TD19**) come parte del flusso ordinario di fatturazione elettronica — non un
adempimento a sé. *(D.L. 34/2019 → D.L. 146/2021 art. 5 c. 14-ter → Provv. AdE n. 374343/2021
→ D.L. 73/2022, che ha anche abolito l'obbligo per acquisti transfrontalieri non rilevanti
IVA in Italia sotto 5.000 €/operazione)*. Chi cita ancora "l'esterometro trimestrale" sta
usando materiale scaduto da anni.

### Diritto camerale annuale
Calcolato sul fatturato dell'anno precedente, a scaglioni (min 200 €, max 40.000 € circa).
Versato via **F24, codice tributo 3850**, allineato ai termini IRES: **30 giugno 2026**
(non-ISA) o **20 luglio 2026** (ISA). Eventuale conguaglio +20% entro il 30 novembre 2026.
⚠️ *La maggiorazione stessa (DM 17 marzo 2026, se esiste) non confermata su fonte primaria.*

### Tassa di concessione governativa (vidimazione libri sociali)
**309,87 €** (516,46 € se capitale sociale > 516.456,90 €). Scadenza **16 marzo 2026**, **F24
codice tributo 7085**. 🚨 **Correzione rispetto a fonti che citano il DPR 435/2001: la base
normativa corretta è la Tariffa allegata al DPR 26 ottobre 1972, n. 641, art. 23.**

### Libro giornale e libro inventari — numerazione, non bollatura
Confermato: serve la **numerazione progressiva**, **non** la bollatura/vidimazione
preventiva. ⚠️ **Fonte da riverificare**: la ricerca ha attribuito questo alla L. 383/2001
art. 8 c. 1, ma il numero di legge esatto è incerto in questa sessione (verificare se è
L. 383/2001 o un'altra legge del 2001-2003 — non dare per buono senza controllo diretto).
Termine di conservazione digitale: **3 mesi dal termine di presentazione Redditi** *(DM 17
giugno 2014, art. 3 c. 3 — non il D.Lgs. 127/2015, che riguarda la fattura elettronica)*.

### Deposito bilancio — riconferma
**120 giorni** dalla chiusura per l'approvazione ordinaria (→ 30 aprile 2026), **180 giorni**
se lo statuto lo prevede o per esigenze particolari (→ 29 giugno 2026) *(art. 2364 c. 2 c.c.)*;
**30 giorni** dall'approvazione per il deposito XBRL al Registro Imprese *(art. 2435 c.c.)*.
⚠️ Non confermato se il termine dei 30 giorni slitti al giorno feriale successivo quando cade
di sabato/domenica.

## 7. Cosa resta scoperto
- Codici tributo IRAP (3800/3812/3813): confermare sullo strumento ufficiale AdE.
- Regola nono/decimo mese per la dichiarazione Redditi SC negli esercizi infrannuali.
- Maggiorazione diritto camerale 2026-2028 (DM 17/03/2026): non su fonte primaria.
- Numero di legge esatto per la deregulation di bollatura libro giornale/inventari.
