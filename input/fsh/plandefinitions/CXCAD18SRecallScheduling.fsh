// =============================================================================
// CXCA.D18.S.RecallScheduling — Recall Scheduling PlanDefinition
// =============================================================================
// CDS rule manifest for the recall and re-call decision per A/641 section 2.3.
// Designed for periodic batch sweeps across the screening registry — every
// patient is evaluated against all seven timeout triggers; if any fire, a
// CommunicationRequest reminder is created.
//
// Seven actions correspond to the seven timeout triggers in A/641 section 2.3.
// Each action invokes the same ActivityDefinition (the reminder
// CommunicationRequest) but with a different reasonCode that identifies
// which trigger caused the recall.
//
// Tagged bindingness = legal — A/641 section 2.3 is a binding regulatory provision.
// =============================================================================

Instance:    CXCAD18SRecallScheduling
InstanceOf:  http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition
Title:       "CXCA.D18.S — Recall Scheduling"
Description: "Decision support for recall and re-call per Mongolia MOH Order A/641 (2020) section 2.3. Evaluates seven timeout triggers (HPV sample timeout, positive-result follow-up timeout, biopsy timeout, treatment-after-biopsy timeout, cytology unread timeout, second-reminder, missed scheduled exam) and instantiates a CommunicationRequest reminder for each fired trigger. The 187 LTFU women from the April 2026 Khan-Uul pilot represent the empirical case for why this layer matters — DE39 (positive-result follow-up timeout, 4 weeks) is the trigger that should fire for each of them."
Usage:       #definition

* url       = "http://smart.who.int/cxca/PlanDefinition/CXCAD18SRecallScheduling"
* version   = "0.0.1"
* name      = "CXCAD18SRecallScheduling"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* extension[+].url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* extension[=].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#legal "Legal — binding regulatory instrument"

* library   = "http://smart.who.int/cxca/Library/CXCAD18SRecallSchedulingLogic"

// Action 0 (DE38): HPV sample result timeout (3 weeks)
* action[0].title        = "Recall — HPV sample result missing more than 3 weeks"
* action[0].description  = "An HPV sample was dispatched more than 3 weeks ago and no result has been entered. Issue a reminder to follow up with the lab."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Recall — HPV sample result timeout"
* action[0].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 1 (DE39): positive-result follow-up timeout (4 weeks) — the LTFU-prevention trigger
* action[1].title        = "Recall — positive screening result without follow-up exam after 4 weeks"
* action[1].description  = "A positive screening result was entered more than 4 weeks ago and no follow-up examination has been recorded. Issue a reminder to the patient and the clinician. THIS IS THE LTFU-PREVENTION TRIGGER — the 187 women lost to follow-up in the April 2026 Khan-Uul pilot would each have had this trigger fire."
* action[1].condition[0].kind                 = #applicability
* action[1].condition[0].expression.language  = #text/cql-identifier
* action[1].condition[0].expression.expression = "Recall — positive result follow-up timeout"
* action[1].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 2 (DE40): biopsy result timeout (4 weeks)
* action[2].title        = "Recall — biopsy result missing more than 4 weeks"
* action[2].description  = "A biopsy sample was received at the lab more than 4 weeks ago and no histopathology result has been entered. Follow up with the lab."
* action[2].condition[0].kind                 = #applicability
* action[2].condition[0].expression.language  = #text/cql-identifier
* action[2].condition[0].expression.expression = "Recall — biopsy result timeout"
* action[2].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 3 (DE41): treatment timeout after positive biopsy (4 weeks)
* action[3].title        = "Recall — no treatment record more than 4 weeks after positive biopsy"
* action[3].description  = "A positive biopsy result has been entered for more than 4 weeks and no treatment record exists. Issue a reminder to schedule treatment."
* action[3].condition[0].kind                 = #applicability
* action[3].condition[0].expression.language  = #text/cql-identifier
* action[3].condition[0].expression.expression = "Recall — treatment after positive biopsy timeout"
* action[3].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 4 (DE42): cytology slide unread timeout (2 weeks)
* action[4].title        = "Recall — cytology slide unread more than 2 weeks at lab"
* action[4].description  = "A cytology slide was received more than 2 weeks ago and no cytologist conclusion has been entered. Follow up with the lab."
* action[4].condition[0].kind                 = #applicability
* action[4].condition[0].expression.language  = #text/cql-identifier
* action[4].condition[0].expression.expression = "Recall — cytology slide unread timeout"
* action[4].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 5 (DE43): second reminder (4 weeks after first)
* action[5].title        = "Recall — second reminder needed (first sent more than 4 weeks ago)"
* action[5].description  = "A first reminder was sent more than 4 weeks ago and the underlying gap remains unresolved. Issue a second reminder."
* action[5].condition[0].kind                 = #applicability
* action[5].condition[0].expression.language  = #text/cql-identifier
* action[5].condition[0].expression.expression = "Recall — second reminder needed"
* action[5].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"

// Action 6 (DE44): missed scheduled exam — immediate
* action[6].title        = "Recall — missed scheduled examination"
* action[6].description  = "Patient missed a scheduled examination. Immediate reminder — no timeout wait."
* action[6].condition[0].kind                 = #applicability
* action[6].condition[0].expression.language  = #text/cql-identifier
* action[6].condition[0].expression.expression = "Recall — missed scheduled examination"
* action[6].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"
