---
title: SRL (Società a Responsabilità Limitata) — nozioni di base
anno: 2026
sources:
  - "TUIR (DPR 917/1986): IRES art. 75 ss.; principio di inerenza e competenza art. 109"
  - "D.Lgs. 446/1997: IRAP (valore della produzione netta, aliquota ordinaria)"
  - "DPR 633/1972: IVA (aliquota ordinaria e detrazione)"
valid_from: 2026-01-01
valid_to: 2026-12-31
status: DRAFT_SCHELETRO   # v2: solo i fatti stabili e citabili. Il grosso (deducibilità di dettaglio, ammortamenti, bilancio) è ancora da scrivere e verificare.
---

# SRL — scheletro (v2, in costruzione)

> ⚠️ Questo file è uno **scheletro**. Contiene solo i fatti SRL stabili e citabili.
> I comandi `/srl` e `/confronta` rispondono **solo** da qui (cita-o-rifiuta): su tutto
> ciò che non è ancora scritto risponderanno "non ho una fonte verificata", senza inventare.
> Il calcolo fiscale SRL di dettaglio è lavoro v2 (vedi TODOS.md).

## Cos'è (in due righe)
La SRL è una società di capitali: ha **personalità giuridica** e **responsabilità limitata**
(i soci rispondono nei limiti del capitale conferito, salvo eccezioni). Tiene **contabilità
ordinaria** e deposita un **bilancio**. A differenza del forfettario, **i costi inerenti
all'attività sono deducibili**.

## Imposte principali (fatti stabili)
- **IRES**: imposta sul reddito delle società, aliquota **24%** sul reddito d'impresa
  *(fonte: TUIR, IRES)*.
- **IRAP**: imposta regionale sulle attività produttive, aliquota **ordinaria 3,9%** sul
  valore della produzione netta (le Regioni possono variarla; alcuni settori hanno aliquote
  diverse) *(fonte: D.Lgs. 446/1997)*.
- **IVA**: la SRL **applica e detrae** l'IVA. Aliquota ordinaria **22%** (più ridotte 10% / 5%
  / 4% per specifici beni/servizi) *(fonte: DPR 633/1972)*. Differenza chiave col forfettario,
  che l'IVA non la applica né la detrae.
- **Dividendi**: l'utile distribuito ai soci è tassato in capo al socio (regime dei dividendi).

## Deducibilità dei costi — principio (non i dettagli)
Un costo è deducibile se rispetta **inerenza** (collegato all'attività), **competenza**
(imputato all'anno giusto) e **certezza/determinabilità** *(fonte: TUIR art. 109)*.
Molte voci hanno regole o percentuali specifiche (auto, telefonia, spese di rappresentanza,
vitto e alloggio, ammortamenti dei beni strumentali): **queste percentuali NON sono ancora
in questo file** — su di esse i comandi rifiuteranno finché non saranno scritte e verificate.

## Forfettario vs SRL — i poli del confronto
| | Forfettario | SRL |
|---|---|---|
| Tassazione | imposta sostitutiva 5%/15% su reddito = ricavi×coefficiente | IRES 24% + IRAP ~3,9% sull'utile |
| Costi | NON deducibili (coefficiente forfettario) | deducibili se inerenti |
| IVA | non applicata | applicata e detratta |
| Responsabilità | illimitata (persona fisica) | limitata al capitale |
| Adempimenti | minimi | contabilità ordinaria + bilancio (più commercialista) |
| Tetto ricavi | 85.000 € | nessun tetto |

Regola pratica (qualitativa, da confermare col commercialista): più i **costi reali** sono
alti rispetto ai ricavi, più la deducibilità della SRL diventa conveniente; sotto gli 85k con
pochi costi, il forfettario di solito vince per semplicità e carico fiscale. **Il punto di
pareggio dipende dai numeri specifici e va calcolato caso per caso.**
