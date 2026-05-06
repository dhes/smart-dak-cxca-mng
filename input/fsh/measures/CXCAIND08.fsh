// =============================================================================
// CXCA.IND.08 — New Cervical Cancer Cases by Age (continuous-variable scoring)
// L2 source: A/641 (2020) Annex 2 #13
// =============================================================================
// Differs from the proportion measures (IND01, IND03, IND04, IND06, IND07) —
// this is a continuous-variable measure that counts new cancer cases rather
// than computing a proportion. Useful for incidence-trend monitoring against
// WHO Mongolia's projected 22.4% rise by 2030 without intervention.
// =============================================================================

Instance:    CXCAIND08
InstanceOf:  Measure
Title:       "CXCA.IND.08 — New Cervical Cancer Cases by Age"
Description: "Count of new cervical cancer diagnoses (ICD-10 C53.0–C53.9 invasive, or D06 carcinoma in situ) in the measurement period, stratified by age band when concrete queries are wired. A/641 Annex 2 #13. Continuous-variable scoring — used for incidence-trend monitoring against WHO Mongolia's projected disease-burden trajectory."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND08"
* version   = "0.0.1"
* name      = "CXCAIND08"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* library   = "http://smart.who.int/cxca/Library/CXCAIND08Logic"
* scoring   = $measure-scoring#continuous-variable

* group[0].population[+].code = $measure-population#initial-population
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Initial Population"

* group[0].population[+].code = $measure-population#measure-population
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Measure Population"

* group[0].population[+].code = $measure-population#measure-observation
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Cancer Case Count"
