// =============================================================================
// CXCAMNG.D2.DT.ScreeningEligibility-Programmatic
// =============================================================================
// Mongolia overlay PlanDefinition. Encodes the *programmatic* eligibility
// position announced at the April 2025 Cervical Cancer Elimination Programme
// launch — HPV screening at ages 30 and 40 (rather than the legally-binding
// 35/45 from A/641 §2.2).
//
// Pairs with CXCAD2DTScreeningEligibility (the legal-binding artifact).
// Both reference the same CXCAD2DTScreeningEligibilityLogic Library, but
// each fires on a different define within that library:
//   * Legal artifact     → "Client is due for HPV screening at age 35"
//   * Programmatic artifact (this) → "Client is due for HPV screening at age 30"
//
// This co-existence demonstrates the methodology contribution: a country
// adapter can author a programmatic-overlay PlanDefinition alongside the
// legal one without overwriting or invalidating the binding instrument.
// Consumers filter by the cxca-bindingness extension to choose which
// position to apply at runtime.
//
// METHODOLOGY NOTE — discovered while researching this case:
// As of 2026-05, no successor MOH ministerial order has been issued
// superseding A/641. The 30/40 ages live ONLY in programme materials and
// the 22 April 2025 WHO news release. The April 2026 Khan-Uul pilot
// further drifted to 40-60 due to low participation — three concurrent
// regulatory positions, only one (A/641) actually binding. See project
// memory `project_mongolia_transition_case.md` for the full timeline.
//
// Phase 3 scope decision: encode the programmatic overlay (this artifact),
// document the operational pilot drift in narrative, do not encode the
// 40-60 operational position as a third PlanDefinition. Two encoded
// layers, not three.
// =============================================================================

Instance:    CXCAMNGD2DTScreeningEligibility-Programmatic
InstanceOf:  http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition
Title:       "CXCAMNG.D2.DT — Mongolia Programmatic Screening Eligibility (30/40 ages)"
Description: "Mongolia overlay PlanDefinition encoding the April 2025 Cervical Cancer Elimination Programme launch's announced HPV screening ages (30 and 40). NOT a legally-binding rule — A/641 (2020) §2.2 remains binding with 35/45 ages. Tagged bindingness = programmatic. Pairs with the legal-binding CXCAD2DTScreeningEligibility PlanDefinition; both reference the same CQL Library, each firing on a different rule."
Usage:       #definition

* url       = "http://smart.who.int/cxca/PlanDefinition/CXCAMNGD2DTScreeningEligibility-Programmatic"
* version   = "0.0.1"
* name      = "CXCAMNGD2DTScreeningEligibilityProgrammatic"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

// Regulatory bindingness — programmatic Mongolia announcement, NOT legally binding.
// A/641 (2020) §2.2 with ages 35/45 remains the legally-binding rule.
* extension[+].url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* extension[=].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#programmatic "Programmatic — announced position not yet binding"

// Same CQL library as the legal-binding artifact — different define expression
* library   = "http://smart.who.int/cxca/Library/CXCAD2DTScreeningEligibilityLogic"

// Action: if "Client is due for HPV screening at age 30" is true, propose an HPV ServiceRequest
* action[0].title        = "Recommend HPV high-risk DNA screening for woman at programmatic target age (Mongolia overlay)"
* action[0].description  = "Per the April 2025 Cervical Cancer Elimination Programme launch, Mongolia announced HPV screening at ages 30 and 40. If the client is at the programmatic target age of 30 and meets eligibility, create a proposed ServiceRequest for HPV high-risk DNA testing. Note: this is a programmatic position only; A/641 §2.2 (35/45) remains legally binding."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Client is due for HPV screening at age 30"
* action[0].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2HPVScreeningServiceRequest"
