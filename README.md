<p align="center">
  <img src="./assets/mastro-linkedin-banner.png" alt="Mastro — il copilota open-source per la partita IVA forfettaria" width="900">
</p>

# Mastro

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE) ![Status](https://img.shields.io/badge/status-v0.2%20beta-yellow) ![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-8A2BE2) [![tests](https://github.com/mikececco/mastro/actions/workflows/ci.yml/badge.svg)](https://github.com/mikececco/mastro/actions/workflows/ci.yml)

Un copilota **open-source** per chi ha la **partita IVA in regime forfettario**, pensato
per girare dentro [Claude Code](https://claude.com/claude-code). Mastro risponde a domande
sul regime, stima le tasse, segnala scadenze ed esclusioni — **citando sempre la fonte**.

🌐 **[mastrofisco.it](https://mastrofisco.it)** · 🇬🇧 [English summary below](#-in-english)

> ⚠️ **Stato: beta (v0.2).** La conoscenza fiscale del forfettario è stata **verificata contro
> fonti ufficiali** (Agenzia delle Entrate, Normattiva, INPS Circ. 8/2026 e 14/2026) il 2026-06-09;
> manca il dogfood end-to-end. L'edizione SRL è ancora uno scheletro. Mastro è un aiuto, non
> sostituisce il commercialista.

## Cos'è (e cosa non è)
Mastro è uno strumento **personale e di comunità**, trasparente e ispezionabile. Non è un
SaaS, non invia i tuoi dati da nessuna parte, non emette fatture e **non sostituisce il
commercialista**: ogni risposta che produce un numero o un giudizio di idoneità lo dice
esplicitamente.

La differenza con gli strumenti AI esistenti per forfettari: Mastro è **gratuito, aperto,
tuo, e cita le fonti**. La conoscenza fiscale vive come Markdown versionato in questa repo —
puoi leggerla, correggerla, e aprire una PR a ogni Legge di Bilancio.

## Comandi (v1)
_I quattro comandi sono già implementati; in fase di verifica/dogfood (vedi [TODOS.md](./TODOS.md)) prima del rilascio stabile._

| Comando | Cosa fa |
|---|---|
| `/chiedi` | Domanda libera sul regime forfettario, risposta con citazione o rifiuto se non c'è fonte |
| `/tasse` | Stima imposta sostitutiva + INPS + acconti (con echo di coefficiente/aliquota usati) |
| `/scadenze` | Calendario delle scadenze (acconti, saldo, INPS, dichiarazione) |
| `/idoneo` | Controllo idoneità: segnala le possibili cause di esclusione (non afferma mai "sei idoneo") |

### Edizione SRL (v2, in costruzione ma già utile)
| Comando | Cosa fa |
|---|---|
| `/srl` | Domande sull'SRL: IRES, IRAP (con le aliquote di tutte le regioni 2026), dividendi, compenso amministratore, INPS di soci e amministratori, accantonamenti, incentivi |
| `/confronta` | Forfettario vs SRL: mostra i **due poli** del prelievo (dividendo vs compenso) invece di un numero unico falsamente preciso |

La conoscenza SRL vive in [`knowledge/2026/srl/`](./knowledge/2026/srl) ed è marcata
**`status: CITATO`**: ogni cifra ha la sua fonte primaria (Normattiva, istruzioni AdE, banca
dati MEF, circolari INPS), ma **non ha ancora una seconda lettura** — e i comandi lo dicono in
ogni risposta. Su ciò che non è ancora scritto (acconti, codici tributo F24, deducibilità
puntuale di auto/telefonia/rappresentanza, ammortamenti ordinari) `/srl` **rifiuta**
onestamente invece di inventare. Vedi [TODOS.md](./TODOS.md).

> ⚠️ **Attenzione, SRL ≠ forfettario anche nel metodo**: la SRL è tassata per **competenza**,
> non per cassa. Dalle sole fatture **non** si ricava l'utile (mancano ammortamenti, rimanenze,
> ratei, TFR): ogni numero SRL derivato dalle fatture è una stima, e Mastro lo dichiara.

## Installazione
Mastro è un plugin per [Claude Code](https://claude.com/claude-code).

1. Aggiungi questa repo come marketplace di plugin:
   ```
   /plugin marketplace add mikececco/mastro
   ```
2. Installa il plugin:
   ```
   /plugin install mastro@mastro-marketplace
   ```
3. Prova un comando: `/tasse`, `/chiedi`, `/idoneo`, `/scadenze`.

In alternativa, clona la repo e provala in locale:
```sh
git clone https://github.com/mikececco/mastro.git
cd mastro
sh tests/calc.test.sh && sh tests/freshness.test.sh   # 25 test, tutti verdi
```

## Architettura
- **Conoscenza** (`knowledge/`): Markdown citato e versionato. `regole.md` = regole trasversali
  (cita-o-rifiuta, criterio temporale per regime, livelli di verifica, disclaimer).
  `2026/` = dati dell'anno; `2026/srl/` = edizione SRL.
- **Calcolo** (`scripts/`): calcolatori deterministici in shell puro, niente costanti fiscali
  hardcoded (le aliquote arrivano dalla conoscenza come argomenti). `calc.sh` per il
  forfettario, `calc-srl.sh` per IRES/IRAP/acconti.
- **Comandi** (`commands/`): i prompt slash-command che orchestrano conoscenza + calcolo.
- **Freschezza** (`scripts/freshness.sh`): gate deterministico sul `valid_to` dei file — e un
  cron settimanale che apre una issue quando la conoscenza scade.

## Test
```sh
sh tests/calc.test.sh
sh tests/calc-srl.test.sh
sh tests/freshness.test.sh
```

## Fonti
I dati fiscali sono ancorati alla normativa: ogni file in `knowledge/` riporta la fonte e
l'anno di validità, e [`knowledge/fonti.md`](./knowledge/fonti.md) mappa ogni regola al testo
di legge. Per il testo delle norme Mastro si appoggia a
**[italia-corpus](https://github.com/ahmeabd/italia-corpus)** (di [@ahmeabd](https://github.com/ahmeabd)):
tutta la legislazione italiana di Normattiva, in Markdown, pubblico dominio, aggiornata ogni
giorno. Grazie a questo progetto, leggere la norma dietro a una risposta di Mastro è a un clic
di distanza.

## 🇬🇧 In English

**Mastro is an open-source tax copilot for Italy's flat-tax regime ("regime forfettario"),
built as a Claude Code plugin.** The interesting part is the architecture, not the country:

- **Cite-or-refuse**: every answer carries its legal citation (statute, INPS/tax-agency
  circular), or the model refuses instead of hallucinating. The fiscal knowledge lives as
  versioned, dated Markdown in [`knowledge/`](./knowledge) — inspectable and PR-able.
- **Deterministic math**: numbers never come from the LLM. A pure-shell calculator
  ([`scripts/calc.sh`](./scripts/calc.sh)) does the arithmetic, with rates passed in from
  the knowledge layer. Tested in CI.
- **Deterministic freshness**: models are bad at date math, so a tiny script
  ([`scripts/freshness.sh`](./scripts/freshness.sh)) decides whether the fiscal data is
  stale before any answer is given.
- **Local-first**: no SaaS, no accounts, your numbers never leave your machine. MIT.

Law text is one click away thanks to
[italia-corpus](https://github.com/ahmeabd/italia-corpus) — all Italian legislation from
Normattiva, in Markdown, updated daily. Fork the pattern for your country's tax system.

## Licenza
MIT. Vedi [LICENSE](./LICENSE).

---
*Mastro è un aiuto, non un commercialista. Verifica sempre le decisioni fiscali con un professionista.*
