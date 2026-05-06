// =============================================================================
// CXCA.D2.DT.ScreeningEligibility-Cytology — Cytology-pathway PlanDefinition
// =============================================================================
// Sibling to CXCAD2DTScreeningEligibility (the HPV-pathway PlanDefinition).
// Both are tagged bindingness = legal because both encode A/641 section 2.2's
// binding rules; they differ only in which sub-rule applies based on the
// facility's lab capability.
//
// FACILITY LAB-CAPACITY AS SELECTOR:
// A/641 section 2.2 specifies different age cycles based on whether the facility
// can run HPV high-risk DNA tests:
//   * HPV-test-capable facilities → ages 35 and 45 only (HPV pathway,
//     CXCAD2DTScreeningEligibility)
//   * Cytology-only facilities → 11 ages on 3-year cycle: 30, 33, 36, 39, 42,
//     45, 48, 51, 54, 57, 60 (cytology pathway, this artifact)
//
// This is the "lab_capacity as selector" axis from our methodology memory
// (`project_mongolia_transition_case.md`) — an axis the WHO Table 1 does
// not represent, but Mongolia's binding rule requires.
//
// Both pathways reference the same Library; each fires on its own define.
// =============================================================================

Instance:    CXCAD2DTScreeningEligibility-Cytology
InstanceOf:  http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition
Title:       "CXCA.D2.DT — Screening Eligibility (Cytology Pathway)"
Description: "Decision support recommendation for the cytology-pathway branch of cervical cancer screening eligibility (CXCA.D2). Applies to facilities that lack HPV DNA testing capability. Per A/641 (2020) section 2.2, women in this branch are screened with cervical cytology at ages 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, and 60 (every 3 years). Sibling artifact CXCAD2DTScreeningEligibility covers the HPV-pathway branch (ages 35 and 45). Both reference the same CXCAD2DTScreeningEligibilityLogic library."
Usage:       #definition

* url       = "http://smart.who.int/cxca/PlanDefinition/CXCAD2DTScreeningEligibility-Cytology"
* version   = "0.0.1"
* name      = "CXCAD2DTScreeningEligibilityCytology"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

// Regulatory bindingness — also legal-binding (A/641 section 2.2 cytology pathway)
* extension[+].url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* extension[=].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#legal "Legal — binding regulatory instrument"

// Same CQL library as the HPV pathway — different define
* library   = "http://smart.who.int/cxca/Library/CXCAD2DTScreeningEligibilityLogic"

// Action: client is due for cytology screening — propose ServiceRequest
* action[0].title        = "Recommend cervical cytology screening (cytology-pathway client is due)"
* action[0].description  = "Client is at one of the 11 binding cytology-pathway target ages (per A/641 section 2.2: 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60), the facility lacks HPV DNA testing capability, the client has not had a hysterectomy, and has not been screened in the current 3-year cycle. Create a proposed ServiceRequest for cervical cytology testing."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Client is due for cytology screening (legal binding)"
* action[0].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2CytologyScreeningServiceRequest"
