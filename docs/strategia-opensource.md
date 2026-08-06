# Strategia open-source per l'Italia — Mastro × accounted.se

> **Cos'è questo documento.** Una valutazione strategica (landscape), non un piano di build.
> Mappa il modello di [accounted.se](https://accounted.se) (accounting open-source AI-native per
> la Svezia) sul mercato italiano, colloca onestamente Mastro rispetto ad esso, e delinea i livelli
> di ambizione con una sequenza consigliata — senza impegnarsi a costruire nulla. La direzione si
> decide dopo. Prosa in inglese (come ne abbiamo discusso), termini fiscali italiani lasciati
> verbatim (forfettario, SdI, FatturaPA, LIPE, F24). I documenti rivolti all'utente restano in
> italiano; questo è un documento interno di strategia.
>
> Framing scelto: **open-source ora, con la porta aperta a un tier hosted/business in futuro** — per
> questo la questione della licenza (MIT → AGPL) resta viva ma non si tocca oggi.
>
> **Aggiornamento 2026-08-06 — direzione scelta.** Dopo la ricerca competitiva
> ([`landscape-2026-08.md`](./landscape-2026-08.md)) la posizione è: **intelligence layer +
> open rules layer** ("il cervello fiscale aperto, non il ledger" — posizioni 2+3 del §4-bis
> sotto), con **baricentro sulla SRL** invece che sul forfettario. Motivo in breve: il titolare
> di SRL non ha alcun prodotto (i challenger si fermano alla P.IVA individuale), il rules layer
> italiano è uno slot vuoto certificato (OpenFisca-Italy morto dal 2018), e nessuno al mondo ha
> unito regole-fiscali-aperte + superficie-agent. Il forfettario resta la v1 e la prova del
> metodo. Il Tier 2 "accounted per l'Italia" (essere il ledger) è **scartato**: mercato
> presidiato, regolamentato, e senza vantaggio strutturale per noi.

---

## 1. The reference model — accounted.se

Full-fat, AI-native, open-source accounting **engine** for Sweden.

- **License:** AGPL-3.0-or-later (with an extension exception for third-party plugins).
- **Stack:** Next.js 16 / React 19 / TypeScript / Tailwind / shadcn on Supabase (Postgres + RLS).
- **Scope:** double-entry bookkeeping, invoicing, PSD2 bank feeds + 4-pass auto-reconciliation,
  VAT declarations (SKV 4700), payroll/AGI, tax reports (NE-bilaga, INK2, SRU), SIE4 import/export,
  7-year archive, **direct filing to Skatteverket**, BankID.
- **AI-native core:** the whole bookkeeping engine is exposed as **100+ MCP tools** with scoped API
  keys, so an agent categorizes transactions, drafts vouchers, reconciles periods, and prepares
  declarations.
- **Thesis:** *"Most accounting software treats your books as a regulatory chore. We treat the
  ledger as the richest structured dataset your business produces"* — built so agents run **on top
  of** the ledger, not around it.
- **Business model:** freemium — Open (free self-host), Auto (199 SEK/mo hosted automation +
  direct filing), white-label/SaaS. Company = Arcim Technology AB, registered with Finansinspektionen.
