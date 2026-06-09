# Mastro

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE) ![Status](https://img.shields.io/badge/status-v0.1%20WIP-orange) ![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-8A2BE2) ![Tests](https://img.shields.io/badge/tests-25%20passing-brightgreen)

Un copilota **open-source** per chi ha la **partita IVA in regime forfettario**, pensato
per girare dentro [Claude Code](https://claude.com/claude-code). Mastro risponde a domande
sul regime, stima le tasse, segnala scadenze ed esclusioni — **citando sempre la fonte**.

> ⚠️ **Stato: work in progress (v0.1).** I file di conoscenza fiscale sono in fase di
> verifica. Non usare per decisioni definitive finché la v1 non è completa e verificata.

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
  (cita-o-rifiuta, disclaimer, principio di cassa). `2026/` = dati dell'anno.
- **Calcolo** (`scripts/calc.sh`): calcolatore deterministico in shell puro, niente costanti
  fiscali hardcoded (le aliquote arrivano dalla conoscenza). Testato in `tests/calc.test.sh`.
- **Comandi** (`commands/`): i prompt slash-command che orchestrano conoscenza + calcolo.

## Test
```sh
sh tests/calc.test.sh
sh tests/freshness.test.sh
```

## Fonti
I dati fiscali sono ancorati alla normativa (es. coefficienti di redditività → Allegato 2,
L. 190/2014). Ogni file in `knowledge/` riporta la fonte e l'anno di validità.

## Licenza
MIT. Vedi [LICENSE](./LICENSE).

---
*Mastro è un aiuto, non un commercialista. Verifica sempre le decisioni fiscali con un professionista.*
