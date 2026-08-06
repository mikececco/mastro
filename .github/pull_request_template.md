## Cosa cambia

<!-- Descrizione breve. Se tocchi knowledge/, indica QUALE regola e PERCHÉ. -->

## Checklist (per PR che toccano `knowledge/` o `scripts/`)

- [ ] Ogni numero/regola nuova o modificata **cita la fonte** (legge, circolare, provvedimento) nel file
- [ ] `knowledge/fonti.md` aggiornata se ho aggiunto/spostato una regola
- [ ] Frontmatter aggiornato (`sources`, `valid_from`, `valid_to`)
- [ ] `status: VERIFICATO` **solo** se ho verificato sulla fonte ufficiale (altrimenti lasciare lo stato onesto)
- [ ] Niente costanti fiscali dentro `scripts/calc.sh` (arrivano dalla conoscenza come argomenti)
- [ ] Test verdi: `sh tests/calc.test.sh && sh tests/freshness.test.sh`
