# Awareness playbook — primo layer di visibilità (ricerca verificata 2026-08-06)

> **Cos'è.** Piano operativo per la prima ondata di awareness: partecipazione genuina a repo
> e community dove Mastro può *contribuire valore*, non solo promuoversi. Ogni target qui sotto
> è stato **verificato via GitHub API / fetch diretto il 2026-08-06** (issue aperte, processi di
> contribuzione, regole). Ordinato per impatto × facilità. Le bozze in fondo sono da rivedere
> e postare **a mano** — mai automatizzare l'outreach.

## ⚠️ Pre-flight (blocca tutto il resto)

1. **PUSH.** Il repo pubblico `mikececco/mastro` mostra **3 stelle, ultimo push 2026-06-09** —
   tutti i commit recenti sono solo locali. Quasi ogni lista/directory controlla l'attività
   recente; la più grande (awesome-claude-code) **auto-boccia** repo con commit solo nel primo
   giorno. Niente outreach prima del push.
2. **Allineare le versioni**: `marketplace.json` dice `0.1.0`, `.claude-plugin/plugin.json` e
   il badge README dicono `0.2.0`.
3. **`claude plugin validate ./`** — richiesto dalla pipeline del marketplace ufficiale.

---

## Tier 1 — questa settimana (vittorie quasi certe)

### 1. Marketplace community di Anthropic (la superficie di discovery ufficiale)
- **Cosa**: submission via **platform.claude.com/plugins/submit** (form Console per autori
  individuali; il form claude.ai richiede org Team/Enterprise). Pipeline: validazione
  automatica + security screening + review; una volta approvato, appare su **claude.com/plugins**
  e nel `/plugin` Discover in-app (`@claude-community`), con auto-bump sui push.
- **Perché primo**: è dove gli utenti Claude Code cercano i plugin. Payoff durevole.

### 2. `italia-opensource/awesome-italia-opensource` (329★, merge attivi)
- **Cosa**: PR con un solo file `awesome/opensource/data/mastro.json`
  (schema: name, repository_platform, repository_url, type, license, tag ≤20).
  Titolo PR esatto: **`feat(opensource): added Mastro`**. Non toccare il README (auto-generato).
- **Perché**: **italia-corpus è già in lista** (merged 2026-07-21) — Mastro è il fratello
  naturale. Accettazione quasi certa, audience esattamente giusta (dev italiani). ~30 minuti.

### 3. `openaccountants/openaccountants` (304★, AGPL, push oggi) — due mosse
- **Mossa facile**: PR a `skills/international/italy/references.md` — è *letteralmente* una
  lista "Related Open-Source Projects for Italy" (oggi solo De-CAF e BonusPerMe; MIT è
  dichiarato compatibile). Un file, on-convention.
- **Mossa grossa (da decidere)**: il loro `it-income-tax.md` rimanda a
  **`it-regime-forfettario.md` — che non esiste nel repo** (verificato). Scriverlo noi
  colmerebbe un buco che il repo stesso ammette, con visibilità nel progetto "guide fiscali
  per AI agents" in più rapida crescita (304★ in 4 mesi). ⚠️ Caveat: **CLA + licenza mista
  AGPL/source-available** — contribuire lì significa ri-licenziare quel contenuto secondo i
  loro termini (MIT→loro è lecito, ma va deciso consapevolmente). Bonus: **nessun reviewer IT
  in VERIFIERS.md** — diventare il primo (o portarci un commercialista della community).

### 4. `ahmeabd/italia-corpus` (421★) — il nostro upstream
- **Corroborare issue [#3](https://github.com/ahmeabd/italia-corpus/issues/3)** (manca il testo
  degli articoli di Codice Civile e Penale, 0 commenti): ci tocca direttamente — l'edizione
  SRL cita gli artt. 2462–2483 c.c. Confermare il bug con URN/codici redazionali specifici è
  esattamente ciò che chiede il loro CONTRIBUTING.
- **Aprire il forum Discussions** (vuoto, solo il post di benvenuto del maintainer): post
  "Come Mastro usa italia-corpus" + proposta di sezione **"Used by"** nel README — saremmo il
  primo consumer di produzione nominato, social proof che a un repo da 421★ fa comodo.
- **Ping amichevole**: la pipeline "daily" risulta ferma dal **18 luglio** — segnalarlo è un
  contributo, non promozione. Contatto: Discussions o ahmeabd36@gmail.com.

---

## Tier 2 — settimane 1–2 (contributi tecnici che costruiscono reputazione)

### 5. `OCA/l10n-italy` (222★, 359 issue aperte, Discussions disabilitate)
Commenti sostanziali su issue verificate aperte, dove la conoscenza verificata di Mastro
aggiunge la parte che manca: la **base normativa citata**. In ordine di fit:

