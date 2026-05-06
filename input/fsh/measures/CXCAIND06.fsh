// =============================================================================
// CXCA.IND.06 — HPV-Positive Result Rate
// L2 source: A/641 (2020) Annex 2 #11 — Positive result %
// =============================================================================

Instance:    CXCAIND06
InstanceOf:  Measure
Title:       "CXCA.IND.06 — HPV-Positive Result Rate"
Description: "Proportion of target-age women screened in the measurement period whose HPV high-risk DNA result was positive. A/641 Annex 2 #11. Used for programme capacity planning — drives demand for follow-up cytology re-read and colposcopy."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND06"
* version   = "0.0.1"
* name      = "CXCAIND06"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* library   = "http://smart.who.int/cxca/Library/CXCAIND06Logic"
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
