# Contribuire a Mastro

Mastro vive o muore sulla **correttezza della conoscenza fiscale**. Il contributo più
prezioso è tenere aggiornato `knowledge/` a ogni Legge di Bilancio, con le fonti.

## Principio: la conoscenza è citata e versionata
Ogni file in `knowledge/` ha un frontmatter con `sources`, `valid_from`, `valid_to`.
Non si scrive un numero fiscale senza una fonte (legge, circolare, Agenzia delle Entrate).
Se non hai la fonte, apri una issue invece di indovinare.

## Aggiornare per un nuovo anno (es. Legge di Bilancio 2027)
1. Crea `knowledge/2027/` copiando i file dell'anno precedente.
2. Aggiorna i valori che cambiano (soglie, aliquote, coefficienti se rivisti, INPS).
3. Per ogni file aggiornato: aggiorna `valid_from`/`valid_to`, aggiungi/aggiorna `sources`,
   e imposta `status: VERIFIED` solo dopo aver verificato contro la fonte ufficiale.
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
