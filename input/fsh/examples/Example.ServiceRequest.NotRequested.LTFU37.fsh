// =============================================================================
// Example: Cytology ServiceRequest documenting LTFU non-occurrence
// =============================================================================
// THE CASCADE-COMPLETION FIXTURE.
//
// This ServiceRequest uses the CXCAServiceNotRequested profile to explicitly
// record that a follow-up cytology was expected — triggered by the patient's
// March 2026 HPV+ result — but did not occur because the patient was lost
// to follow-up.
//
// This is one of the 187 cases from the April 2026 Khan-Uul pilot, modeled
// concretely. The whole point of the NotDone pattern is that this resource
// EXISTS at all. In a vanilla FHIR system without the pattern, this patient
// would simply have no cytology record after their HPV+ result, and the gap
// would be invisible to queries. With this resource, the cascade-completion
// eCQM (Phase 5) can count this patient as a documented LTFU, distinct from
// either a successful follow-up or an unknown outcome.
// =============================================================================

Instance:    example-servicerequest-notrequested-ltfu37
InstanceOf:  CXCAServiceNotRequested
Title:       "Example: Cytology not requested (LTFU after HPV+)"
Description: "Synthetic ServiceRequest documenting that the follow-up cytology expected after the March 2026 HPV+ result was not performed because the patient was lost to follow-up. Uses the CXCAServiceNotRequested profile (status fixed to revoked, reasonCode required). Models one case from the April 2026 Khan-Uul pilot's 187-patient LTFU cohort."
Usage:       #example

// status fixed by profile to #revoked — service was ordered/expected, withdrawn before completion
* status      = #revoked
* intent      = #order

// The cytology service that was supposed to happen
* code.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* code.coding[0].code    = #DE13
* code.coding[0].display = "Cervical cytology test"

* subject     = Reference(Patient/example-mng-woman-37-ltfu)
* authoredOn  = "2026-03-15"

// The reason the service did not occur
* reasonCode[0].coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* reasonCode[0].coding[0].code    = #DE10
* reasonCode[0].coding[0].display = "Lost to follow-up"
* reasonCode[0].text              = "Patient could not be contacted at the phone number on file. Three attempts were made between March 22 and April 5, 2026."
