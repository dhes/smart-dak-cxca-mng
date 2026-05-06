/*
 * Library: CXCAIND06Logic
 * Indicator: CXCA.IND.06 — HPV-positive result rate
 *
 * @numerator: Number of HPV+ results among target-age women screened in measurement period.
 * @denominator: Number of target-age women screened in measurement period.
 *
 * L2 Source: A/641 (2020) Annex 2 #11 — "Positive result %"
 *
 * Outcome metric — tracks the prevalence of HPV positivity in the screened
 * population. Useful for programme planning (capacity for follow-up cytology
 * and colposcopy depends on this rate).
 */

library CXCAIND06Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

define "Initial Population": true
define "Denominator": true
define "Numerator": true
