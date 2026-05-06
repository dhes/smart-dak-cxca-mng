/*
 * Library: CXCAElements
 *
 * THE HARMONIZATION LAYER.
 *
 * A shared CQL library that provides per-patient predicates and counts derived
 * from FHIR resources, consumed by both the CDS-side Logic libraries (e.g.,
 * CXCAD2DTScreeningEligibilityLogic) and the eCQM-side Indicator libraries
 * (e.g., CXCAIND01Logic). The defines below are the single source of truth
 * for what counts as "an HPV+ result," "a documented hysterectomy," etc.
 *
 * METHODOLOGY POINT (the harmonization paper distilled):
 *
 *   When CDS asks "is this patient due for screening today?" and an eCQM asks
 *   "what % of the cohort got screened in the period?", they ask different
 *   *aggregations* of the same underlying clinical fact: "did this patient
 *   get screened?" If both consumers compute that fact independently, they
 *   can drift — and the report stops aligning with the rule that drove the
 *   care. The fix is to define the underlying fact ONCE in a shared layer
 *   and have both consumers reference it.
 *
 *   IMMZ realizes this with `IMMZElements` and disease-specific
 *   `IMMZD2DTMeasles*Elements` libraries. We mirror that pattern here.
 *
 * Phase 5 chunk 8 — initial demonstration set. Currently only "Has Had
 * Hysterectomy" is materialized as a real FHIR query (Procedure with
 * CXCA.D#DE45). Subsequent iterations will add:
 *   - Per-period HPV result existence (with positive/negative value check)
 *   - Per-period cytology result existence (with Bethesda value check)
 *   - Per-period HPV-not-done existence (the Phase 4 NotDone pattern)
 *   - Time-window helpers (hasResultWithin, isExpectedButMissingFor)
 *
 * Each new define replaces a placeholder Boolean parameter in a downstream
 * library — this is the per-iteration migration path from placeholder-CQL
 * to real-FHIR-query-CQL.
 */

library CXCAElements version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

context Patient

// =============================================================================
// Patient demographics
// =============================================================================

/*
 * Current patient age in years.
 */
define "Current Patient Age In Years":
  AgeInYears()

// =============================================================================
// Hysterectomy history
// =============================================================================

/*
 * @internal: All recorded hysterectomy procedures for this patient,
 *   filtered to status = completed.
 */
define "Hysterectomy Procedures":
  [Procedure] P
    where P.status = 'completed'
      and exists (P.code.coding C where C.code = 'DE45'
                                     and C.system = 'http://smart.who.int/cxca/CodeSystem/CXCA.D')

/*
 * The patient has a documented completed hysterectomy.
 *
 * NOTE: A/641 section 2.2 only excludes hysterectomy for non-cervical-cancer indication
 * with a documented negative post-op vaginal-smear cytology. This define
 * captures only the hysterectomy fact; the indication and post-op cytology
 * checks live in higher-layer logic that combines this define with others.
 */
define "Has Had Hysterectomy":
  exists "Hysterectomy Procedures"
