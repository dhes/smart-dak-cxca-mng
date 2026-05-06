/*
 * Library: CXCAIND02CascadeCompletionLogic
 *
 * Indicator: CXCA.IND.02 — Cervical Cancer Screening Cascade Completion (NotDone-aware)
 *
 * METHODOLOGY CONTRIBUTION:
 * This measure uses the CXCAServiceNotRequested profile from Phase 4 to
 * distinguish three states for HPV-positive patients in the measurement period:
 *
 *   1. Cytology completed (Procedure with status=completed)
 *      → "Successful cascade completion"
 *
 *   2. Cytology documented as not occurring (CXCAServiceNotRequested with
 *      reasonCode in CXCA.D — typically DE10 "Lost to follow-up")
 *      → "Documented non-occurrence" — explicit, traceable, not a system gap
 *
 *   3. Neither (HPV+ patient with no subsequent cytology record at all)
 *      → "Absent / unknown" — visibility gap; programme cannot account for
 *        this patient's downstream care
 *
 * The Numerator counts (1) + (2) — patients who reached cascade *resolution*.
 * The Numerator Exclusion counts (2) alone, surfacing the LTFU sub-rate.
 * Patients in state (3) are correctly excluded from the numerator entirely,
 * accurately reflecting our ignorance of their state rather than conflating
 * them with patients who received zero follow-up.
 *
 * Without the NotDone pattern, a vanilla cascade measure can only compute
 *   "% of HPV+ with cytology" = state (1) / (states (1) + (2) + (3) combined)
 * which conflates documented LTFU with absent records and gives programme
 * managers a false sense of certainty.
 *
 * MOTIVATION (concrete numbers):
 * The April 2026 Khan-Uul HPV-DNA pilot in Mongolia identified 371 HPV+ women.
 * 184 received follow-up cytology; 187 were lost to follow-up; 0 were unknown
 * (the pilot tracked everyone). Under this measure with the NotDone pattern
 * applied:
 *   - Denominator = 371 (all HPV+)
 *   - Numerator = 371 (all reached resolution: 184 cytology + 187 LTFU)
 *   - Numerator Exclusion = 187 (the LTFU sub-rate)
 *   - Cascade resolution % = 100%, with 50% LTFU sub-rate
 *
 * Compare to a vanilla measure (no NotDone profile): 184/371 = 49.6% and
 * the 187 LTFU women are invisible. The methodology improvement is the
 * difference between "we know we have a 50% LTFU problem" and "we have a
 * 49.6% follow-up rate" — same data, different visibility.
 *
 * PLACEHOLDER PATTERN:
 * As with the Phase 2/5 eligibility CQL, this implementation uses Boolean
 * parameters as stand-ins for FHIR queries. Real implementation will replace
 * these with [Observation] / [Procedure] / [ServiceRequest] queries via the
 * shared CXCAElements layer when authored. The Numerator/Denominator
 * structure is identical regardless.
 */

library CXCAIND02CascadeCompletionLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

// Placeholders — to be replaced with FHIR queries via the shared CXCAElements
// layer in a future iteration. Each parameter represents a per-patient fact
// derived from underlying resources.
parameter "PatientHasHPVPositiveInPeriod" Boolean default false
parameter "PatientHasCytologyCompletedInPeriod" Boolean default false
parameter "PatientHasCytologyNotDoneRecordedInPeriod" Boolean default false

context Patient

/*
 * @initialPopulation: as defined by Member State (placeholder — true)
 *   Real implementation: women in target age range alive at start of period
 *   in the jurisdiction.
 */
define "Initial Population":
  true

/*
 * @denominator: Patients with an HPV+ result during the measurement period.
 *   These are the patients whose cascade we want to track.
 */
define "Denominator":
  "PatientHasHPVPositiveInPeriod"

/*
 * @numerator: HPV+ patients who reached cascade *resolution* — either by
 *   completing cytology OR by having a documented non-occurrence record.
 */
define "Numerator":
  "PatientHasHPVPositiveInPeriod"
    and ("PatientHasCytologyCompletedInPeriod"
      or "PatientHasCytologyNotDoneRecordedInPeriod")

/*
 * @numeratorExclusion: HPV+ patients whose resolution was via documented
 *   non-occurrence (LTFU) rather than actual cytology completion.
 *
 *   FHIR Measure semantics: numerator-exclusion is subtracted from the
 *   numerator when computing the proportion. This lets a single Measure
 *   resource expose three computable views:
 *     - Cascade resolution rate: Numerator / Denominator
 *     - True follow-up rate:     (Numerator − NumeratorExclusion) / Denominator
 *     - Documented LTFU rate:    NumeratorExclusion / Denominator
 *   Together with (Denominator − Numerator) = the absent / unknown count,
 *   this gives programme managers a four-way partition of the HPV+ cohort.
 */
define "Numerator Exclusion":
  "PatientHasHPVPositiveInPeriod"
    and "PatientHasCytologyNotDoneRecordedInPeriod"
    and not "PatientHasCytologyCompletedInPeriod"
