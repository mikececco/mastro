<p align="center">
  <img src="./assets/mastro-linkedin-banner.png" alt="Mastro — il copilota open-source per la partita IVA forfettaria" width="900">
</p>

# Mastro

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE) ![Status](https://img.shields.io/badge/status-v0.2%20beta-yellow) ![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-8A2BE2) [![tests](https://github.com/mikececco/mastro/actions/workflows/ci.yml/badge.svg)](https://github.com/mikececco/mastro/actions/workflows/ci.yml)

Un copilota **open-source** per chi ha la **partita IVA in regime forfettario**, pensato
per girare dentro [Claude Code](https://claude.com/claude-code). Mastro risponde a domande
sul regime, stima le tasse, segnala scadenze ed esclusioni — **citando sempre la fonte**.

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

### Edizione SRL (in costruzione)
| Comando | Cosa fa |
|---|---|
| `/srl` | Domande sull'SRL (IRES, IRAP, IVA, deducibilità). v2: risponde solo da fonte verificata, niente invenzioni |
| `/confronta` | Forfettario vs SRL: quale conviene e quando ha senso passare (confronto orientativo) |

> Le due edizioni condividono lo stesso core. Forfettario è la v1; la conoscenza fiscale SRL è
> ancora uno scheletro, quindi `/srl` rifiuta onestamente ciò che non è ancora verificato.

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
I dati fiscali sono ancorati alla normativa: ogni file in `knowledge/` riporta la fonte e
l'anno di validità, e [`knowledge/fonti.md`](./knowledge/fonti.md) mappa ogni regola al testo
di legge. Per il testo delle norme Mastro si appoggia a
**[italia-corpus](https://github.com/ahmeabd/italia-corpus)** (di [@ahmeabd](https://github.com/ahmeabd)):
tutta la legislazione italiana di Normattiva, in Markdown, pubblico dominio, aggiornata ogni
giorno. Grazie a questo progetto, leggere la norma dietro a una risposta di Mastro è a un clic
di distanza.

## Licenza
MIT. Vedi [LICENSE](./LICENSE).

---
*Mastro è un aiuto, non un commercialista. Verifica sempre le decisioni fiscali con un professionista.*
