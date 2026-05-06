// =============================================================================
// FSH wrapper — publishes the CXCAElements CQL as a FHIR Library resource.
// THE harmonization layer — the shared substrate the eCQM/CDS paper calls for.
// Source CQL: input/cql/CXCAElements.cql
// =============================================================================

Instance:    CXCAElements
InstanceOf:  Library
Title:       "CXCAElements"
Description: "Shared CQL elements library for the cervical cancer screening DAK. Provides per-patient predicates and counts derived from FHIR resources (Patient, Procedure, Observation, ServiceRequest); consumed by both CDS-side Logic libraries and eCQM-side Indicator libraries to materialize the harmonization pattern from the eCQM/CDS paper. Source CQL is at input/cql/CXCAElements.cql."
Usage:       #definition

* insert LogicLibrary( CXCAElements )
