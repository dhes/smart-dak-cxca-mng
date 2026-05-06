/*
 * Library: CXCAD18SRecallSchedulingLogic
 *
 * Decision: Should a recall reminder be issued for this patient?
 * L2 Source: A/641 (2020) section 2.3 — recall and re-call system
 * Trigger: Periodic batch sweep across the screening registry, OR encounter-time check
 *
 * THE RECALL TRIGGER MATRIX (per A/641 section 2.3, p. 28):
 *
 *   Trigger                                   | Clock starts at        | Threshold
 *   ──────────────────────────────────────────────────────────────────────────────
 *   HPV result not in registry                | sample dispatched      | 3 weeks
 *   Cytology slide unread                     | slide received at lab  | 2 weeks
 *   Positive result, no follow-up exam        | result entered         | 4 weeks
 *   Biopsy unread                             | tissue received at lab | 4 weeks
 *   Positive biopsy, no treatment record      | dx entered             | 4 weeks
 *   Second reminder                           | 1st reminder sent      | 4 weeks
 *   Client missed scheduled exam              | scheduled date         | (immediate)
 *
 * Each trigger maps to a CXCA.D recall-reason code (DE38–DE44) which becomes
 * the reasonCode on the issued CommunicationRequest.
 *
 * METHODOLOGY ECHO:
 * The 187 LTFU women from the April 2026 Khan-Uul pilot represent the
 * empirical motivation for this layer. The DE39 trigger ("positive result,
 * no follow-up exam") fires automatically 4 weeks after a positive HPV
 * result without follow-up — exactly the moment when each of those 187
 * women should have triggered a reminder. The Phase 4 NotDone profile
 * captures the *outcome* of LTFU; this layer captures the *process* that
 * either prevents LTFU or surfaces it for explicit documentation.
 *
 * Phase 5 placeholder — real implementation queries time intervals across
 * Patient → ServiceRequest → Observation → Procedure chains. The shared
 * CXCAElements layer (chunk 8) will provide the timeAgo helpers.
 */

library CXCAD18SRecallSchedulingLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter Today Date default Today()

// Placeholders — to be replaced with FHIR queries via the shared CXCAElements
// layer. Each parameter represents a per-patient timeout state.
parameter "HPVSampleResultTimedOut" Boolean default false
parameter "PositiveResultFollowUpTimedOut" Boolean default false
parameter "BiopsyResultTimedOut" Boolean default false
parameter "TreatmentAfterPositiveBiopsyTimedOut" Boolean default false
parameter "CytologySlideUnreadTimedOut" Boolean default false
parameter "FirstReminderUnresolvedAtSecondTimeout" Boolean default false
parameter "MissedScheduledExamination" Boolean default false

context Patient

// =============================================================================
// Recall trigger rules — one per A/641 section 2.3 timeout
// =============================================================================

/*
 * @output: CXCA.D#DE38 "Recall: HPV sample result timeout (3 weeks)"
 */
define "Recall — HPV sample result timeout":
  "HPVSampleResultTimedOut"

/*
 * @output: CXCA.D#DE39 "Recall: positive result follow-up timeout (4 weeks)"
 * The single most important trigger — fires for the LTFU population from
 * the April 2026 Khan-Uul pilot.
 */
define "Recall — positive result follow-up timeout":
  "PositiveResultFollowUpTimedOut"

/*
 * @output: CXCA.D#DE40 "Recall: biopsy result timeout (4 weeks)"
 */
define "Recall — biopsy result timeout":
  "BiopsyResultTimedOut"

/*
 * @output: CXCA.D#DE41 "Recall: treatment timeout after positive biopsy (4 weeks)"
 */
define "Recall — treatment after positive biopsy timeout":
  "TreatmentAfterPositiveBiopsyTimedOut"

/*
 * @output: CXCA.D#DE42 "Recall: cytology slide unread timeout (2 weeks)"
 */
define "Recall — cytology slide unread timeout":
  "CytologySlideUnreadTimedOut"

/*
 * @output: CXCA.D#DE43 "Recall: second reminder (4 weeks after first)"
 */
define "Recall — second reminder needed":
  "FirstReminderUnresolvedAtSecondTimeout"

/*
 * @output: CXCA.D#DE44 "Recall: missed scheduled examination"
 * No timeout — fires immediately once a missed appointment is detected.
 */
define "Recall — missed scheduled examination":
  "MissedScheduledExamination"

/*
 * @internal: any recall trigger fired
 */
define "Any recall trigger fired":
  "Recall — HPV sample result timeout"
    or "Recall — positive result follow-up timeout"
    or "Recall — biopsy result timeout"
    or "Recall — treatment after positive biopsy timeout"
    or "Recall — cytology slide unread timeout"
    or "Recall — second reminder needed"
    or "Recall — missed scheduled examination"
