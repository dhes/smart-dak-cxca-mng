// =============================================================================
// CXCA.D2 — Cervical Cancer Screening Eligibility (Logical Model)
// =============================================================================
// Data shape for the inputs and output of the screening eligibility decision.
// This model is the bridge between:
//   - The QCXCAD2 Questionnaire (which captures these inputs from a clinician)
//   - The CXCAD2DTScreeningEligibilityLogic CQL library (which evaluates the
//     decision and emits the eligibilityOutcome)
//
// L2 source: A/641 (2020) §2.2 — Mongolia binding HPV screening eligibility.
//
// Phase 2 vertical slice — minimal field set. Hysterectomy indication,
// post-hysterectomy cytology, pregnancy status, and facility lab capacity
// will be added in subsequent iterations.
// =============================================================================

Logical:      CXCAD2
Id:           CXCAD2
Title:        "CXCA.D2 — Cervical Cancer Screening Eligibility"
Description:  "Logical model for the inputs and output of the cervical cancer screening eligibility decision (D2). Paired with the QCXCAD2 Questionnaire for data capture and consumed by the CXCAD2DTScreeningEligibilityLogic CQL library. Reflects the binding eligibility rules in Mongolia MOH Order A/641 (2020) §2.2. Note: the LogicalModel ID is `CXCAD2` (no period) because periods in LogicalModel IDs collide with FSH path generation; the human-readable title preserves the `CXCA.D2` notation."

* ^url = "http://smart.who.int/cxca/StructureDefinition/CXCAD2"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false

// ---- Inputs to the eligibility decision ----
* clientAge 1..1 integer "Client's age in years on the encounter date"
* lastHPVScreeningDate 0..1 date "Date of the client's most recent HPV high-risk DNA screening, if any. Empty if never screened or unknown."
* hadHysterectomy 0..1 boolean "Whether the client has had a hysterectomy. Empty if unknown."

// ---- Output of the eligibility decision ----
* eligibilityOutcome 0..1 Coding "The decision output. Bound to CXCA.D codes DE4 (Due), DE5 (Not due — already screened in cycle), DE6 (Excluded — outside target age), or DE7 (Excluded — prior hysterectomy)."

// ---- FHIRPath invariant — demonstration of the conditional-required pattern ----
* obeys cxca-d2-screen-date-not-future

Invariant:    cxca-d2-screen-date-not-future
Description:  "Last HPV screening date cannot be in the future"
Expression:   "lastHPVScreeningDate.empty() or lastHPVScreeningDate <= today()"
Severity:     #error
