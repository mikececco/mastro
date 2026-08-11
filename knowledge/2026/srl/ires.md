---
title: IRES per la SRL — aliquota, catena di calcolo, perdite
anno: 2026
sources:
  - "TUIR (DPR 917/1986): art. 77 (aliquota IRES), art. 83 (determinazione del reddito), art. 84 (perdite), art. 109 (competenza)"
  - "L. 30 dicembre 2024, n. 207 art. 1 commi 436-444: IRES premiale (solo periodo d'imposta 2025)"
  - "L. 30 dicembre 2025, n. 199 (Legge di Bilancio 2026): nessuna proroga dell'IRES premiale"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: CITATO   # aliquota, IRES premiale e meccanica di base documentati. Vedi §4 per ciò che resta scoperto (variazioni puntuali, agevolazioni).
---

# IRES per la SRL (2026)

> ⚠️ **`status: CITATO`** — aliquota, IRES premiale e catena di calcolo documentate. Gli
> **acconti e i codici tributo F24 sono ora coperti in `acconti-scadenze.md`** (§4 sotto
> elenca solo ciò che resta scoperto). Su ciò che manca i comandi devono rifiutare.

## 1. Aliquota: 24%
**IRES 24%** sul reddito d'impresa *(art. 77 TUIR; misura in vigore dal periodo d'imposta
successivo a quello in corso al 31/12/2016, ex L. 208/2015)*.

> 🚨 **L'IRES premiale al 20% NON si applica al 2026.** Era misura temporanea per il **solo**
> periodo d'imposta 2025 *(art. 1 c. 436-444 L. 207/2024)* e la **Legge di Bilancio 2026
> (L. 199/2025) non l'ha prorogata** (verifica testuale: la parola "premiale" non compare
> nella legge). Dal 2026 l'aliquota torna al 24% per tutti.
> Alcune fonti di stampa generalista avevano annunciato il rinnovo in Manovra: **notizia
> superata dal testo finale**, ma ancora indicizzata.

## 2. Dall'utile di bilancio al reddito imponibile
La SRL è tassata per **competenza** *(art. 109 TUIR)*, non per cassa: vedi `regole.md` §3.

```
utile (o perdita) ante imposte di bilancio
 + variazioni in AUMENTO      (costi non deducibili o deducibili in parte)
 − variazioni in DIMINUZIONE  (componenti non tassabili o già tassati)
 = reddito lordo
 − perdite pregresse scomputabili
 = reddito imponibile → × 24% = IRES
```

Il punto di partenza è il **risultato di bilancio**, corretto dalle variazioni fiscali
*(art. 83 TUIR, principio di derivazione)*. **Utile di bilancio ≠ reddito imponibile**: è
esattamente ciò che le variazioni servono a riconciliare.

Il calcolo deterministico è in **`scripts/calc-srl.sh`** (`--utile`,
`--variazioni-aumento`, `--variazioni-diminuzione`, `--ires-aliquota`).

> ⚠️ **Da fatture e movimenti bancari NON si ricava l'utile di una SRL.** Mancano
> ammortamenti, rimanenze, ratei e risconti, TFR, costo del personale. Ogni numero IRES
> ricavato dalle sole fatture è una **stima da dichiarare come tale**.

## 3. Perdite pregresse *(art. 84 TUIR)*
Le perdite fiscali si riportano in avanti e si scomputano dal reddito **entro il limite
dell'80%** del reddito imponibile; le perdite dei **primi tre esercizi** dalla costituzione
sono utilizzabili **integralmente** (100%), a determinate condizioni.

In `calc-srl.sh`: `--perdite-pregresse` e `--limite-perdite` (default `0.80`, da impostare a
`1.00` per le perdite dei primi tre esercizi).

> ⚠️ Le **condizioni** di utilizzo integrale delle perdite dei primi tre esercizi e i limiti
> antielusivi al riporto (es. cambio di controllo + mutamento di attività) **non sono ancora
> scritti**: su questi i comandi rifiutano.

## 4. Acconti, scadenze e F24 → vedi `acconti-scadenze.md`
I default di `calc-srl.sh` (`--acconto-perc 1.00`, `--acconto-primo-perc 0.40`,
`--acconto-soglia 20.66`, `--acconto-primo-min 103`) **sono confermati**, non più
placeholder: 100% dell'imposta precedente, split 40/60, soglia 20,66 €, rata unica se la
prima rata non supera 103 € *(art. 1 c. 301 L. 311/2004; art. 17 c. 3 DPR 435/2001)*. Dettagli,
codici tributo F24 e calendario dichiarativo in `acconti-scadenze.md`.

## 5. Cosa NON è ancora verificato (i comandi devono rifiutare)
- **Elenco puntuale delle variazioni** in aumento/diminuzione più comuni (oltre a quelle già
  in `deducibilita.md`).
- **Agevolazioni**: stato di ACE, patent box, ZES per il 2026 (per il super-deduzione nuove
  assunzioni e l'iperammortamento vedi invece `incentivi.md`, che è documentato).
- **Condizioni di utilizzo integrale delle perdite** dei primi tre esercizi e limiti
  antielusivi al riporto (§3).
