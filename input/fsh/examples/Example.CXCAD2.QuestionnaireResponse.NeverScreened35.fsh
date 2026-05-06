// =============================================================================
// Example: QuestionnaireResponse fixture for QCXCAD2
// =============================================================================
// Synthetic test data demonstrating a 35-year-old Mongolian woman attending
// her first cervical cancer screening encounter at a soum primary-care clinic.
//
// Expected CDS behavior:
//   * "Client age" = 35 (from item.clientAge)
//   * "Client is due for HPV screening at age 35" = TRUE
//   * PlanDefinition action fires
//   * ActivityDefinition CXCAD2HPVScreeningServiceRequest is instantiated
//
// This is the canonical "first-encounter, never-screened" scenario from the
// outreach-worker analysis we did earlier (extracted from A/641 section 5.1 anamnesis
// + ЭИМ-5а enrollment + ЭИМ-5б HPV sample referral).
//
// Subject Patient is referenced by ID only — the Patient resource itself is
// not authored in Phase 2 (will be added in Phase 5 when we vendor smart-core
// SRH profiles for the full anamnesis fixture).
// =============================================================================

Instance:    Example.CXCAD2.QuestionnaireResponse.NeverScreened35
InstanceOf:  QuestionnaireResponse
Title:       "Example QCXCAD2 — 35-year-old, never screened (Mongolia outreach scenario)"
Description: "Synthetic QuestionnaireResponse for QCXCAD2: a 35-year-old Mongolian woman with no prior HPV screening and no hysterectomy history. Used as a fixture to demonstrate the CDS chain end-to-end — when this fixture is evaluated against CXCAD2DTScreeningEligibilityLogic, the rule 'Client is due for HPV screening at age 35' returns true, triggering the PlanDefinition's action and instantiating the HPV-screening ServiceRequest ActivityDefinition."
Usage:       #example

* status        = #completed
* authored      = "2026-05-05T10:00:00+08:00"
* questionnaire = "http://smart.who.int/cxca/Questionnaire/QCXCAD2"
* subject       = Reference(Patient/example-mng-woman-35)

// linkId values match QCXCAD2 items 1:1 (and CXCAD2 LogicalModel field names)
* item[0].linkId = "clientAge"
* item[0].answer.valueInteger = 35

* item[1].linkId = "lastHPVScreeningDate"
// no answer — client has never been screened

* item[2].linkId = "hadHysterectomy"
* item[2].answer.valueBoolean = false
