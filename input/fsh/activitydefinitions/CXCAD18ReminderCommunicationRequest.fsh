// =============================================================================
// CXCAD18ReminderCommunicationRequest — Reminder Action Template
// =============================================================================
// When a CXCAD18S recall trigger fires, this ActivityDefinition is
// instantiated into a real CommunicationRequest — a request to communicate
// with the patient (or caregiver) to bring them back into the screening
// pathway.
//
// In the Mongolian operational context, the CommunicationRequest typically
// becomes a phone call by the family-clinic staff, an SMS, or — in remote
// rural areas — a visit by the community health worker (per A/641 section 3.1
// outreach personnel). The reasonCode on the instantiated CommunicationRequest
// (one of CXCA.D#DE38–DE44) makes the trigger explicit so the recall worker
// knows why they're calling.
// =============================================================================

Instance:    CXCAD18ReminderCommunicationRequest
InstanceOf:  ActivityDefinition
Title:       "CXCAD18 — Recall Reminder CommunicationRequest"
Description: "Activity template that becomes a CommunicationRequest when the recall scheduling rule (CXCAD18S) detects a timeout trigger. Intent is #proposal — staff review and action the reminder via phone, SMS, or in-person visit. The reasonCode set by the invoking PlanDefinition action identifies which timeout trigger (per A/641 section 2.3) caused the recall."
Usage:       #definition

* url       = "http://smart.who.int/cxca/ActivityDefinition/CXCAD18ReminderCommunicationRequest"
* version   = "0.0.1"
* name      = "CXCAD18ReminderCommunicationRequest"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* kind         = #CommunicationRequest
* intent       = #proposal
* doNotPerform = false
