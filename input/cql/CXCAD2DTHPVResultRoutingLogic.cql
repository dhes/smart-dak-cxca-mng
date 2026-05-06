/*
 * Library: CXCAD2DTHPVResultRoutingLogic
 *
 * Decision: What to do with a returned HPV high-risk DNA test result
 * L2 Source: A/641 (2020) Fig 2.4 — HPV pathway result routing tree
 * Trigger: HPV result available for an HPV-screened patient
 *
 * THE ROUTING TREE:
 *
 *   HPV result returns
 *      ↓
 *   ┌──────────────────────────────────┐
 *   │ HPV negative                     │ → return to routine screening
 *   ├──────────────────────────────────┤
 *   │ HPV positive                     │ → re-read the saved cytology slide
 *   │   ↓                              │
 *   │   Cytology < ASC-US (NILM)       │ → repeat HPV in 12 months
 *   │   ↓ (then if HPV+ again)         │
 *   │   → refer to colposcopy          │
 *   │                                  │
 *   │   Cytology ≥ ASC-US              │ → refer to colposcopy directly
 *   └──────────────────────────────────┘
 *
 * This library encodes the IMMEDIATE three-outcome decision (HPV negative /
 * HPV+ with negative cytology / HPV+ with abnormal cytology). The 12-month
 * repeat-HPV cycle is encoded as the routing outcome; tracking and timer-
 * based recall happens via the recall/scheduling layer (chunk 7 — deferred).
 *
 * Each routing outcome maps to a CXCA.D code (DE34/DE35/DE36).
 */

library CXCAD2DTHPVResultRoutingLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

// Placeholders — to be replaced with FHIR queries via the shared CXCAElements
// layer. Real implementation:
//   HPVResultPositive: Observation with code = CXCA.D#DE3 and value = CXCA.D#DE8
//   CytologyResultASCUSorWorse: Observation with code = CXCA.D#DE13 and value
//     in {DE30 ASC-US, DE31 ASC-H, DE32 LSIL, DE33 HSIL} (Bethesda ≥ ASC-US)
parameter "HPVResultPositive" Boolean default false
parameter "CytologyResultASCUSorWorse" Boolean default false

context Patient

// =============================================================================
// Routing rules — three mutually-exclusive outcomes per A/641 Fig 2.4
// =============================================================================

/*
 * @output: CXCA.D#DE34 "Route: return to routine screening"
 * @bindingness: legal
 * HPV result is negative — no further investigation indicated.
 */
define "Route — HPV negative, return to routine":
  not "HPVResultPositive"

/*
 * @output: CXCA.D#DE35 "Route: repeat HPV test in 12 months"
 * @bindingness: legal
 * HPV result is positive but the cytology re-read shows no significant
 * cellular abnormality (NILM / less than ASC-US). Per Fig 2.4, do not refer
 * to colposcopy yet — recheck HPV in 12 months. If still positive at recheck,
 * the next evaluation will route to colposcopy.
 */
define "Route — HPV+, cytology negative, repeat HPV in 12 months":
  "HPVResultPositive"
    and not "CytologyResultASCUSorWorse"

/*
 * @output: CXCA.D#DE36 "Route: refer to colposcopy"
 * @bindingness: legal
 * HPV result is positive and cytology re-read shows ≥ ASC-US (any of
 * ASC-US, ASC-H, LSIL, HSIL per Bethesda 2014). Refer to colposcopy
 * directly per A/641 Fig 2.4 (Op.Inst. 5.6 covers the colposcopy procedure).
 */
define "Route — HPV+, cytology ≥ ASC-US, refer to colposcopy":
  "HPVResultPositive"
    and "CytologyResultASCUSorWorse"
