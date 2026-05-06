// =============================================================================
// CXCA.IND.04 — Cervical Cancer Screening Coverage at Age 45
// L2 source: A/641 (2020) Annex 2 #6 — Coverage %, second binding age variant
// Companion to CXCAIND01 (age 35).
// =============================================================================

Instance:    CXCAIND04
InstanceOf:  Measure
Title:       "CXCA.IND.04 — Cervical Cancer Screening Coverage at Age 45"
Description: "Proportion of women aged 45 in the measurement period who received HPV high-risk DNA screening during the period. Companion to CXCAIND01 (age 35); per A/641 §2.2 the binding HPV ages are 35 and 45 and coverage should be reported separately at each."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND04"
* version   = "0.0.1"
* name      = "CXCAIND04"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* library   = "http://smart.who.int/cxca/Library/CXCAIND04Logic"
* scoring   = $measure-scoring#proportion

* group[0].population[+].code = $measure-population#initial-population
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Initial Population"

* group[0].population[+].code = $measure-population#denominator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Denominator"

* group[0].population[+].code = $measure-population#numerator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Numerator"
