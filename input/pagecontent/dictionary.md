The data dictionary for this DAK defines the clinical concepts referenced across the screening pathway, recall logic, and pre-cancer management decisions. It is published as a FHIR `CodeSystem` rather than the more familiar xlsx artifact — this DAK defers xlsx generation to a future iteration.

The active artifacts are:

- **CodeSystem [`CXCA.D`](CodeSystem-CXCA.D.html)** — currently 45 codes (DE1–DE45) covering target ages, screening tests, eligibility outcomes, Bethesda 2014 cytology categories, HPV result values, recall reasons, and procedure codes.
- **CodeSystem [`CXCA.Bindingness`](CodeSystem-CXCA.Bindingness.html)** — the cxca-specific bindingness vocabulary (`legal` | `programmatic` | `operational`) that drives the `cxca-bindingness` Extension distinguishing legally-binding artifacts from programmatic and operational overlays.

For the full artifact inventory see the [Artifact Index](artifacts.html). For background on the methodology contributions that motivated these vocabularies — particularly the bindingness CodeSystem — see [Adapting Guidelines for Country Use](adapting.html).
