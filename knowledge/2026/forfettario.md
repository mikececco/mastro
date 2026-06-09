---
title: Regime forfettario — regole e calcolo
anno: 2026
sources:
  - "Legge 23 dicembre 2014, n. 190, art. 1 commi 54-89 (regime forfettario)"
  - "Legge di Bilancio 2023 (L. 197/2022): soglia 85.000 € e uscita immediata oltre 100.000 €"
  - "Legge di Bilancio 2025 (L. 207/2024): limite reddito da lavoro dipendente elevato a 35.000 €, prorogato per il 2026"
  - "Allegato 2, L. 190/2014: coefficienti di redditività (vedi coefficienti-ateco.md)"
  - "INPS Circolare n. 8/2026 (Gestione Separata) e n. 14/2026 (Artigiani e Commercianti)"
  - "Agenzia delle Entrate — schede regime forfettario"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: VERIFICATO   # verificato 2026-06-09 contro fonti ufficiali (INPS Circ. 8 e 14/2026, AdE, Normattiva). Conferma finale consigliata col commercialista.
---

# Regime forfettario — come funziona

> ✅ Verificato il 2026-06-09 contro fonti ufficiali (Agenzia delle Entrate, Normattiva
> L. 190/2014, INPS Circ. 8/2026 e 14/2026). Resta valida la regola: per i casi limite,
> conferma col commercialista. Due valori sono **temporanei** e vanno riverificati per il 2027:
> il limite redditi da lavoro dipendente (35.000 €) e tutte le cifre INPS (annuali).

## In due righe
Nel forfettario non deduci i costi reali: il reddito imponibile è una percentuale fissa
del fatturato **incassato** (il coefficiente, per codice ATECO). Su quel reddito, meno i
contributi versati, paghi un'imposta sostitutiva del 15% (5% i primi 5 anni se ne hai i
requisiti). L'IVA non si applica.

## Requisiti di accesso e permanenza
- Ricavi/compensi dell'anno precedente **≤ 85.000 €**. Il limite è **annuo**: per chi è già
  in attività si guarda l'anno precedente intero e **non** si riproporziona ai mesi. Nota: per
  chi **inizia** l'attività in corso d'anno, la soglia del **primo anno** va ragguagliata ad
  anno (AdE).
- Spese per lavoro dipendente/collaboratori **≤ 20.000 €** lordi.
- Redditi da lavoro dipendente/pensione dell'anno precedente **≤ 35.000 €** (base statutaria
  30.000 €, **elevata a 35.000 € per il 2025 e il 2026** — misura temporanea da riverificare
  per il 2027). Il controllo non si applica se il rapporto di lavoro è cessato.
- Assenza delle cause di esclusione → vedi `esclusioni.md`.
*(fonte: L. 190/2014 art. 1; soglia 85.000 da L. 197/2022; 35.000 da L. 207/2024 prorogata)*

## Le soglie del tetto (cosa succede se sfori)
| Ricavi incassati nell'anno | Effetto |
|---|---|
| ≤ 85.000 € | Resti nel forfettario |
| > 85.000 € e ≤ 100.000 € | Esci dal regime **dall'anno successivo** |
| > 100.000 € | Esci dal regime **subito, nello stesso anno** (con IVA dovuta) |
*(fonte: L. 197/2022; uscita immediata oltre 100.000 → L. 190/2014 c. 71)*

## Calcolo dell'imposta (principio di cassa)
```
reddito_imponibile = ricavi_incassati × coefficiente_ATECO
imponibile_netto   = max(0, reddito_imponibile − contributi_previdenziali_versati_in_anno)
imposta            = imponibile_netto × aliquota
```
- `coefficiente_ATECO`: da `coefficienti-ateco.md` (Allegato 2, L. 190/2014).
- `aliquota`: **5%** i primi 5 anni se hai i requisiti "start-up" (sotto), altrimenti **15%**.
- I contributi si deducono solo se **versati nell'anno** (cassa). L'imposta non va sotto 0.
- Il calcolo deterministico è in `scripts/calc.sh`.
*(fonte: AdE — reddito e tassazione del regime forfettario; quadro LM)*

### Aliquota agevolata 5% (primi 5 anni) — requisiti (tutti)
1. Non aver esercitato attività artistica/professionale/d'impresa, anche in forma
   associata/familiare, nei **3 anni precedenti**.
2. L'attività **non è** mera prosecuzione di altra svolta come lavoro dipendente/autonomo
   (salvo periodi di pratica obbligatoria).
3. Se prosegui un'attività altrui, i ricavi dell'anno precedente di quella attività erano
   ≤ 85.000 €.
*(fonte: L. 190/2014 art. 1 comma 65; AdE)*

## Contributi previdenziali (INPS) — valori 2026 (verificati)
> Le aliquote e i minimali INPS cambiano ogni anno. Questi sono i valori **2026**
> (INPS Circ. n. 8/2026 per la Gestione Separata, Circ. n. 14/2026 per artigiani/commercianti).

**Gestione separata** (professionisti senza cassa), sul reddito forfettario:
- **26,07%** se non pensionati e senza altra copertura previdenziale obbligatoria (25% IVS + 1,07%).
- **24,00%** se pensionati o già coperti da altra previdenza obbligatoria.
- Minimale 2026: **18.808 €**; massimale: **122.295 €**. Si paga sul reddito effettivo.

**Artigiani / Commercianti** (sul reddito d'impresa = ricavi × coefficiente):
- Contributo fisso sul **minimale** (reddito minimale 2026: **18.808 €**):
  artigiani **4.521,36 €**, commercianti **4.611,64 €** l'anno.
- **Eccedenza** oltre il minimale, ad aliquota: fino a **56.224 €** → artigiani **24,00%**,
  commercianti **24,48%**; oltre 56.224 € → artigiani **25,00%**, commercianti **25,48%**.
  (I commercianti pagano lo **0,48%** in più — L. 449/1997.)
- Massimali imponibile: **93.707 €** (iscritti ante 1996) / **122.295 €** (dal 1996).
- **Riduzione 35%** facoltativa per i forfettari iscritti a questa gestione: si chiede al
  Cassetto previdenziale (di norma entro il **28 febbraio**); riduce tutto l'IVS, non i
  7,44 € di maternità.

**Professionisti con cassa** (Forense, Inarcassa, ENPAM, ecc.): seguono le regole della
propria cassa, fuori da `calc.sh`.

*(per `calc.sh` passa aliquota/minimale/fisso come parametri: la conoscenza resta la fonte unica dei numeri)*

## Acconti e saldo (meccanica statutaria, stabile)
- L'**acconto** dell'imposta sostitutiva è dovuto se l'imposta dell'anno precedente è
  **> 51,65 €**. Importo: **100%** dell'imposta dell'anno precedente.
- Se l'acconto totale è **≤ 257,52 €**: rata **unica** entro il **30/11**.
- Se è **> 257,52 €**: **40%** entro il **30/06** (col saldo) + **60%** entro il **30/11**.
- Il **saldo** si versa con **F24** entro il 30/06 (differibile al 30/07 con +0,40%).
- Codici tributo F24: **1790** saldo, **1791** primo acconto, **1792** secondo acconto.
*(fonte: regole acconto imposte sui redditi applicate all'imposta sostitutiva)*

## Fatturazione elettronica
Dal **1° gennaio 2024** la fattura elettronica via **SDI** è obbligatoria per **tutti** i
forfettari (è caduta la vecchia soglia di esonero). I forfettari **non** applicano l'IVA in
fattura, ma la fattura va comunque trasmessa via SDI.
*(fonte: DL 36/2022; obbligo generalizzato dal 2024)*
