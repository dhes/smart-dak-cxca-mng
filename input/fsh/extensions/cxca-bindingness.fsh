// =============================================================================
// cxca-bindingness — Extension for tagging artifacts with regulatory bindingness
// =============================================================================
// Pairs with the CXCA.Bindingness CodeSystem. Apply this extension to any
// FHIR resource (PlanDefinition, Library, Measure, ActivityDefinition, etc.)
// to declare which regulatory position it encodes.
//
// Allowed contexts: PlanDefinition, Library, Measure, ActivityDefinition,
//   StructureDefinition (for profiles that encode bindingness-typed artifacts)
//
// Example usage in FSH:
//   * extension[cxca-bindingness].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#legal
//
// Example usage of the alias defined in input/fsh/Aliases.fsh (when added):
//   * extension[cxca-bindingness].valueCoding = $cxca-bindingness#legal
// =============================================================================

Extension:    CXCABindingness
Id:           cxca-bindingness
Title:        "Regulatory Bindingness"
Description:  "Tags an artifact with its regulatory bindingness (legal | programmatic | operational), letting consumers filter by what's currently binding vs. what's programmatically announced vs. what's empirically observed in operation. Materializes the bindingness methodology contribution of the smart-dak-cxca DAK."

* ^url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false

// Restrict where this extension can appear
* ^context[+].type = #element
* ^context[=].expression = "PlanDefinition"
* ^context[+].type = #element
* ^context[=].expression = "Library"
* ^context[+].type = #element
* ^context[=].expression = "Measure"
* ^context[+].type = #element
* ^context[=].expression = "ActivityDefinition"

// One value, of type Coding, bound to the bindingness CodeSystem
* value[x] only Coding
* valueCoding from CXCABindingnessVS (required)
