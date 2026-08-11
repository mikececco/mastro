# Contribuire a Mastro

Mastro vive o muore sulla **correttezza della conoscenza fiscale**. Il contributo più
prezioso è tenere aggiornato `knowledge/` a ogni Legge di Bilancio, con le fonti.

## Principio: la conoscenza è citata e versionata
Ogni file in `knowledge/` ha un frontmatter con `sources`, `valid_from`, `valid_to`.
Non si scrive un numero fiscale senza una fonte (legge, circolare, Agenzia delle Entrate).
Se non hai la fonte, apri una issue invece di indovinare.

**Come verificare contro la norma.** Per il testo di legge usa
[italia-corpus](https://github.com/ahmeabd/italia-corpus) (tutta la legislazione di Normattiva
in Markdown) o [dati.normattiva.it](https://dati.normattiva.it) (il portale open data ufficiale,
API + Akoma Ntoso/XML/JSON, CC BY 4.0) e la mappa in [`knowledge/fonti.md`](./knowledge/fonti.md):
collega ogni regola all'atto, su Normattiva e su italia-corpus. Per coefficienti, aliquote INPS
e prassi, usa rispettivamente l'Allegato 2 della L. 190/2014, le circolari INPS dell'anno e le
circolari/risposte AdE. Se aggiungi o correggi una regola, aggiorna anche `fonti.md`.

> **Nota — non esiste un "italia-corpus" per la prassi.** A differenza delle leggi, circolari
> INPS, risoluzioni e interpelli AdE non hanno un portale open/API: vivono solo dietro un motore
> di ricerca HTML, senza export né permalink stabile garantito. Per questo, quando verifichi una
> regola contro una circolare o una risoluzione, **archivia il testo rilevante** (anche solo il
> paragrafo citato) nel file di conoscenza stesso — non solo il link. Il link può rompersi o
> essere riorganizzato; la citazione testuale nel file resta. È una convenzione minima, non un
> progetto a sé: cresce come sottoprodotto della verifica normale, un file alla volta.

## Aggiornare per un nuovo anno (es. Legge di Bilancio 2027)
1. Crea `knowledge/2027/` copiando i file dell'anno precedente.
2. Aggiorna i valori che cambiano (soglie, aliquote, coefficienti se rivisti, INPS).
3. Per ogni file aggiornato: aggiorna `valid_from`/`valid_to`, aggiungi/aggiorna `sources`,
   e imposta lo `status` corretto (`VERIFICATO`, `CITATO` o `DRAFT_SCHELETRO` — vedi
   `knowledge/regole.md` §7). `VERIFICATO` solo dopo una vera seconda lettura sulla fonte ufficiale.
4. Imposta `valid_to: 2026-12-31` sui file 2026 (così la `freshness.sh` avvisa quando sono vecchi).
5. Esegui i test: `sh tests/calc.test.sh && sh tests/freshness.test.sh`.
6. Apri una PR citando le fonti nel corpo.

## Modificare il calcolo (`scripts/calc.sh`)
`calc.sh` è **pura aritmetica**: non deve contenere costanti fiscali d'anno (aliquote,
coefficienti). Quelle arrivano come argomenti dai comandi, che le leggono da `knowledge/`.
Se aggiungi una formula, aggiungi anche i test in `tests/calc.test.sh`. Mai mergiare con i
test rossi.

## Comandi (`commands/`)
Sono prompt. Devono sempre rimandare a `knowledge/regole.md` e rispettare cita-o-rifiuta,
echo-and-confirm, e la regola del "mai affermare l'idoneità".

## Disclaimer
Mastro è uno strumento di comunità, non un servizio di consulenza fiscale. Ogni contributo
deve preservare il disclaimer e il rimando al commercialista.
