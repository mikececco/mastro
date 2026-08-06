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
copertura Italia di openaccountants, evidenza diretta da Reddit (fetch bloccato). Le cifre
fiscali 2026 citate qui provengono da stampa fiscale secondaria: per l'uso nella knowledge
base fa fede il processo di verifica su fonti primarie già in atto (`knowledge/fonti.md`).
