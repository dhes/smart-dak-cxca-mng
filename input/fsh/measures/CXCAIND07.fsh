// =============================================================================
// CXCA.IND.07 — Treatment Completion Rate
// L2 source: A/641 (2020) Annex 2 #12 — % treated
// =============================================================================

Instance:    CXCAIND07
InstanceOf:  Measure
Title:       "CXCA.IND.07 — Treatment Completion Rate"
Description: "Proportion of women with positive cervical cancer screening results in the measurement period who received treatment per the algorithm in A/641. A/641 Annex 2 #12. Companion to CXCAIND02 (cascade completion) — IND02 counts both treatment AND documented LTFU as resolution; IND07 counts only treatment."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND07"
* version   = "0.0.1"
* name      = "CXCAIND07"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* library   = "http://smart.who.int/cxca/Library/CXCAIND07Logic"
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
