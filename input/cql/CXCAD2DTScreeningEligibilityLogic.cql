/*
 * Library: CXCAD2DTScreeningEligibilityLogic
 *
 * Decision: Cervical cancer screening eligibility (HPV pathway)
 * L2 Source: A/641 (2020) §2.2 — Mongolia binding screening eligibility rules
 * Trigger: CXCA.D2 — encounter with a woman in primary-care setting
 *
 * Phase 2 vertical slice: implements the simplest meaningful decision —
 * "Is this client due for HPV screening at age 35?" Subsequent iterations
 * will expand to:
 *   - Age 45 (the second binding age)
 *   - Last screening cycle check (re-screening interval)
 *   - Hysterectomy exclusion
 *   - Cytology-only facility pathway (the 11-age 3-year cycle)
 *   - The four eligibility outcomes mapped to CXCA.D codes DE4–DE7
 */

library CXCAD2DTScreeningEligibilityLogic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter Today Date default Today()

context Patient

/*
 * Client age in years at the encounter date.
 */
define "Client age":
  AgeInYearsAt(Today)

/*
 * Eligibility rule: client is due for HPV screening at age 35.
 *
 * @decision: CXCA.D2 — Cervical cancer screening eligibility
 * @output: CXCA.D#DE4 "Due for HPV screening"
 * @bindingness: legal — the binding regulatory rule
 * @source: A/641 (2020) §2.2 — first binding HPV screening age is 35.
 *   This rule also matches the WHO 2030 elimination strategy's screen-by-35
 *   target, so it serves both the WHO baseline and Mongolia legal positions.
 */
define "Client is due for HPV screening at age 35":
  "Client age" = 35

/*
 * Eligibility rule: client is due for HPV screening at age 30.
 *
 * @decision: CXCA.D2 — Cervical cancer screening eligibility
 * @output: CXCA.D#DE4 "Due for HPV screening"
 * @bindingness: programmatic — Mongolia overlay
 * @source: WHO Mongolia news release, 22 April 2025 — Cervical Cancer
 *   Elimination Programme launch announced "two lifetime tests for women at
 *   ages 30 and 40." This is a programmatic position; no successor MOH order
 *   superseding A/641's 35/45 binding ages has been issued (verified against
 *   moh.gov.mn 2024-2025 orders register; see project memory).
 *
 * This rule co-exists in the same CQL library as the legal rule above —
 * different consumers (PlanDefinitions tagged differently via the
 * cxca-bindingness extension) reference the appropriate define.
 */
define "Client is due for HPV screening at age 30":
  "Client age" = 30