- **Content strategy:** "pillar + deep dives," developer-first English blog + Swedish founder blog.
- **Repo:** [github.com/erp-mafia/accounted](https://github.com/erp-mafia/accounted).

## 2. Where Mastro is today

Lean, honest, local. A Claude Code **plugin**, not an app.

- **License:** MIT. **Form:** slash commands + versioned cited Markdown knowledge + a deterministic
  POSIX-shell calculator. No app, no server, no data leaves the machine.
- **Built (v0.2 beta):** forfettario edition verified against official 2026 sources — `/chiedi`,
  `/tasse`, `/scadenze`, `/idoneo`; deterministic `calc.sh` + `freshness.sh` with CI; `fonti.md`
  source map to italia-corpus; SRL edition scaffolded (skeleton knowledge, honest cite-or-refuse).
- **Posture:** read-only, advisory, "non sostituisce il commercialista," cita-o-rifiuta,
  cash-basis aware (principio di cassa).
- **Already-scoped next step (`TODOS.md` v1.5):** a **FatturaPA reader** — point Mastro at your
  e-invoice XML folder, get your live fiscal position.

**The gap:** accounted *holds and writes* your books to the tax authority; Mastro *reads and
advises*. Different form factor, not just different size.

## 3. Sweden → Italy mapping (the building blocks)

| accounted (Sweden) | Italian equivalent | Notes for us |
|---|---|---|
| SIE4 exchange format | **FatturaPA XML** | Public schema. But Italy goes further — see below. |
| Reconstruct data from bank feeds | **SdI mandatory e-invoicing** | Every partita IVA (forfettari incl., since Jan 2024) is *forced by law* to emit structured XML. The dataset is handed to you. |
| BAS 2026 chart of accounts | **Piano dei conti** (OIC / CNDCEC) | No single state chart; standards exist. |
| VAT declaration SKV 4700 | **LIPE + dichiarazione IVA** (SRL); forfettari exempt from IVA | |
| File to Skatteverket | **SdI transmission + F24 payments; Fisconline/Entratel** | Transmitting *via SdI* needs intermediary accreditation or a provider partner — this is the regulated step. |
| BankID | **SPID / CIE** | Identity layer. |
| PSD2 bank feeds | PSD2 (same EU framework) | Portable. |

**Key asymmetry in our favour:** the "richest structured dataset" accounted must *reconstruct*,
Italy *mandates into existence*. FatturaPA-over-SdI is a stronger wedge than Sweden has.

## 4. The three tiers of ambition

- **Tier 0 — deepen the copilot.** Ship forfettario v1 (real-install dogfood), flesh out SRL +
  `calc-srl.sh`, add the automated command-eval harness. Stays a plugin. Low risk; closes the loop
  already in progress.
- **Tier 1 — FatturaPA reader (the wedge, already scoped as v1.5).** Read-only: point at the XML
  folder → live YTD ricavi (cash-basis, emesso-vs-incassato reconciled), year-end projection,
  **85k/100k tetto alarm**, `/tasse` on *real* numbers. Still local, still read-only, still "non
  sostituisce il commercialista." The Italian "ledger as dataset," from data the State already
  forces you to have.
- **Tier 2 — "accounted for Italy" (the full engine).** Open AI-native bookkeeping app: piano dei
  conti, registri IVA, LIPE, **FatturaPA generation + transmission via SdI**, F24, MCP tools so
  agents do the books. A different project — a real web app (accounted-style Next.js/Supabase), SdI
  intermediary accreditation or partner, a business model. This is a company, not a plugin feature.

**Assessment recommendation (not a commitment):** Tier 1 is the sweet spot — differentiated,
already scoped, and it does *not* force regulated/hosted territory. Tier 2 is legitimate but is a
strategic bet to make deliberately. Natural sequence: finish Tier 0 loose ends → build Tier 1 →
re-evaluate Tier 2 once Tier 1 shows pull.

## 4-bis. The three positions (decided 2026-08-06)

Sharper than the tiers: three *market positions* were on the table.

| Position | What it means | Verdict |
|---|---|---|
| **1. Ledger of record** | Italian accounted — own the books, transmit via SdI | Crowded (every P.IVA already has an SdI provider), regulated, no structural edge. **Avoid.** |
| **2. Intelligence layer** | Read the company's mandated data → live fiscal position, projections, acconto alarms, every number explained with the law attached | **The wedge.** Complement to providers and to the commercialista, not competitor. |
| **3. Open fiscal rules layer** | The verified, cited, versioned Italian tax rulebook as a public good any tool can consume (the natural counterpart to italia-corpus) | **The moat.** Compounds with every Legge di Bilancio; nobody owns this — OpenFisca-Italy has been dead since 2018. |

**Chosen: 2+3 together — "the open fiscal brain, not the ledger" — with the SRL as the
beachhead** (the owner of a small SRL has no product today; see
[`landscape-2026-08.md`](./landscape-2026-08.md) §3-4 for the evidence). accounted's moat is
switching cost; that moat is unavailable in Italy, so we build the other kind: a rules layer
that gets *stronger* when others depend on it. The agent-native expression mirrors accounted's
MCP play but one level up: expose the **fiscal reasoning** as MCP tools, not the ledger
operations. Design constraint to carry into any SRL build: the SRL is accrual-based
(*competenza*), so invoice data alone yields **declared estimates**, not exact positions —
cite-or-refuse honesty applies to numbers too.

## 5. The read → write line (the one decision that changes everything)

Everything up to and including Tier 1 is **read-only and local**: safe, unregulated, no data
leaves the machine, "aiuto non commercialista" holds cleanly. The moment we **generate and
transmit FatturaPA via SdI or push F24** (Tier 2), Mastro crosses into *intermediario fiscale*
territory: accreditation (or partnering with an existing SdI provider), liability, and hosting.
Cross this line only on purpose.

## 6. Strategic decisions to bank now (so later isn't blocked)

- **License.** MIT is fine for a plugin/community tool. But a possible hosted tier is on the table —
  accounted's AGPL-3.0 is exactly the play that keeps the engine open *and* prevents a competitor
  from running your code as a closed SaaS. **Recommendation: keep MIT for the current plugin;
  if/when a hostable engine (Tier 2) starts, license *that* codebase AGPL-3.0** (dual-licensing the
  advisory knowledge stays easy). Note it now; don't relicense today.
- **Business model.** accounted = open self-host + hosted automation + white-label. The Italian
  analog: free plugin/self-host, and later a hosted "watches your SdI feed + files for you" tier.
  Keep the door open; nothing to build now.
- **Form factor.** Tiers 0–1 stay a Claude Code plugin. Tier 2 needs a real app. Don't contort the
  plugin into an app prematurely.
- **Moat / positioning.** Mastro's honesty (cita-o-rifiuta, never-affirm, sources mapped to
  italia-corpus) is a genuine differentiator vs. black-box AI-fisco tools. Whatever tier, that
  posture is the brand — carry it forward.
- **Partnerships.** [italia-corpus](https://github.com/ahmeabd/italia-corpus) (already credited)
  for law text; an existing SdI provider is the realistic path to Tier 2 transmission without
  becoming an accredited intermediary from scratch.

## 7. Open questions to resolve before any build (not now)

- FatturaPA cash-basis reconciliation: the XML carries *emission* date, not *payment* date — how do
  we reconcile emesso-vs-incassato? (bank-feed match? manual mark-paid? both?)
- Which regime(s) does the reader serve first — forfettario only, or SRL registri too?
- Tier 2 only: build SdI transmission in-house (accreditation) vs. partner with a provider.

---

*Documento di strategia — non è un piano di implementazione. Ogni tier diventa un piano a sé quando
si sceglie la direzione. Vedi [`TODOS.md`](../TODOS.md) per lo stato attuale del build.*
