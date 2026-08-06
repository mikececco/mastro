# Security policy

Mastro gira in locale dentro Claude Code, non ha un server e non trasmette dati. La
superficie di sicurezza è quindi piccola, ma esiste: gli script shell (`scripts/`,
`tests/`) e i prompt dei comandi (`commands/`), che potrebbero essere vettori di
prompt-injection o di esecuzione non voluta.

**Per segnalare una vulnerabilità:** usa
[GitHub Security Advisories](https://github.com/mikececco/mastro/security/advisories/new)
(segnalazione privata). Non aprire una issue pubblica per problemi di sicurezza.

Errori **fiscali** (numeri o regole sbagliate) non sono vulnerabilità: per quelli c'è
l'apposito template di issue "Segnala un errore fiscale".
