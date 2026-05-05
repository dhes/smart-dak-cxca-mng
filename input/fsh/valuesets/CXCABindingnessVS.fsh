// =============================================================================
// CXCABindingnessVS — ValueSet enumerating the bindingness codes
// =============================================================================
// Required by the cxca-bindingness Extension's value binding. Encompasses
// all codes from the CXCA.Bindingness CodeSystem.
// =============================================================================

ValueSet:    CXCABindingnessVS
Id:          CXCABindingnessVS
Title:       "CXCA Regulatory Bindingness Values"
Description: "Permitted values for the cxca-bindingness Extension. Includes all codes from the CXCA.Bindingness CodeSystem: legal, programmatic, operational."

* ^url = "http://smart.who.int/cxca/ValueSet/CXCABindingnessVS"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false

* include codes from system CXCA.Bindingness
