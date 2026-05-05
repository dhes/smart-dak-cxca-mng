// =============================================================================
// QCXCAD2 — Cervical Cancer Screening Eligibility (Questionnaire)
// =============================================================================
// Paired with the CXCAD2 LogicalModel (input/fsh/models/CXCAD2.fsh).
// Captures the data needed to evaluate the screening eligibility decision.
//
// linkId values match CXCAD2 element names 1:1 so that an SDC StructureMap
// for QuestionnaireResponse → CXCAD2 extraction can be authored mechanically.
// The eligibilityOutcome field on CXCAD2 is the *output* of the decision and
// is therefore not captured by the Questionnaire — it is populated by the
// CXCAD2DTScreeningEligibilityLogic CQL library at evaluation time.
//
// Phase 2 vertical slice — minimal item set. Iterations to come:
//   * Add hysterectomy indication and post-hysterectomy cytology fields
//     (with enableWhen rules for conditional display)
//   * Add SDC StructureMap target (sdc-questionnaire-extr-smap profile + the
//     extension targetStructureMap pointing at the extraction map)
//   * Subclass SGQuestionnaire from smart-base for SMART conformance
//   * Bind item answer codings to value sets when those exist
// =============================================================================

Instance:    QCXCAD2
InstanceOf:  Questionnaire
Title:       "QCXCAD2 — Cervical Cancer Screening Eligibility"
Description: "Questionnaire that captures the inputs needed to evaluate cervical cancer screening eligibility (CXCA.D2). Paired with the CXCAD2 LogicalModel; linkId values match LogicalModel element names so a StructureMap-based extraction can be authored mechanically."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Questionnaire/QCXCAD2"
* version   = "0.0.1"
* status    = #draft
* experimental = false
* subjectType = #Patient
* language  = #en

* item[0].linkId   = "clientAge"
* item[0].text     = "Client's age in years on the encounter date"
* item[0].type     = #integer
* item[0].required = true

* item[1].linkId   = "lastHPVScreeningDate"
* item[1].text     = "Date of the client's most recent HPV high-risk DNA screening (leave blank if never screened)"
* item[1].type     = #date
* item[1].required = false

* item[2].linkId   = "hadHysterectomy"
* item[2].text     = "Has the client had a hysterectomy?"
* item[2].type     = #boolean
* item[2].required = false
