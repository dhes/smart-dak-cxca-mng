/*
 * Library: CXCAD2DTScreeningEligibilityLogic
 *
 * Decision: Cervical cancer screening eligibility (HPV pathway)
 * L2 Source: A/641 (2020) section 2.2 — Mongolia binding screening eligibility rules
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
 *   This rule references four predicates. One has been migrated to a real
 *   FHIR query in the shared CXCAElements layer; three remain as Boolean
 *   parameters that the CDS client must supply at evaluation time.
 *
 *     ✓ Migrated   Elements."Has Had Hysterectomy"
 *                  → real query against [Procedure] with code CXCA.D#DE45
 *
 *     ⏸ Placeholder "HasRecentHPVScreening", "HasRecentCytologyScreening"
 *                  → straightforward queries in shape, but require a design
 *                    decision on the recall window: parameterize the interval
 *                    (one define for both pathways) or author sibling defines
 *                    (HPV-recent at 10y, cytology-recent at 3y per A/641 §2.2)?
 *                    Held until the design call is made.
 *
 *     ⏸ Placeholder "FacilityHasHPVCapability"
 *                  → not actually a per-patient FHIR query — this is facility
 *                    configuration. Real implementation could derive it from a
 *                    Location/Organization extension OR keep it as a parameter
 *                    the CDS client supplies. Both are defensible; left as a
 *                    parameter for now.
 *
 *   The migration is structurally trivial: replacing a parameter read with
 *   `Elements."<name>"` only changes the body of the consuming define. The
 *   define's name, signature, and PlanDefinition wiring all stay intact, so
 *   downstream consumers (the PlanDefinition actions, ActivityDefinitions,
 *   fixtures) are unaffected.
 */

library CXCAD2DTScreeningEligibilityLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

// Shared elements layer — the harmonization substrate. Provides
// `Has Had Hysterectomy` (a real FHIR query against [Procedure]); other
// per-period predicates can be added here as they are authored.
include CXCAElements called Elements

parameter Today Date default Today()

// Placeholder parameters — see PLACEHOLDER PATTERN in the file header for
// the per-parameter rationale on why these remain as parameters rather than
// migrating to CXCAElements queries.
parameter "HasRecentHPVScreening" Boolean default false
parameter "HasRecentCytologyScreening" Boolean default false

// Facility lab-capacity selector — A/641 section 2.2 specifies different age cycles
// based on whether the facility can run HPV high-risk DNA tests in-house.
//   true  → HPV pathway (ages 35 and 45 only)
//   false → cytology pathway (the 11-age 3-year cycle: 30, 33, 36, 39, 42,
//           45, 48, 51, 54, 57, 60)
// Real implementation will derive this from a Location/Organization extension
// or from a facility-registry lookup; in this iteration it is a parameter
// the CDS client supplies.
parameter "FacilityHasHPVCapability" Boolean default true

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
 * The client is at one of the binding target ages per A/641 section 2.2
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
// Legal-binding eligibility tree — A/641 section 2.2 (HPV at ages 35 and 45)
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
    and not Elements."Has Had Hysterectomy"
    and not "HasRecentHPVScreening"

/*
 * @output: CXCA.D#DE5 "Not due — already screened in current cycle"
 * @bindingness: legal
 * Client is at a target age but has had a recent valid HPV screening result.
 */
define "Client not due — already screened in current cycle (legal binding)":
  "Client is at binding target age (35 or 45)"
    and "HasRecentHPVScreening"
    and not Elements."Has Had Hysterectomy"

/*
 * @output: CXCA.D#DE6 "Excluded — outside target age range"
 * @bindingness: legal
 * Client is not at a binding target age (35 or 45 only for HPV-capable facilities).
 */
define "Client excluded — outside target age range (legal binding)":
  not "Client is at binding target age (35 or 45)"
    and not Elements."Has Had Hysterectomy"

/*
 * @output: CXCA.D#DE7 "Excluded — prior hysterectomy"
 * @bindingness: legal
 * Client has had a hysterectomy for non-cervical-cancer indication and is
 * therefore exempt from cervical cancer screening per A/641 section 2.2.
 */
define "Client excluded — prior hysterectomy (legal binding)":
  Elements."Has Had Hysterectomy"

// =============================================================================
// Cytology-pathway eligibility — A/641 section 2.2 (cytology-only facilities)
// Bindingness: legal — binding to cytology-only facilities under A/641
//
// Eleven binding ages on a 3-year cycle: 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60.
// Applied when the facility has no HPV DNA testing capability.
// =============================================================================

/*
 * The client is at one of the 11 binding cytology-pathway target ages
 * per A/641 section 2.2 (cytology-only facilities, 3-year cycle from 30 to 60).
 */
define "Client is at cytology pathway target age":
  "Client age" in { 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60 }

/*
 * @output: CXCA.D#DE4 "Due for HPV screening" — but the test recommended is
 *   cytology, not HPV (the screening name in CXCA.D#DE4 reflects the WHO
 *   target test; both pathways are flavors of "cervical cancer screening").
 * @bindingness: legal
 * Cytology-pathway client is due if at one of the 11 target ages, the facility
 * lacks HPV capability, no hysterectomy, and no recent valid cytology screening.
 */
define "Client is due for cytology screening (legal binding)":
  "Client is at cytology pathway target age"
    and not "FacilityHasHPVCapability"
    and not Elements."Has Had Hysterectomy"
    and not "HasRecentCytologyScreening"

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
    and not Elements."Has Had Hysterectomy"
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
