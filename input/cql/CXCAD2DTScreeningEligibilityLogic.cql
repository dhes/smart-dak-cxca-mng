/*
 * Library: CXCAD2DTScreeningEligibilityLogic
 *
 * Decision: Cervical cancer screening eligibility (HPV pathway)
 * L2 Source: A/641 (2020) §2.2 — Mongolia binding screening eligibility rules
 * Trigger: CXCA.D2 — encounter with a woman in primary-care setting
 *
 * Phase 5 expansion: implements the full four-outcome eligibility tree
 *   (Due, Not Due in Cycle, Outside Age Range, Excluded - Hysterectomy)
 *   across both binding ages 35 and 45, plus a parallel programmatic-overlay
 *   tree for the April 2025 launch's announced 30 and 40 ages.
 *
 * Each outcome is encoded as a separate CQL define so PlanDefinition actions
 * can fire on them individually — this lets a CDS engine surface different
 * guidance text per outcome rather than collapsing all branches into a
 * single boolean.
 *
 * PLACEHOLDER PATTERN — read carefully:
 *   The current implementation uses simple boolean parameters as stand-ins
 *   for FHIR data queries. Real implementation queries (Observations for
 *   prior HPV screening, Procedures for hysterectomy history) require a
 *   shared CXCAElements layer that hasn't been authored yet. The defines
 *   below are structurally correct and pluggable — replacing the parameter
 *   reads with FHIR queries is mechanical work that doesn't change the
 *   PlanDefinition or downstream consumers.
 */

library CXCAD2DTScreeningEligibilityLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter Today Date default Today()

// Placeholder parameters — to be replaced with FHIR queries via the shared
// CXCAElements layer in a future iteration.
parameter "HasHadHysterectomy" Boolean default false
parameter "HasRecentHPVScreening" Boolean default false

context Patient

// =============================================================================
// Helper definitions
// =============================================================================

/*
 * Client age in years at the encounter date.
 */
define "Client age":
  AgeInYearsAt(Today)

/*
 * The client is at one of the binding target ages per A/641 §2.2
 * (HPV-test-capable facilities: ages 35 and 45 only).
 */
define "Client is at binding target age (35 or 45)":
  "Client age" = 35 or "Client age" = 45

/*
 * The client is at one of the programmatic-overlay target ages per the
 * April 2025 Cervical Cancer Elimination Programme launch announcement
 * (ages 30 and 40).
 */
define "Client is at programmatic target age (30 or 40)":
  "Client age" = 30 or "Client age" = 40

// =============================================================================
// Legal-binding eligibility tree — A/641 §2.2 (HPV at ages 35 and 45)
// Bindingness: legal
// =============================================================================

/*
 * @output: CXCA.D#DE4 "Due for HPV screening"
 * @bindingness: legal
 * Client is due if at a binding target age, has not had a hysterectomy,
 * and has not been screened in the current cycle.
 */
define "Client is due for HPV screening (legal binding)":
  "Client is at binding target age (35 or 45)"
    and not "HasHadHysterectomy"
    and not "HasRecentHPVScreening"

/*
 * @output: CXCA.D#DE5 "Not due — already screened in current cycle"
 * @bindingness: legal
 * Client is at a target age but has had a recent valid HPV screening result.
 */
define "Client not due — already screened in current cycle (legal binding)":
  "Client is at binding target age (35 or 45)"
    and "HasRecentHPVScreening"
    and not "HasHadHysterectomy"

/*
 * @output: CXCA.D#DE6 "Excluded — outside target age range"
 * @bindingness: legal
 * Client is not at a binding target age (35 or 45 only for HPV-capable facilities).
 */
define "Client excluded — outside target age range (legal binding)":
  not "Client is at binding target age (35 or 45)"
    and not "HasHadHysterectomy"

/*
 * @output: CXCA.D#DE7 "Excluded — prior hysterectomy"
 * @bindingness: legal
 * Client has had a hysterectomy for non-cervical-cancer indication and is
 * therefore exempt from cervical cancer screening per A/641 §2.2.
 */
define "Client excluded — prior hysterectomy (legal binding)":
  "HasHadHysterectomy"

// =============================================================================
// Programmatic-overlay eligibility — April 2025 launch's 30/40 announcement
// Bindingness: programmatic (Mongolia overlay)
// =============================================================================

/*
 * @output: CXCA.D#DE4 "Due for HPV screening"
 * @bindingness: programmatic — Mongolia overlay
 * @source: WHO Mongolia news release, 22 April 2025.
 */
define "Client is due for HPV screening (programmatic)":
  "Client is at programmatic target age (30 or 40)"
    and not "HasHadHysterectomy"
    and not "HasRecentHPVScreening"

// =============================================================================
// Backward-compatibility shims — preserve Phase 2/3 define names so existing
// PlanDefinition references continue to fire.
// (These aliases will be removed once all references migrate to the
// expanded define names above.)
// =============================================================================

define "Client is due for HPV screening at age 35":
  "Client age" = 35

define "Client is due for HPV screening at age 30":
  "Client age" = 30
