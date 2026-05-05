// =============================================================================
// CXCA.D2.DT.ScreeningEligibility — Cervical Cancer Screening Eligibility (PlanDefinition)
// =============================================================================
// The CDS rule manifest. References the CXCAD2DTScreeningEligibilityLogic
// CQL Library and declares the action to take when the eligibility rule fires.
//
// Profile: cpg-recommendationdefinition (CPG-on-FHIR)
// L2 source: A/641 (2020) §2.2 — Mongolia binding screening eligibility rules.
//
// Phase 2 vertical slice — one action only. Future iterations will add
// actions for: communication-request guidance text to clinician; alternative
// pathways for cytology-only facilities; recall scheduling.
// =============================================================================

Instance:    CXCAD2DTScreeningEligibility
InstanceOf:  http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition
Title:       "CXCA.D2.DT — Cervical Cancer Screening Eligibility"
Description: "Decision support recommendation for cervical cancer screening eligibility (CXCA.D2). Evaluates the rules from Mongolia MOH Order A/641 (2020) §2.2 via the CXCAD2DTScreeningEligibilityLogic CQL library; when the client is due, recommends instantiating the CXCAD2HPVScreeningServiceRequest ActivityDefinition."
Usage:       #definition

* url       = "http://smart.who.int/cxca/PlanDefinition/CXCAD2DTScreeningEligibility"
* version   = "0.0.1"
* name      = "CXCAD2DTScreeningEligibility"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

// Regulatory bindingness — this PlanDefinition encodes the binding rules from
// Mongolia MOH Order A/641 (2020) §2.2, which align with the WHO 2030 elimination
// strategy's 35/45 target ages. Both interpretations are legally binding in their
// respective domains, so this artifact carries `bindingness = legal`.
* extension[+].url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* extension[=].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#legal "Legal — binding regulatory instrument"

// Reference to the CQL library that evaluates the eligibility rules
* library   = "http://smart.who.int/cxca/Library/CXCAD2DTScreeningEligibilityLogic"

// Action: if "Client is due for HPV screening at age 35" is true, propose an HPV ServiceRequest
* action[0].title        = "Recommend HPV high-risk DNA screening for woman at target age"
* action[0].description  = "If the client is at the binding target age of 35 (per A/641 §2.2) and meets eligibility, create a proposed ServiceRequest for HPV high-risk DNA testing."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Client is due for HPV screening at age 35"
* action[0].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2HPVScreeningServiceRequest"
