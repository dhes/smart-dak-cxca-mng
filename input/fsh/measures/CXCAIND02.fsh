// =============================================================================
// CXCA.IND.02 — Cervical Cancer Screening Cascade Completion (NotDone-aware)
// =============================================================================
// THE METHODOLOGY-CONTRIBUTION MEASURE.
//
// Where IND01 measures "% of target-age women screened" — a coverage measure
// at the front of the cascade — IND02 measures "% of HPV+ women whose
// cascade reached resolution" using the Phase 4 NotDone profile to
// distinguish three kinds of post-HPV+ outcome:
//   1. Cytology completed (success)
//   2. Cytology documented as not occurring (CXCAServiceNotRequested with reason)
//   3. Absent record (no follow-up evidence either way)
//
// Numerator includes (1) + (2). Numerator Exclusion isolates (2). Patients
// in state (3) are correctly excluded — the measure does not pretend to know
// what happened to them.
//
// SEE: input/cql/CXCAIND02CascadeCompletionLogic.cql for the methodology
// rationale and concrete numbers from the April 2026 Khan-Uul pilot.
// =============================================================================

Instance:    CXCAIND02
InstanceOf:  Measure
Title:       "CXCA.IND.02 — Cervical Cancer Screening Cascade Completion (NotDone-aware)"
Description: "Proportion of HPV-positive women in the measurement period whose follow-up cascade reached resolution — either through completed cytology or through explicit documented non-occurrence using the CXCAServiceNotRequested profile. Patients with neither (absent records) are excluded from the numerator, surfacing visibility gaps rather than conflating them with documented LTFU. See input/cql/CXCAIND02CascadeCompletionLogic.cql for the methodology rationale and the Mongolia April 2026 Khan-Uul pilot numbers that motivate this measure (371 HPV+ women, 184 cytology, 187 LTFU)."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND02"
* version   = "0.0.1"
* name      = "CXCAIND02"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

// CQL library backing this Measure
* library   = "http://smart.who.int/cxca/Library/CXCAIND02CascadeCompletionLogic"

// Scoring: proportion (% of denominator that meets numerator criteria)
* scoring   = $measure-scoring#proportion

// Measure populations — Initial Population, Denominator, Numerator, NumeratorExclusion
* group[0].population[+].code = $measure-population#initial-population
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Initial Population"

* group[0].population[+].code = $measure-population#denominator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Denominator"

* group[0].population[+].code = $measure-population#numerator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Numerator"

* group[0].population[+].code = $measure-population#numerator-exclusion
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Numerator Exclusion"
