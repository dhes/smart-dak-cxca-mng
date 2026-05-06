// =============================================================================
// CXCA.IND.01 — Cervical Cancer Screening Coverage at Age 35 (Measure)
// =============================================================================
// FHIR Measure resource for the eCQM. References the CXCAIND01Logic CQL
// library and declares the proportion-scoring framework.
//
// Pairs with CXCAD2DTScreeningEligibility (PlanDefinition, CDS side) — both
// reference the same underlying clinical fact ("did this client get HPV
// screening?") at different scopes (encounter-level CDS vs. period-level eCQM).
// In future iterations, both will share definitions from a common CXCAElements
// CQL layer to materialize the harmonization pattern from the eCQM/CDS paper.
// =============================================================================

Instance:    CXCAIND01
InstanceOf:  Measure
Title:       "CXCA.IND.01 — Cervical Cancer Screening Coverage at Age 35"
Description: "Proportion of women aged 35 in the measurement period who received HPV high-risk DNA screening during the period. Numerator and denominator computation follows A/641 (2020) Annex 2 coverage metrics framework, adapted to per-age stratification matching the binding target ages of A/641 section 2.2."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Measure/CXCAIND01"
* version   = "0.0.1"
* name      = "CXCAIND01"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

// CQL library this Measure consumes
* library   = "http://smart.who.int/cxca/Library/CXCAIND01Logic"

// Scoring: proportion (% of denominator that meets numerator)
* scoring   = $measure-scoring#proportion

// Measure populations — Initial Population, Denominator, Numerator
// Each references a CQL `define` in the linked Library by name.
* group[0].population[+].code = $measure-population#initial-population
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Initial Population"

* group[0].population[+].code = $measure-population#denominator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Denominator"

* group[0].population[+].code = $measure-population#numerator
* group[0].population[=].criteria.language   = #text/cql-identifier
* group[0].population[=].criteria.expression = "Numerator"
