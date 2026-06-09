---
title: SRL (Società a Responsabilità Limitata) — nozioni di base
anno: 2026
sources:
  - "TUIR (DPR 917/1986): IRES; art. 109 (inerenza, competenza, certezza/determinabilità)"
  - "D.Lgs. 446/1997 art. 16: IRAP, aliquota ordinaria 3,9%"
  - "DPR 633/1972 art. 16: IVA, aliquota ordinaria 22%"
  - "Agenzia delle Entrate — schede IRES / IRAP / IVA"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: DRAFT_SCHELETRO   # i FATTI qui presenti sono verificati (2026-06-09); il file resta uno scheletro: manca tutto il contenuto SRL di dettaglio (deducibilità puntuale, ammortamenti, bilancio).
---

# SRL — scheletro (v2, in costruzione)

> ⚠️ Questo file è uno **scheletro**: i fatti qui sotto sono **verificati** (2026-06-09 contro
> AdE e TUIR/D.Lgs. 446/1997/DPR 633/1972), ma il grosso del contenuto SRL (percentuali di
> deducibilità, ammortamenti, bilancio, calcolo IRES/IRAP puntuale) **non è ancora scritto**.
> I comandi `/srl` e `/confronta` rispondono **solo** da qui (cita-o-rifiuta): su ciò che manca
> rifiutano onestamente, senza inventare. Vedi TODOS.md.

## Cos'è (in due righe)
La SRL è una società di capitali: **personalità giuridica** e **responsabilità limitata**
(i soci rispondono nei limiti del capitale conferito, salvo eccezioni). Tiene **contabilità
ordinaria** e deposita un **bilancio**. A differenza del forfettario, **i costi inerenti
all'attività sono deducibili**.

## Imposte principali (fatti verificati)
- **IRES**: imposta sul reddito delle società, aliquota **24%** sul reddito d'impresa
  *(fonte: TUIR; AdE)*. Nota: l'**IRES premiale al 20%** (L. 207/2024) valeva **solo per il
  2025** (dichiarazione 2026) a certe condizioni e **non è stata prorogata** per il 2026: per il
  2026 l'aliquota torna al 24% per tutti.
- **IRAP**: aliquota **ordinaria 3,9%** sul valore della produzione netta *(D.Lgs. 446/1997 art. 16)*.
  Le Regioni possono variarla entro **±0,92 punti**. Settori particolari hanno aliquote diverse
  (es. banche ~4,65%, assicurazioni ~5,9%; agricoltura ridotta/diversa).
- **IVA**: la SRL **applica e detrae** l'IVA. Aliquota ordinaria **22%** (più ridotte 10% / 5% /
  4%) *(DPR 633/1972 art. 16)*. Differenza chiave col forfettario, che l'IVA non la applica né la detrae.
- **Dividendi**: l'utile distribuito al **socio persona fisica** (non in regime d'impresa) è
  tassato con **ritenuta a titolo d'imposta del 26%** (dal 2018 senza distinzione tra
  partecipazioni qualificate e non). Se il socio è una società, vale un regime diverso (PEX:
  imponibile ~5%).

## Deducibilità dei costi — principio (non i dettagli)
Un costo è deducibile se rispetta **inerenza**, **competenza** e **certezza/determinabilità**
*(fonte: TUIR art. 109)*. Molte voci hanno regole o percentuali specifiche (auto art. 164,
telefonia 80% art. 102 c.9, spese di rappresentanza art. 108, ammortamenti artt. 102-103):
**queste percentuali NON sono ancora in questo file** — su di esse i comandi rifiuteranno
finché non saranno scritte e verificate.

## Forfettario vs SRL — i poli del confronto
| | Forfettario | SRL |
|---|---|---|
| Tassazione | imposta sostitutiva 5%/15% su reddito = ricavi×coefficiente | IRES 24% + IRAP ~3,9% sull'utile |
| Costi | NON deducibili (coefficiente forfettario) | deducibili se inerenti |
| IVA | non applicata | applicata e detratta |
| Responsabilità | illimitata (persona fisica) | limitata al capitale |
| Adempimenti | minimi | contabilità ordinaria + bilancio (più commercialista) |
| Tetto ricavi | 85.000 € | nessun tetto |
| Utili | tutto reddito del titolare | dividendi tassati al 26% se distribuiti al socio PF |

Regola pratica (qualitativa, da confermare col commercialista): più i **costi reali** sono
alti rispetto ai ricavi, più la deducibilità della SRL diventa conveniente; sotto gli 85k con
pochi costi, il forfettario di solito vince per semplicità e carico fiscale. **Il punto di
pareggio dipende dai numeri specifici e va calcolato caso per caso.**
