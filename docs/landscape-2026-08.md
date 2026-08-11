# Landscape competitivo — OSS fiscale e mercato SRL (snapshot 2026-08-06)

> **Cos'è questo documento.** Ricerca competitiva a supporto di
> [`strategia-opensource.md`](./strategia-opensource.md): (1) i progetti open-source di
> contabilità/fisco nel mondo, (2) lo stack open-source italiano, (3) il mercato commerciale
> per le SRL. Tre ricerche indipendenti, verificate via GitHub API e fonti web il 2026-08-06.
> Conclusione in fondo: la posizione "open fiscal intelligence layer per la SRL" non ha
> concorrenti — né open né commerciali — all'intersezione che ci interessa.

---

## 1. Il mondo: chi ha già fatto "open-source accounting per il paese X"

### Il pattern accounted esiste in un solo esemplare agent-native

| Paese | Progetto | Stato (2026-08) | Note |
|---|---|---|---|
| 🇸🇪 Svezia | [accounted](https://github.com/erp-mafia/accounted) | 209★, AGPL-3.0, push oggi | L'unico engine nazionale **agent-native**: 100+ MCP tools, "agents propose, deterministic core decides", regole svedesi **hardcoded nell'app** (nessun rules layer separato) |
| 🇪🇸 Spagna | [FacturaScripts](https://github.com/NeoRazorX/facturascripts) | 487★, LGPL, push oggi | Il più chiaro "OSS per paese X" pre-AI; regole nel codice |
| 🇩🇪 Germania | [Kivitendo](https://github.com/kivitendo/kivitendo-erp) (118★), RechnungsFee (59★) | vivi | Pattern tedesco dominante: OSS che *esporta verso DATEV* del commercialista, non che lo sostituisce |
| 🇬🇧 UK | solo client MTD hobbistici (ac000/itsa ecc.) | vivi ma micro | MTD ITSA obbligatorio da aprile 2026: opportunità aperta, nessuno l'ha presa |
| 🇷🇺 Russia | [ru-buh](https://github.com/AlsKozlov/ru-buh) | 10★, alpha, attivo | **Strutturalmente il progetto più simile a Mastro**: knowledge fiscale in Markdown+YAML + MCP, niente ledger. Valida il pattern |
| 🇫🇷 🇳🇱 🇳🇴 ecc. | niente di equivalente | — | Dolibarr/Paheko generici; Skatteetaten (NO) pubblica schemi SAF-T come dati |

### Rules-as-code: le regole fiscali come bene pubblico esistono — ma in un altro mondo

- **[OpenFisca](https://github.com/openfisca)** (openfisca-france 308★, attivo, usato dallo Stato francese): regole come artefatto puro — formule Python + parametri YAML versionati per data, disaccoppiati da qualsiasi app. **openfisca-italy: morto dal 2018 (10★).**
- **[PolicyEngine](https://github.com/PolicyEngine)** (US/UK attivi): stessa filosofia. **policyengine-it: stub vuoto.**
- **[Catala](https://github.com/CatalaLang/catala)** (2.357★): linguaggio per specificare la legge come codice (Inria, benedetto dallo Stato francese).
- **[IRS Direct File](https://github.com/IRS-Public/direct-file)** (4.579★): l'IRS ha open-sourced il suo motore dichiarativo (Fact Graph) nel 2025.

**L'osservazione chiave del landscape globale:** il mondo rules-as-code (OpenFisca/Catala/
PolicyEngine) e il mondo OSS-bookkeeping (accounted/Kivitendo/OCA) sono **comunità
completamente disgiunte**. accounted ha l'engine aperto ma le regole hardcoded; OpenFisca ha
le regole aperte ma nessun engine. **Nessuno, in nessun paese, ha collegato "regole fiscali
come dato aperto e verificato" + "superficie agent-native".** Quello slot è vuoto ovunque —
e in Italia entrambe le metà sono vuote.

### AI-native / MCP nel bookkeeping (2025-26)

- **[openaccountants](https://github.com/openaccountants/openaccountants)** (304★ in 4 mesi,
  AGPL, push oggi): guide fiscali per AI agents, 230 giurisdizioni, review da professionisti
  nominati, MCP server. **Il competitor concettuale più vicino al nostro "rules layer"** — ma:
  guide ≠ regole eseguibili, niente calcolo, e profondità italiana non verificata/superficiale.
  Da monitorare: potrebbe commoditizzare il knowledge layer generalista. La profondità
  verticale (coefficienti, deducibilità, acconti, con citazione puntuale) resta scoperta.
- MCP server ufficiali su backend proprietari: Xero (348★), Moneybird, Lexware, Norman —
  il pattern "rails per agenti" arriva via SaaS chiusi, non via OSS.
- [dubbl](https://github.com/dubbl): nuovo "open Xero alternative" generico con MCP. Da tenere d'occhio.

---

## 2. L'Italia open-source: mappa e vuoti

### Cosa c'è (e vive)

| Progetto | Stato | Cosa fa |
|---|---|---|
| [OCA/l10n-italy](https://github.com/OCA/l10n-italy) | 222★, AGPL, push oggi, community sana | La sola stack contabile open seria: FatturaPA in/out (+ reverse charge, split payment, bollo, ritenute), registri IVA, LIPE, bilancio UE/XBRL, intrastat, cespiti — **come moduli Odoo** |
| [italia-corpus](https://github.com/ahmeabd/italia-corpus) | 421★, MIT, attivo | Tutta la legislazione da Normattiva in Markdown. Il layer "testo di legge" esiste ✓ |
| [OpenSTAManager](https://github.com/devcode-it/openstamanager) | 146★, GPL, attivo | Gestionale PHP con FE |
| Librerie FatturaPA | .NET 207★ e PHP attive; **Python (a38, 54★) ferma da gen 2024** | Plumbing XML |
| [Solede/italian_invoice](https://github.com/Solede-SA/italian_invoice) | 7★, attivo | L'unica localizzazione ERPNext viva |

### I vuoti confermati (verificati, non presunti)

1. **Calcolo fiscale in the open: zero.** Nessun OSS calcola IRES/IRAP/liquidazione IVA.
   OCA si ferma a documenti e registri (niente dichiarazioni, niente F24, niente computo imposte).
2. **OpenFisca-Italy morto dal 2018, policyengine-it vuoto** → l'Italia non ha un motore
   di regole fiscali aperto. Lo slot è libero.
3. **F24: completamente scoperto** in OSS — e per una SRL è il dolore più frequente
   (IVA, ritenute, acconti IRES/IRAP, INPS).
4. **Vuoto Python**: a38 (la lib FatturaPA di riferimento) non mantenuta da 2,5 anni;
   FeCscraper (portale AdE, download massivo) fermo dal 2023.
5. **Knowledge layer**: italia-corpus dà la legge grezza; **nessuno offre le regole di
   pratica fiscale (aliquote, soglie, scadenze, tabelle di deducibilità) come dato
   strutturato, verificato e citato.** Manca anche un corpus aperto di prassi
   (circolari, risoluzioni, interpelli AdE).
6. **AI + fisco italiano open: campo vuoto.** La Germania ha SteuerLLM, gli USA hanno
   OpenTax; l'Italia non ha nulla di open.

**OCA l10n-italy è un alleato/consumatore naturale, non un concorrente**: hanno bisogno di
regole verificate e non fanno intelligence. Stesso discorso per l'ecosistema GOBL
([gobl.fatturapa](https://github.com/invopop/gobl.fatturapa), attivo).

---

## 3. Il mercato commerciale SRL: dove sono i soldi e dove sono i buchi

### La dinamica strutturale (confermata)

Il modello commercialista-centrico è intatto: la SRL tiene al massimo un tool di
fatturazione/pre-contabilità (Fatture in Cloud ~€12/mese, Easyfatt, conto fintech); libro
giornale, dichiarazioni, bilancio e F24 vivono nella suite dello studio (TeamSystem,
Zucchetti, Wolters Kluwer, Sistemi, Datev Koinos ≈ 90% degli studi). Persino la disruption
fintech (Qonto/Regate) ora **corteggia il commercialista invece di disintermediarlo**.
Redditi SC e deposito bilancio XBRL passano di fatto da canali professionali (Entratel).

### Ancore di prezzo

- Commercialista tradizionale, SRL ordinaria: **€2.500–5.000+/anno** all-in (solo contabilità €1.500–3.000).
- "Commercialista online" per SRL (Consulens, TurboTasse, ecc.): **€200–400/mese**, prezzi quote-only — sono studi con un portale, non software company.
- Fiscozen (€11M+ raccolti) e Xolo: **solo partita IVA individuale. La SRL non è servita** dai challenger digitali.

### Il dolore documentato

- **Shock acconti di novembre**: importi "spesso consistenti che incidono in maniera
  rilevante sulla liquidità" (stampa fiscale); chi non pianifica rateizza con maggiorazione.
- **Opacità**: parcelle poco chiare, F24 a sorpresa, nessuna visibilità infra-annuale sulla
  posizione IRES/IRAP. L'intera industria del content "pianificazione fiscale SRL" è la
  prova della domanda insoddisfatta.

### Il tier AI commerciale (2025-26) — e il buco esatto

One Fiscale AI (WK), FiscoAI, Trovanorma, Normo.ai: tutti **citano le fonti** (è diventato
lo standard del pitch) — ma sono **database di ricerca per professionisti**: rispondono
sulla legge in astratto, **non vedono i dati dell'azienda**. I gestionali vedono i dati ma
non citano la legge. Il 65% dei commercialisti usa già AI (2026); la legge 132/2025 obbliga
a dichiararne l'uso al cliente.

**L'intersezione è vuota:** *"ecco la tua IRES proiettata, calcolata dai tuoi numeri,
ex art. 77 TUIR, ed ecco perché"* — nessun prodotto lo fa, né open né chiuso, né per
il professionista né (soprattutto) per il titolare della SRL.

---

## 4. Sintesi: la posizione

**Tesi confermata dalla ricerca.** La posizione 2+3 della strategia
(intelligence layer + open rules layer) non ha concorrenti sull'intersezione, e il focus
SRL la rafforza:

1. **Il titolare di SRL non ha alcun prodotto.** I challenger si fermano alla P.IVA
   individuale; i servizi "SRL online" sono commercialisti in outsourcing; le suite servono
   lo studio. Willingness-to-pay dimostrata: €2.500–5.000/anno al commercialista,
   €200–400/mese ai servizi online.
2. **Il rules layer italiano è uno slot vuoto certificato**: OpenFisca-Italy morto,
   policyengine-it vuoto, OCA regole-nei-moduli, openaccountants senza profondità italiana.
   Il formato di Mastro (Markdown + YAML, verificato, citato, versionato per anno) è già
   l'artefatto giusto; ru-buh e openaccountants validano il pattern nel mondo agent.
3. **Nessuno al mondo ha unito regole-aperte + superficie-agent.** Farlo per l'Italia,
   partendo dalla SRL, sarebbe architetturalmente unico nell'intero landscape.
4. **Posizionamento verso il commercialista: complemento, non sostituto** (il pattern
   Qonto/Regate lo valida commercialmente; il nostro "non sostituisce il commercialista"
   era già la postura giusta). Il commercialista tiene il ledger; il layer lo spiega al
   titolare.

### Focus SRL vs forfettario

Il forfettario (v1, verificato) resta la base installata e la prova del metodo — non si
butta. Ma il **baricentro strategico si sposta sulla SRL** perché: il gap di mercato è più
grande (zero prodotti per il titolare), il dolore è strutturale (acconti, opacità), la
willingness-to-pay è reale, e la superficie di compliance (IVA/LIPE, IRES/IRAP, bilancio,
F24, INPS socio/amministratore) è abbastanza ricca da giustificare un layer di intelligence
— cosa che per un forfettario puro è quasi banale.

### Onestà tecnica da mettere in conto (vincolo di design, non dettaglio)

La SRL è in **competenza**, non cassa: dalle sole fatture attive/passive non si ricava
l'utile (mancano ammortamenti, ratei/risconti, rimanenze, TFR, costo del personale).
Il layer di intelligence SRL produce quindi **stime dichiarate come tali** — perfettamente
in linea con il DNA cita-o-rifiuta — e migliora man mano che legge più dati (bilancio XBRL
depositato, export del gestionale, cassetto fiscale). Punto di partenza realistico:
posizione IVA (quella sì derivabile dalle fatture), proiezione LIPE, stima acconti dal
dichiarato precedente, e spiegazione citata di ogni voce.

### Minacce da monitorare

- **openaccountants** che aggiunga profondità italiana (mitigazione: la nostra profondità
  verticale citata è difficilmente replicabile in un progetto a 230 giurisdizioni; possibile
  persino contribuire lì come vetrina).
- **Incumbent AI** (TeamSystem/WK) che scenda dal professionista al titolare con un
  prodotto data-grounded (mitigazione: non sono open, non sono ispezionabili, e il loro
  cliente pagante è lo studio — cannibalizzarlo non conviene loro).
- **Fiscozen** che estenda alle SRL (nessun annuncio ad agosto 2026).

---

## Caveat e fonti

Ricerca condotta il 2026-08-06 con verifica via GitHub API (stelle/licenze/ultimo push) e
fonti web secondarie per prezzi e dinamiche di mercato. Non verificati direttamente:
prezzi SRL di Consulens/Soluzione Tasse (quote-only; ancora €200–400/mese da comparatori),
copertura Italia di openaccountants (risolto nell'aggiornamento 2026-08-11 sotto),
evidenza diretta da Reddit (fetch bloccato). Le cifre fiscali 2026 citate qui provengono da
stampa fiscale secondaria: per l'uso nella knowledge base fa fede il processo di verifica su
fonti primarie già in atto (`knowledge/fonti.md`).

---

## Aggiornamento 2026-08-11 — verifica puntuale contro la profondità dell'edizione SRL

Dopo aver scritto la conoscenza SRL dettagliata (IRAP per tutte le 21 regioni, deducibilità
puntuale di auto/telefonia/rappresentanza/vitto, ammortamenti, interessi passivi/ROL,
confronto dividendo-vs-compenso), due ricerche mirate hanno ri-testato la tesi "il titolare
di SRL non ha alcun prodotto" (§4) a questo livello di granularità, e hanno controllato il
delta di 5 giorni sul landscape.

### La tesi tiene, ma va formulata con precisione

**Non è vero che "nessuno ha le citazioni"** — sarebbe falso e facilmente smontabile. Tre
prodotti coprono ciascuno un asse diverso di ciò che fa l'edizione SRL di Mastro, nessuno tutti:

| Prodotto | Ha | Manca |
|---|---|---|
| **Sibill** (simulatore tasse SRL, tutte le 21 regioni IRAP) | Ampiezza, gratuito, senza signup | **Zero citazioni normative** |
| **SoCalSolver** (calcolatore deducibilità auto) | Citazioni reali (art. 164 e 12 fonti), calcolo | Copre **un solo tema su ~9**; progetto di una persona sola, non open, non a tutto tondo SRL |
| **FiscoAI** | Tier gratuito reale, dichiara citazioni | 5 domande/giorno, **posizionamento a pagamento professional-first**, non open, non locale, granularità non verificabile |

**La formulazione difendibile**: *nessuno strumento gratuito dà al titolare di SRL risposte
citate e calcolate su IRES/IRAP/deducibilità/ammortamenti/ROL/dividendo-vs-compenso in un
unico posto.* Non "nessuno ha le citazioni" (falso, vedi sopra).

### openaccountants — la contraddizione della ricerca precedente è risolta, e c'è di più

**15 file Italia esistono** (non zero): it-estimated-tax, it-impatriati, it-income-tax,
it-inps-contributions, it-irap, italy-bookkeeping, italy-crypto-tax, italy-einvoice,
italy-financial-statements, italy-formation, italy-payroll, italy-tax-optimization,
italy-transfer-pricing, italy-vat-return, references.md.

- **`it-regime-forfettario.md` confermato mancante** — `it-income-tax.md` lo cita
  esplicitamente ("Does NOT cover regime forfettario -- see it-regime-forfettario.md") ma
  il file non esiste. Il buco che il repo stesso ammette, confermato una seconda volta.
- **Scoperta nuova, più interessante di un semplice buco**: il loro contenuto SRL cita la
  **Gestione Separata al 26,07%** — l'aliquota del professionista, non quella
  dell'amministratore (**33,72%**, verificata da Mastro contro INPS Circ. 8/2026 in
  `soci.md`). È un **errore fattuale nel loro repo live**, non solo un'assenza — una PR di
  correzione è più semplice di una PR di nuovo contenuto, e più credibile.
- Il resto della copertura SRL è sparso (`italy-formation.md`, `italy-tax-optimization.md`,
  quest'ultimo esplicitamente scoperto per "self-employed") e non arriva alla profondità di
  Mastro su IRAP regionale, telefonia, rappresentanza, ROL/interessi passivi.
- **Nota a margine**: ogni file ha `review_status: pending_review` nel frontmatter, mentre il
  marketing dichiara revisione di commercialisti nominati — divario tra promessa e stato reale
  del repo. Da tenere presente, non necessariamente da usare pubblicamente.

Non cambia la mossa consigliata nel playbook (`awareness-playbook.md`): PR piccola e
verificabile. Ora ce ne sono **due candidate**, non una: la correzione dell'aliquota INPS
(fattuale, immediata) e/o l'autorship di `it-regime-forfettario.md` (più impegnativa, vedi
il caveat CLA/licenza già segnalato nel playbook).

### Delta di 5 giorni (2026-08-06 → 2026-08-11): nessuna minaccia, due segnali minori

- **italia-corpus fermo da 3,5 settimane** (era 3 al check precedente) — il gap si allarga, non si chiude.
- **openaccountants** ha corretto una pipeline di indicizzazione rotta (skill indicizzate
  1.288→1.820, guide verificate 0→256): crescita reale, ma **non tocca la copertura Italia**
  (ancora 15 file, ancora senza forfettario).
- **OCA/l10n-italy**: manutenzione di routine (222→223★, 359→356 issue), nessun segnale strategico.
- **accounted** (Svezia): 81 commit in 5 giorni, tutti Svezia-specifici — nessun segnale di espansione internazionale.
- **Nuovo entrante**: `aruba-fatture-mcp` (server MCP per fatturazione Aruba, 3★, creato
  2026-08-03) — plumbing di fatturazione, non logica fiscale. Da tenere d'occhio, non una minaccia.
- Nessuna novità nel mercato commerciale SRL (Fiscozen, Consulens, TeamSystem, Zucchetti, WK, Qonto/Regate).

**Verdetto**: nessun evento degli ultimi 5 giorni cambia in modo sostanziale la posizione
competitiva di Mastro. Il posizionamento resta valido: intelligence layer + open rules layer,
formulato con la precisione sopra.

---

## Aggiornamento 2026-08-11 (II) — validazione della domanda: ICP di accounted.se e l'equivalente italiano

Due ricerche mirate su "chi comprerebbe davvero questo" — non più struttura di mercato, ma
prove di domanda reale.

### L'ICP di accounted.se è molto più stretto di "titolari di AB svedesi"

Verificato sul loro stesso sito: due segmenti, entrambi tech-adjacent — **startup AI/tech
in fase VC** (team piccoli, stock option, K10/3:12) e **consulenti IT/tech solo o in team
piccoli** incorporati come AB. Il tier gratuito è esplicitamente scoped alla ditta
individuale (enskild firma); **l'AB è il tier a pagamento**, cioè l'upsell. Il messaggio
dominante ("costruito per agenti AI, non per mouse e tastiera") converte proprio perché
l'audience si fida già degli strumenti AI — non è un prodotto SME generico che capita a
essere open-source.

**Prova di domanda per accounted stessa: debole.** "1000+ aziende" è un'affermazione
auto-dichiarata, mai confermata da terzi. Nessun importo di funding reso pubblico (pur con
tre backer nominati: STING, Propel Capital, Almi), nessuna copertura stampa, nessuna
recensione, nessuna testimonianza. L'unico segnale verificabile in modo indipendente sono
209 stelle GitHub — curiosità degli sviluppatori, non prova di clienti paganti.

### Per l'Italia, la prova di domanda è più forte — grazie a un concorrente, non a Mastro

**Sibill** (fintech milanese): **12 M€ di Serie A nel 2025** guidata da Creandum
(investitore di Spotify/Klarna), **18,7 M€ raccolti in totale**, **2.600+ clienti PMI/SRL
paganti**, prodotto di tesoreria/fatturazione/pagamento F24 **con un simulatore fiscale SRL
incluso**. È la prova più solida trovata in questa ricerca — non ipotetica, capitale reale
di investitori sofisticati dopo due diligence, per un prodotto che serve lo stesso
acquirente (titolare di SRL/PMI) con un bisogno di visibilità fiscale/finanziaria
sovrapponibile.

**Correzione al posizionamento competitivo precedente**: Sibill era stata classificata
nell'aggiornamento di oggi (I) come "near-miss" — un semplice calcolatore gratuito senza
citazioni. Sottostimato: è un prodotto finanziario completo e finanziato, di cui il
simulatore fiscale è solo una funzione. La differenziazione resta valida (Sibill vende
tesoreria/banking/pagamenti; Mastro non fa mai il ledger, solo intelligence + citazioni),
ma va nominato come concorrente vero e finanziato nello spazio adiacente, non come
near-miss leggero.

**Dato mancante**: dimensione del TAM per SRL "tech" specificamente (consulenti/agenzie IT
incorporati come SRL) — non trovato un incrocio ISTAT settore×dimensione×forma giuridica.
Il TAM totale SRL Italia è stimato ~2M (estrapolato da dati Unioncamere 2015-2019 + crescita
2025), ma la fetta "tech" non è quantificata: trattare come ipotesi di lavoro, non come cifra
verificata.

### Decisione presa: narrow il messaggio, non il prodotto

Coerente col pattern reale di accounted (un motore generale, landing page per segmento
stretto — `/startups`, `/konsulter`): la conoscenza SRL di Mastro resta generale e serve
qualunque titolare di SRL. Ciò che si restringe è **a chi si parla per primi e come si
inquadra il messaggio** — mastrofisco.it ora nomina esplicitamente "SRL da consulente o da
agenzia tech" nell'hero e mostra un esempio `/confronta` con quel profilo, senza restringere
i canali di distribuzione già costruiti (che, essendo dentro l'ecosistema Claude Code, sono
già naturalmente tech-adjacent).
