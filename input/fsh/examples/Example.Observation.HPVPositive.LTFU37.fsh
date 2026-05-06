// =============================================================================
// Example: HPV+ Observation for the LTFU cascade fixture
// =============================================================================
// Provides the precondition for the LTFU ServiceRequest below: this patient
// got a positive HPV result, which under A/641 §2.2 should trigger follow-up
// cytology. The follow-up didn't happen — that's documented in the paired
// CXCAServiceNotRequested example.
// =============================================================================

Instance:    example-observation-hpv-positive-ltfu37
InstanceOf:  Observation
Title:       "Example: HPV+ result for LTFU patient"
Description: "Synthetic Observation showing a positive HPV high-risk DNA test result in March 2026 for the LTFU example patient. This result triggered an expected follow-up cytology that did not occur (see the paired Example.ServiceRequest.NotRequested.LTFU37)."
Usage:       #example

* status                = #final
* code.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* code.coding[0].code    = #DE3
* code.coding[0].display = "HPV high-risk DNA test"
* subject               = Reference(Patient/example-mng-woman-37-ltfu)
* effectiveDateTime     = "2026-03-12"

* valueCodeableConcept.coding[0].system  = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* valueCodeableConcept.coding[0].code    = #DE8
* valueCodeableConcept.coding[0].display = "HPV high-risk positive"
