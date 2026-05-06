// =============================================================================
// CXCAD2ColposcopyServiceRequest — Order Template (ActivityDefinition)
// =============================================================================
// Companion to CXCAD2HPVScreeningServiceRequest and CXCAD2CytologyScreeningServiceRequest.
// Instantiated when the HPV result routing PlanDefinition recommends colposcopy
// (i.e., HPV+ with cytology ≥ ASC-US, per A/641 Fig 2.4).
// =============================================================================

Instance:    CXCAD2ColposcopyServiceRequest
InstanceOf:  ActivityDefinition
Title:       "CXCAD2 — Colposcopy Service Request"
Description: "Activity template that becomes a ServiceRequest for colposcopy when the HPV result routing rule indicates referral. Intent is #proposal — the clinician reviews and approves before the request becomes active. Per A/641 Op.Inst. 5.6 the colposcopy is performed by an obstetrician-gynaecologist at aimag/district level."
Usage:       #definition

* url       = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2ColposcopyServiceRequest"
* version   = "0.0.1"
* name      = "CXCAD2ColposcopyServiceRequest"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* kind         = #ServiceRequest
* intent       = #proposal
* doNotPerform = false

* code.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* code.coding[0].code    = #DE37
* code.coding[0].display = "Colposcopy"
