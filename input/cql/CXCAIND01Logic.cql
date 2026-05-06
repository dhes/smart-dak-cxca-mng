/*
 * Library: CXCAIND01Logic
 * Indicator: Cervical cancer screening coverage at target age 35
 *
 * The percentage of women in the target population who received HPV high-risk
 * DNA screening during the measurement period at the binding target age of 35.
 *
 * L2 Source: A/641 (2020) Annex 2 — coverage metrics framework.
 *   The cxca DAK adapts items 6-8 (Coverage %, Screening attendance %,
 *   Target population coverage) to a per-age stratification.
 *
 * Numerator: Women aged 35 in the measurement period who received an HPV
 *   high-risk DNA screening result during the period.
 * Denominator: Women aged 35 in the measurement period (target population
 *   for HPV screening per A/641 section 2.2).
 *
 * Phase 2 vertical slice — placeholder Initial Population / Denominator /
 * Numerator definitions, mirroring IMMZ's IND12 pattern. Subsequent iterations
 * will:
 *   - Define real cohort (women alive at start of period, aged 35, in jurisdiction)
 *   - Define real numerator (Observation with HPV-screening LOINC code in period)
 *   - Add disaggregation stratifiers (administrative area, age band)
 *   - Reference shared CXCAElements layer for CDS↔eCQM harmonization
 */

library CXCAIND01Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

/*
 * @initialPopulation: Women aged 35 in the measurement period (placeholder — true for Phase 2)
 */
define "Initial Population":
  true

/*
 * @denominator: As defined by Member State (placeholder — true for Phase 2)
 */
define "Denominator":
  true

/*
 * @numerator: Women aged 35 in measurement period with HPV screening event during period (placeholder — true for Phase 2)
 */
define "Numerator":
  true
