// =============================================================================
// FSH wrapper — publishes CXCAD18SRecallSchedulingLogic CQL as a Library.
// Source CQL: input/cql/CXCAD18SRecallSchedulingLogic.cql
// =============================================================================

Instance:    CXCAD18SRecallSchedulingLogic
InstanceOf:  Library
Title:       "CXCAD18SRecallSchedulingLogic"
Description: "CQL logic library for the recall and re-call decision (CXCA.D18.S — scheduling). Encodes the seven timeout triggers from A/641 (2020) §2.3 (HPV sample timeout, positive-result follow-up timeout, biopsy timeout, treatment-after-biopsy timeout, cytology unread timeout, second-reminder, missed scheduled exam). Each trigger maps to a CXCA.D recall-reason code (DE38–DE44). Source CQL is at input/cql/CXCAD18SRecallSchedulingLogic.cql."
Usage:       #definition

* insert LogicLibrary( CXCAD18SRecallSchedulingLogic )
