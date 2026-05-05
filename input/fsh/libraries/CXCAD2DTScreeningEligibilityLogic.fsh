// =============================================================================
// FSH wrapper — publishes the CXCAD2DTScreeningEligibilityLogic CQL
// (input/cql/CXCAD2DTScreeningEligibilityLogic.cql) as a FHIR Library resource.
//
// The LogicLibrary RuleSet (input/fsh/rulesets/LogicLibrary.fsh) handles all
// the CRMI/CQL profile boilerplate; this wrapper just supplies identity.
// =============================================================================

Instance:    CXCAD2DTScreeningEligibilityLogic
InstanceOf:  Library
Title:       "CXCAD2DTScreeningEligibilityLogic"
Description: "Decision support logic for cervical cancer screening eligibility (CXCA.D2). Encodes the binding eligibility rules from Mongolia MOH Order A/641 (2020) §2.2. Source CQL is at input/cql/CXCAD2DTScreeningEligibilityLogic.cql."
Usage:       #definition

* insert LogicLibrary( CXCAD2DTScreeningEligibilityLogic )
