// =============================================================================
// LogicLibrary RuleSet — boilerplate macro for FHIR Library wrappers
// =============================================================================
// Mirrors the smart-base LogicLibrary RuleSet, customized for cxca's
// independent-contributor publisher attribution.
//
// Usage in a library FSH file:
//   Instance: <LibraryName>
//   InstanceOf: Library
//   Title: "..."
//   Description: "..."
//   Usage: #definition
//   * insert LogicLibrary( <LibraryName> )
//
// The `ig-loader-{library}.cql` content reference is the convention by which
// the IG publisher associates a FHIR Library resource with its source .cql
// file in input/cql/.
// =============================================================================

RuleSet: LogicLibrary( library )
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-library"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-module"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
  * valueCode = #computable
* name = "{library}"
* status = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"
* type = $library-type#logic-library
* content
  * id = "ig-loader-{library}.cql"
