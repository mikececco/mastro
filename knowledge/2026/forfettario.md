---
title: Regime forfettario — regole e calcolo
anno: 2026
sources:
  - "Legge 23 dicembre 2014, n. 190, art. 1 commi 54-89 (regime forfettario)"
  - "Legge di Bilancio 2023 (L. 197/2022): innalzamento soglia a 85.000 € e uscita immediata oltre 100.000 €"
  - "Allegato 2, L. 190/2014: coefficienti di redditività (vedi coefficienti-ateco.md)"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: DRAFT_DA_VERIFICARE   # struttura verificata; aliquote INPS da confermare con la circolare INPS dell'anno
---

# Regime forfettario — come funziona

> ⚠️ Le **regole strutturali** (tetto, aliquote imposta, formula, acconti, cassa) sono
> verificate. Le **aliquote/minimali INPS** cambiano ogni anno: sono indicate come
> riferimento e vanno confermate con la circolare INPS dell'anno corrente prima dell'uso.

## In due righe
Nel forfettario non deduci i costi reali: il reddito imponibile è una percentuale fissa
del fatturato **incassato** (il coefficiente, per codice ATECO). Su quel reddito, meno i
contributi versati, paghi un'imposta sostitutiva del 15% (5% i primi 5 anni se ne hai i
requisiti). L'IVA non si applica.

## Requisiti di accesso e permanenza
- Ricavi/compensi dell'anno precedente **≤ 85.000 €** (ragguagliati ad anno; il limite è
  annuo, **non** proporzionale ai mesi di attività).
- Spese per lavoro dipendente/collaboratori **≤ 20.000 €** lordi.
- Redditi da lavoro dipendente/pensione dell'anno precedente **≤ 35.000 €**
  (chi supera 35.000 € è escluso, salvo cessazione del rapporto di lavoro).
- Assenza delle cause di esclusione → vedi `esclusioni.md`.
*(fonte: L. 190/2014 art. 1; soglia 85.000 da L. 197/2022)*

## Le soglie del tetto (cosa succede se sfori)
| Ricavi incassati nell'anno | Effetto |
|---|---|
| ≤ 85.000 € | Resti nel forfettario |
| > 85.000 € e ≤ 100.000 € | Esci dal regime **dall'anno successivo** |
| > 100.000 € | Esci dal regime **subito, nello stesso anno** (con IVA dovuta) |
*(fonte: L. 197/2022)*

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

### Aliquota agevolata 5% (primi 5 anni) — requisiti (tutti)
1. Non aver esercitato attività artistica/professionale/d'impresa, anche in forma
   associata/familiare, nei **3 anni precedenti**.
2. L'attività **non è** mera prosecuzione di altra svolta come lavoro dipendente/autonomo
   (salvo periodi di pratica obbligatoria).
3. Se prosegui un'attività altrui, i ricavi dell'anno precedente di quella attività erano
   ≤ 85.000 €.
*(fonte: L. 190/2014 art. 1 comma 65)*

## Contributi previdenziali (INPS) — RIFERIMENTO, da verificare ogni anno
> Le aliquote e i minimali INPS cambiano ogni anno. Verifica la circolare INPS dell'anno.
- **Gestione separata** (professionisti senza cassa): aliquota ~26–27% sul reddito
  forfettario. Nessun minimale fisso: paghi sul reddito effettivo.
- **Artigiani / Commercianti**: contributo sul **minimale** (reddito minimale ~18.500 €,
  contributo fisso ~4.000 €/anno) + **eccedenza** sul reddito oltre il minimale ad aliquota
  ~24%. I forfettari possono optare per la **riduzione del 35%** dei contributi.
- **Professionisti con cassa** (avvocati, ingegneri, ecc.): seguono le regole della propria
  cassa, fuori da `calc.sh`.
*(fonte: INPS — circolare contributi dell'anno; per `calc.sh` passa l'aliquota/minimale come parametri)*

## Acconti e saldo (meccanica statutaria, stabile)
- L'**acconto** dell'imposta sostitutiva è dovuto se l'imposta dell'anno precedente è
  **> 51,65 €**. Importo: **100%** dell'imposta dell'anno precedente.
- Se l'acconto totale è **≤ 257,52 €**: rata **unica** entro il **30/11**.
- Se è **> 257,52 €**: **40%** entro il **30/06** (col saldo) + **60%** entro il **30/11**.
- Il **saldo** dell'anno si versa col modello **F24**, entro il 30/06 (con possibilità di
  rateazione/proroga secondo l'anno).
*(fonte: regole acconto imposte sui redditi, applicate all'imposta sostitutiva)*

## Fatturazione elettronica
Dal **1° gennaio 2024** la fattura elettronica via **SDI** è obbligatoria per **tutti** i
forfettari (era già obbligatoria sopra certe soglie dal 2022). I forfettari **non**
applicano l'IVA in fattura (operazione fuori campo/regime forfettario), ma la fattura va
comunque trasmessa via SDI.
*(fonte: obbligo e-fattura forfettari dal 2024)*