| Issue | Angolo del contributo |
|---|---|
| [#4490](https://github.com/OCA/l10n-italy/issues/4490) RegimeFiscale sempre RF01 | Casa nostra: mappa RF19 ↔ L. 190/2014 art. 1 c. 54-89 + conseguenze di un RF sbagliato per un forfettario (natura N2.2, niente IVA) |
| [#3725](https://github.com/OCA/l10n-italy/issues/3725) bollo su fatture in valuta | Il thread dice "77 euro circa": la cifra esatta è **€77,47** (DPR 642/1972 Tariffa art. 13; DM 17/06/2014) — irrobustisce i criteri di accettazione delle 2 PR pendenti |
| [#4378](https://github.com/OCA/l10n-italy/issues/4378) LIPE: credito compensato in VP9 | 0 commenti in 20 mesi; citare le istruzioni AdE su VP9 vs VP8/VP5 definisce il comportamento atteso |
| [#5193](https://github.com/OCA/l10n-italy/issues/5193) TD sbagliato per reverse charge interno | Mappa TD16 ↔ VJ6 (art. 17 c.6 DPR 633/72) dalla Guida AdE |
| [#4341](https://github.com/OCA/l10n-italy/issues/4341) TipoDocumento incompatibile | Matrice TD01–TD29 per direzione, dalle specifiche tecniche FatturaPA |
| [#4510](https://github.com/OCA/l10n-italy/issues/4510) terminologia EN fuorviante | Glossario IT↔EN ancorato agli obblighi (liquidazione ≠ dichiarazione) — vetrina perfetta del metodo Mastro |

Note OCA: issue spesso in italiano; lo stale-bot chiude dopo 6 mesi di inattività → un
commento sostanziale *tiene letteralmente in vita* la issue. Commentare è aperto a tutti
(CLA solo per PR di codice).

### 6. `hesreallyhim/awesome-claude-code` (51.791★ — la lista flagship)
- **Solo via issue form web** (template `recommend-resource.yml`) — le PR non sono accettate,
  e nemmeno submission via CLI. Gate: repo ≥14 giorni con commit dopo il primo giorno
  (**passa solo dopo il push**), descrizione di una riga, fattuale, niente emoji.
  Maintainer dichiaratamente selettivo: aspettarsi anche un no.

### 7. r/ClaudeAI (~1,04M membri)
- Post "I built…" con framing **ingegneristico**, non fiscale: *cita-o-rifiuta + calcolatore
  deterministico + conoscenza versionata contro le allucinazioni fiscali*. È il pattern che
  interessa a quell'audience, l'Italia è il case study. Leggere le regole in-app prima;
  postare da account con un minimo di storia; finestra migliore ven 17–19 UTC.

---

## Tier 3 — settimane 2–4 (i lanci)

### 8. Show HN
- Regole verificate: deve essere provabile subito ✓, mai chiedere upvote, restare nei commenti.
- Precedente forte: ustaxes.org 465 punti; i tool fiscali nazionali funzionano, e **il
  forfettario è già topic di discussione su HN** (il "tax cliff" degli 85k). Nessun tool
  forfettario mai lanciato = corsia libera.
- Titolo tipo: *"Show HN: Mastro – open-source Italian tax engine for Claude Code (every
  rule cited to law text)"*. Feriale, 8–10 ET. Aspettarsi "make one for my country".

### 9. Product Hunt — stessa settimana di Show HN (ammortizza la preparazione), aspettative
  modeste (tool per audience italiana). Non è l'evento principale.

### 10. Reddit Italia (comment-first, mai launch-first)
- **r/ItalyInformatica** (~193k): i dev italiani sono sproporzionatamente forfettari; "ho
  fatto un tool open source per il forfettario" è un genere riconosciuto.
- **r/commercialisti** (~56k, +18,7%/anno): esattamente il dominio; cultura informale.
- **r/ItaliaPersonalFinance** (~281k): mod severi sui promo → prima settimane di commenti
  utili su thread forfettario, poi al massimo un "chiedo feedback".
- ⚠️ Le regole esatte non erano verificabili via API: **leggerle in-app prima di ogni post**.

---

## Tier 4 — continuativo

- **Peer outreach** (scambio genuino di metodo, non promo): [itr-wala](https://github.com/karanb192/itr-wala)
  (India, 37★, il progetto più simile a Mastro), [demarches-skills](https://github.com/PaperasseAI/demarches-skills)
  (Francia, nuovo), **[easypiva](https://github.com/TheStreamCode/easypiva)** (⚠️ overlap
  diretto italiano, 1★ ma push ieri: monitorare o collaborare presto), ru-buh (Russia — solo
  Telegram/email, niente Discussions).
- **[lawve-ai/awesome-legal-skills](https://github.com/lawve-ai/awesome-legal-skills)** (624★,
  attivissima, skill per giurisdizione benvenute): form web su lawve.ai/new/skill, entry 🇮🇹.
- **[davila7/claude-code-templates](https://github.com/davila7/claude-code-templates)** (30k★):
  PR di un agente "regime-forfettario expert" in `domain-experts/`.
- **Schrödinger Hat**: episodio podcast via podcast@schroedinger-hat.org o Discord;
  **OSDay Firenze** (CFP autunno/inverno per marzo 2027).
- Liste minori facili: BehiSecc/awesome-claude-skills (9,9k★), Vaquill-AI/awesome-legaltech (192★).
- **Da saltare** (verificato): moov-io/awesome-fintech (esclude esplicitamente AI experiments;
  le ultime 5 PR simili chiuse senza merge), ccplugins (morto), cc-marketplace (in stallo),
  liste awesome-tax/accounting (non esistono con massa critica).

---

## Regole d'ingaggio

1. **Valore prima, link dopo**: ogni commento deve reggersi anche senza menzionare Mastro.
2. **Dichiarare sempre l'affiliazione** ("maintainer di…").
3. **Mai postare due volte lo stesso contenuto**; un canale alla volta, spaziati.
4. **Leggere le regole in-app** prima di ogni post Reddit (non erano fetchabili via API).
5. Niente automazione dell'outreach: bozze qui, post a mano.

---

## Bozze pronte (da rivedere prima di postare)

### awesome-italia-opensource — `awesome/opensource/data/mastro.json`
```json
{
  "name": "Mastro",
  "repository_platform": "github",
  "repository_url": "https://github.com/mikececco/mastro",
  "site_url": "https://mastrofisco.it",
  "type": "opensource",
  "license": "MIT",
  "description": "Copilota fiscale open-source per la partita IVA in regime forfettario, dentro Claude Code: stima tasse con calcolo deterministico e cita sempre la fonte normativa (via italia-corpus).",
  "tags": ["ai", "fintech", "tax", "claude-code", "plugin", "legaltech", "fisco", "partita-iva"]
}
```
*(Verificare lo schema esatto contro un file merged di recente, es. quello di italia-corpus.)*

### italia-corpus — post per Discussions ("Come usiamo italia-corpus in Mastro")
> Ciao! Volevo condividere un caso d'uso in produzione. Mastro
> (github.com/mikececco/mastro) è un copilota fiscale open-source (MIT) per il regime
> forfettario dentro Claude Code: ogni risposta cita la norma, e il testo di legge dietro
> ogni citazione è a un clic di distanza **grazie a italia-corpus** — la nostra
> `knowledge/fonti.md` mappa ogni regola al file Markdown del corpus (L. 190/2014,
> L. 197/2022, TUIR, DPR 633/1972…). Senza il corpus, "cita la fonte" sarebbe rimasto un
> link a un PDF. Due cose concrete: (1) se vi fa piacere, proporrei una sezione "Used by"
> nel README — apriamo volentieri la PR; (2) su issue #3: confermiamo il problema del
> testo mancante nei Codici — per l'edizione SRL ci servono gli artt. 2462–2483 c.c. e
> possiamo contribuire URN specifici. Grazie per questo progetto.

### OCA #4490 — schema del commento (in italiano, da rifinire)
> Contributo sul quadro normativo, sperando aiuti il backport: RF19 corrisponde al regime
> di cui all'art. 1, commi 54–89, L. 190/2014. Per un cedente forfettario l'emissione con
> RF01 è incoerente con il resto del documento (righe senza IVA con natura N2.2 ex commi
> 58–59): SDI accetta il file, ma il documento dichiara un regime che non è quello del
> cedente, con potenziali contestazioni in sede di controllo. Riferimenti: specifiche
> tecniche FatturaPA v1.9 (tabella RegimeFiscale) e L. 190/2014 via Normattiva. \[Disclosure:
> maintainer di Mastro, un progetto open-source che mantiene la conoscenza del forfettario
> verificata e citata — da lì la mappatura.\]

### r/ClaudeAI — scheletro del post
> **Title**: I built a Claude Code plugin that refuses to answer when it can't cite the law
> (Italian tax edition)
> **Body**: pattern ingegneristico (cite-or-refuse, calcolatore deterministico in shell,
> knowledge Markdown versionata con date di verifica, freshness gate deterministico perché
> il modello sbaglia le date), poi l'Italia come case study, link repo, honest beta framing.

### Show HN
> **Title**: Show HN: Mastro – open-source Italian tax engine for Claude Code (every rule
> cited to law text)
> Primo commento: perché il forfettario è interessante (il tax cliff a 85k), l'architettura
> anti-allucinazione, cosa manca (SRL), invito a "fork it for your country".
