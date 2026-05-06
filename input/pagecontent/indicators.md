The indicators encode A/641 (2020) Annex 2 metrics as machine-readable FHIR Measure resources, plus methodology-contribution indicators that surface programme realities the standard Annex 2 metrics do not (notably loss-to-follow-up cascade completion). The xlsx form is deferred to a future iteration.

The active indicator artifacts (7 Measures):

| Indicator | A/641 source | Type | Artifact |
|---|---|---|---|
| **CXCA.IND.01** — Coverage at age 35 | Annex 2 #6 | proportion | [Measure-CXCAIND01](Measure-CXCAIND01.html) |
| **CXCA.IND.02** — Cascade completion (NotDone-aware) | methodology contribution | proportion with NumeratorExclusion | [Measure-CXCAIND02](Measure-CXCAIND02.html) |
| **CXCA.IND.03** — Invitation attendance rate | Annex 2 #4 | proportion | [Measure-CXCAIND03](Measure-CXCAIND03.html) |
| **CXCA.IND.04** — Coverage at age 45 | Annex 2 #6 (second age) | proportion | [Measure-CXCAIND04](Measure-CXCAIND04.html) |
| **CXCA.IND.06** — HPV-positive result rate | Annex 2 #11 | proportion | [Measure-CXCAIND06](Measure-CXCAIND06.html) |
| **CXCA.IND.07** — Treatment completion rate | Annex 2 #12 | proportion | [Measure-CXCAIND07](Measure-CXCAIND07.html) |
| **CXCA.IND.08** — New cervical cancer cases by age | Annex 2 #13 | continuous-variable | [Measure-CXCAIND08](Measure-CXCAIND08.html) |

CXCA.IND.02 is the methodology-contribution measure — see [Adapting Guidelines for Country Use](adapting.html) for the cascade-completion rationale, which uses the Phase 4 NotDone profile to distinguish documented loss-to-follow-up from absent records. The remaining Annex 2 indicators (#5 cytology cycle coverage, #9 first-time-screening level, #10/11 raw counts, #14 cancer-suspected care completion) follow the same trio pattern (CQL + Library + Measure) and are deferred to later iterations.

For machine-readable presentation see [Indicators and Measures](indicators-measures.html).
