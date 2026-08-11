# CLAUDE.md — istruzioni di progetto per Mastro

Questo file è il punto d'ingresso per chiunque lavori su Mastro, umano o agente. Contiene i
vincoli che non cambiano da una sessione all'altra. Per il resto, i file linkati sono la fonte
di verità — non duplicare qui il loro contenuto.

## Cos'è Mastro
Copilota fiscale open-source (MIT) per l'Italia — regime forfettario (v1, verificato) ed
edizione SRL (v2, in costruzione) — plugin per Claude Code. Cita-o-rifiuta, calcolo
deterministico, nessun dato lasciato il dispositivo dell'utente. Dettagli: [`README.md`](./README.md).

## Il vincolo che non si negozia: il confine legale
Mastro si posiziona fuori dal perimetro dell'**esercizio abusivo della professione**
(art. 348 c.p.) **per struttura**: gratuito, locale, anonimo, a sessioni isolate, nessun atto
riservato ai commercialisti. Questo non è marketing — è un vincolo di design verificato in
[`docs/posizionamento-legale.md`](./docs/posizionamento-legale.md) e codificato in
[`knowledge/regole.md`](./knowledge/regole.md) §8.

**Prima di implementare qualunque funzionalità**, controlla se introduce anche uno solo di
questi quattro elementi — se sì, fermati e chiedi, non procedere autonomamente:
1. Un pagamento legato a una risposta fiscale personalizzata.
2. Un rapporto continuativo con un cliente identificato (account, storico, "presa in carico").
3. Un atto riservato: firma, certificazione, asseverazione, deposito, trasmissione (SdI, F24,
   dichiarazioni), rappresentanza davanti ad AdE o Corti tributarie.
4. Una conclusione vincolante al posto di una citazione + un calcolo (es. "sei idoneo").

Questo è anche il fondamento legale (non solo strategico) del "confine che non attraversiamo"
in [`docs/strategia-opensource.md`](./docs/strategia-opensource.md) §5: mai il ledger, mai la
trasmissione SdI/F24. Le due ragioni — posizionamento di mercato e diritto penale/professionale
— puntano nella stessa direzione, e nessuna delle due si aggira con un'interpretazione furba.

## Direzione strategica
"Il cervello fiscale aperto, non il ledger" — intelligence layer + open rules layer, beachhead
SRL. Deciso il 2026-08-06, verificato con ricerca competitiva. Non ripetere la valutazione da
zero: leggi [`docs/strategia-opensource.md`](./docs/strategia-opensource.md) e
[`docs/landscape-2026-08.md`](./docs/landscape-2026-08.md) prima di proporre un cambio di
direzione (es. "costruiamo il ledger", "diventiamo un intermediario SdI").

## Conoscenza fiscale e comandi
- La costituzione di ogni comando: [`knowledge/regole.md`](./knowledge/regole.md) — cita-o-rifiuta,
  criterio temporale per regime, livelli di verifica (`VERIFICATO`/`CITATO`/`DRAFT_SCHELETRO`),
  il confine legale.
- La mappa fonte-per-fonte: [`knowledge/fonti.md`](./knowledge/fonti.md) — include l'avviso
  sui limiti di italia-corpus (copre solo la legislazione, non la prassi INPS/AdE).
- Calcolo: `scripts/calc.sh` (forfettario) e `scripts/calc-srl.sh` (SRL) sono pura aritmetica,
  niente costanti fiscali hardcoded. Test in `tests/`, sempre verdi prima di un merge.
- Come aggiornare per un nuovo anno o verificare una fonte: [`CONTRIBUTING.md`](./CONTRIBUTING.md)
  (include la convenzione "archivia-mentre-verifichi": non esiste un italia-corpus per la
  prassi INPS/AdE, quindi il testo citato va archiviato nel file stesso, non solo linkato).

## Cosa non fare mai (riassunto operativo)
- Non promuovere un file a `status: VERIFICATO` senza una vera seconda lettura sulla fonte primaria.
- Non inventare un numero, un codice tributo o una percentuale quando manca la fonte — rifiuta.
- Non aggiungere funzionalità che tocchino il confine legale sopra senza fermarti a chiederlo.
- Non trattare `docs/posizionamento-legale.md` come un parere legale definitivo per decisioni
  ad alto rischio (un tier a pagamento, un account utente, qualunque forma di filing): a quel
  punto serve un legale vero, non questo file.
