// =============================================================================
// CXCAD2CytologyScreeningServiceRequest — Order Template (ActivityDefinition)
// =============================================================================
// Companion to CXCAD2HPVScreeningServiceRequest. When the cytology-pathway
// PlanDefinition (CXCAD2DTScreeningEligibility-Cytology) fires its "Recommend
// cytology screening" action, this ActivityDefinition is instantiated into a
// real ServiceRequest with intent = #proposal and code = CXCA.D#DE13.
//
// The HPV and cytology variants are kept as separate ActivityDefinitions
// (rather than one parameterized template) so a CDS engine's audit trail
// shows clearly which pathway recommended what.
// =============================================================================

Instance:    CXCAD2CytologyScreeningServiceRequest
InstanceOf:  ActivityDefinition
Title:       "CXCAD2 — Cytology Screening Service Request"
Description: "Activity template that becomes a ServiceRequest for cervical cytology testing when the CXCAD2DTScreeningEligibility-Cytology rule recommends screening (cytology-pathway clients per A/641 section 2.2). Intent is #proposal — the clinician reviews and approves before the request becomes active."
Usage:       #definition

* url       = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2CytologyScreeningServiceRequest"
* version   = "0.0.1"
* name      = "CXCAD2CytologyScreeningServiceRequest"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* kind         = #ServiceRequest
* intent       = #proposal
* doNotPerform = false

// The service requested — coded against CXCA.D
* code.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* code.coding[0].code    = #DE13
* code.coding[0].display = "Cervical cytology test"
