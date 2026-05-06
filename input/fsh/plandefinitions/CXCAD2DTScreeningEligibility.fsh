// =============================================================================
// CXCA.D2.DT.ScreeningEligibility — Cervical Cancer Screening Eligibility (PlanDefinition)
// =============================================================================
// The CDS rule manifest. References the CXCAD2DTScreeningEligibilityLogic
// CQL Library and declares the action to take when the eligibility rule fires.
//
// Profile: cpg-recommendationdefinition (CPG-on-FHIR)
// L2 source: A/641 (2020) §2.2 — Mongolia binding screening eligibility rules.
//
// Phase 5 expansion — full four-outcome action tree. Each outcome corresponds
// to a CXCA.D code (DE4 Due, DE5 Not Due in Cycle, DE6 Outside Age Range,
// DE7 Hysterectomy Excluded). Only the Due case invokes the ServiceRequest
// ActivityDefinition; the other three are guidance-only actions.
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

// Action 0 (DE4): client is due for HPV screening — propose ServiceRequest
* action[0].title        = "Recommend HPV high-risk DNA screening (client is due)"
* action[0].description  = "Client is at the binding target age (35 or 45 per A/641 §2.2), has not had a hysterectomy, and has not been screened in the current cycle. Create a proposed ServiceRequest for HPV high-risk DNA testing."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Client is due for HPV screening (legal binding)"
* action[0].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2HPVScreeningServiceRequest"

// Action 1 (DE5): client already screened in current cycle — guidance only, no order
* action[1].title        = "Defer screening — client already screened in current cycle"
* action[1].description  = "Client is at a binding target age but has had a recent valid HPV screening result. Per A/641 §2.2 they are not due for re-screening at this encounter. Inform the client of their next due date."
* action[1].condition[0].kind                 = #applicability
* action[1].condition[0].expression.language  = #text/cql-identifier
* action[1].condition[0].expression.expression = "Client not due — already screened in current cycle (legal binding)"

// Action 2 (DE6): client is outside the binding target age range — guidance only
* action[2].title        = "Defer screening — client outside binding target age range"
* action[2].description  = "Client is not at a binding target age (35 or 45 per A/641 §2.2 for HPV-test-capable facilities). Note: cytology-only facilities follow a different age cycle (30, 33, 36, ..., 60 every 3 years per A/641 §2.2 cytology pathway) — see the separate cytology-pathway PlanDefinition (deferred to a future Phase 5 chunk)."
* action[2].condition[0].kind                 = #applicability
* action[2].condition[0].expression.language  = #text/cql-identifier
* action[2].condition[0].expression.expression = "Client excluded — outside target age range (legal binding)"

// Action 3 (DE7): client excluded due to prior hysterectomy — guidance only
* action[3].title        = "Exclude from screening — prior hysterectomy"
* action[3].description  = "Client has had a hysterectomy. Per A/641 §2.2, women who have had a hysterectomy for non-cervical-cancer indication and who have a documented negative post-operative vaginal-smear cytology are exempt from cervical cancer screening. Verify the indication and the post-operative cytology status before fully excluding."
* action[3].condition[0].kind                 = #applicability
* action[3].condition[0].expression.language  = #text/cql-identifier
* action[3].condition[0].expression.expression = "Client excluded — prior hysterectomy (legal binding)"
