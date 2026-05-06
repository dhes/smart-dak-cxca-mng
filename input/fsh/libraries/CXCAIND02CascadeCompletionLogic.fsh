// =============================================================================
// FSH wrapper — publishes the CXCAIND02CascadeCompletionLogic CQL as a
// FHIR Library resource.
// Source CQL: input/cql/CXCAIND02CascadeCompletionLogic.cql
// =============================================================================

Instance:    CXCAIND02CascadeCompletionLogic
InstanceOf:  Library
Title:       "CXCAIND02CascadeCompletionLogic"
Description: "CQL logic library for CXCA.IND.02 — cervical cancer screening cascade completion (NotDone-aware). Distinguishes successful cytology, documented non-occurrence (LTFU), and absent records. Source CQL is at input/cql/CXCAIND02CascadeCompletionLogic.cql."
Usage:       #definition

* insert LogicLibrary( CXCAIND02CascadeCompletionLogic )
