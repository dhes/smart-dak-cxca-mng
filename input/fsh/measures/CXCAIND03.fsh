// =============================================================================
// CXCA.IND.03 — Invitation Attendance Rate
// L2 source: A/641 (2020) Annex 2 #4 — "% of invited women who attended"
// =============================================================================

Instance:    CXCAIND03
InstanceOf:  Measure
Title:       "CXCA.IND.03 — Invitation Attendance Rate"
Description: "Proportion of target-age women invited for cervical cancer screening (e.g., via form ЭИМ-5а) who actually attended within the measurement period. A/641 Annex 2 #4."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND03"
* version   = "0.0.1"
* name      = "CXCAIND03"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* library   = "http://smart.who.int/cxca/Library/CXCAIND03Logic"
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
