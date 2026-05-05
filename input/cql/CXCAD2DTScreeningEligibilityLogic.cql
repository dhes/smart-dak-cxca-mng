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
 * @source: A/641 (2020) §2.2 — first binding HPV screening age is 35
 */
define "Client is due for HPV screening at age 35":
  "Client age" = 35
