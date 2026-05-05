// =============================================================================
// CXCAD2HPVScreeningServiceRequest — Order Template (ActivityDefinition)
// =============================================================================
// When the CXCAD2DTScreeningEligibility PlanDefinition fires its
// "Recommend HPV screening" action, this ActivityDefinition is instantiated
// into a real ServiceRequest on the patient's chart with intent = #proposal.
// The clinician then reviews and (if appropriate) approves the proposal,
// which moves it to #active.
//
// kind = #ServiceRequest because cervical cancer screening is a diagnostic
// service order, not a medication. (The IMMZ pattern uses kind = #MedicationRequest
// because vaccines are medications. Different downstream resource type.)
//
// Profile: plain ActivityDefinition for now. Future iteration: subclass a
// CPG service-request activity profile if one becomes available.
// =============================================================================

Instance:    CXCAD2HPVScreeningServiceRequest
InstanceOf:  ActivityDefinition
Title:       "CXCAD2 — HPV Screening Service Request"
Description: "Activity template that becomes a ServiceRequest for HPV high-risk DNA testing when the CXCAD2DTScreeningEligibility rule recommends screening. Intent is #proposal — the clinician reviews and approves before the request becomes active."
Usage:       #definition

* url       = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2HPVScreeningServiceRequest"
* version   = "0.0.1"
* name      = "CXCAD2HPVScreeningServiceRequest"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* kind         = #ServiceRequest
* intent       = #proposal
* doNotPerform = false

// The service requested — coded against CXCA.D
* code.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* code.coding[0].code    = #DE3
* code.coding[0].display = "HPV high-risk DNA test"
