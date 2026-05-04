# SMART DAK — Cervical Cancer Screening

**Status:** Pre-release (v0.0.1) — Phase 1 scaffolding only. No content artifacts authored yet.

A Digital Adaptation Kit for **cervical cancer screening**, authored as a community contribution following [WHO SMART Guidelines](https://www.who.int/teams/digital-health-and-innovation/smart-guidelines) conventions. The DAK uses the [Mongolia Ministry of Health Order A/641 (2020)](https://moh.gov.mn) as a country-adapter case study to demonstrate a bindingness model for legal vs. programmatic vs. operational regulatory positions.

This is **not a WHO publication.** It is structured to be SMART-conformant at the publication boundary (FHIR profiles, CQL libraries, FSH, CPG/CRMI/SDC/CQF Measures) so that downstream tooling and reviewers can consume it on familiar terms. Authoring conventions, methodology choices, and country-adapter patterns are explicitly the contributor's, not WHO's.

## Scope

**In scope** (per A/641 chapters 2 + 5 + selective 3):

- Prevention & screening pathway: HPV-DNA primary screening, cytology screening, eligibility, recall logic, results routing
- Pre-cancer management algorithmic decisions: CIN1/2/3 routing, colposcopy, biopsy, LEEP / cone surgical decision logic
- Structured counseling questionnaires: pre-screening, result disclosure, follow-up
- Indicators: A/641 Annex 2 metrics plus cascade-completion measures

**Out of scope** (referenced as handoffs, not encoded):

- HPV vaccination → handoff to [WHO SMART Immunizations DAK](https://github.com/WorldHealthOrganization/smart-immunizations) / `smart-dak-immz`
- Invasive cervical cancer treatment (staging, surgery, radiotherapy, chemotherapy) → potential future `smart-dak-cxca-treatment`
- Palliative care → potential future palliative-care DAK
- Narrative-only content from A/641 chapter 1 (epidemiology, anatomy, pathogenesis) lives in `pagecontent/`, not as L3 artifacts

## Attribution

This Implementation Guide is derived from **`WorldHealthOrganization/smart-dak-empty`** (CC BY-IGO 3.0). Original WHO empty DAK template is preserved structurally; cervical-cancer-specific content is added on top.

Selected profiles from **`WorldHealthOrganization/smart-core`** (CC0-1.0) — covering shared clinical data elements such as HIV status, pregnancy status, sexual history, and contraception — will be vendored into `input/profiles/` when the anamnesis logical model is authored in Phase 5, with attribution preserved. `who.fhir.core` is not a registered FHIR package as of 2026-05, so direct SUSHI dependency is not yet possible.

## License

CC BY-IGO 3.0 (inherited from smart-dak-empty). See [LICENSE.md](LICENSE.md). Vendored CC0-1.0 content from `who.fhir.core` is compatible — derivative is CC BY-IGO 3.0.

## Methodology

This DAK accompanies a methodology project at [`dak-authoring-methodology`](../dak-authoring-methodology) that develops:

- A **bindingness model** distinguishing legal, programmatic, and operational regulatory positions in country adapters
- A **transition model** for dated supersession chains in evolving guidelines
- An **outreach-worker first-encounter pattern** addressing populations with no prior digital health record
- A **cascade-completion eCQM pattern** for measuring loss-to-follow-up explicitly via FHIR `*-NotDone` profiles, motivated by the empirically observed 50% LTFU rate in the April 2026 Khan-Uul HPV pilot

## Feedback

Feedback and issues will be welcomed via the [issues](../../issues) page once the repo is published.
