/*
 * Library: CXCAIND03Logic
 * Indicator: CXCA.IND.03 — Invitation attendance rate
 *
 * @numerator: Number of invited target-age women who attended for screening within the measurement period.
 * @denominator: Number of target-age women invited within the measurement period.
 *
 * L2 Source: A/641 (2020) Annex 2 #4 — "% of invited women who attended"
 *
 * Phase 5 placeholder; real implementation will query for invitation records
 * (e.g., Mongolian form ЭИМ-5а) and matched encounters via the shared
 * CXCAElements layer (chunk 8).
 */

library CXCAIND03Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

define "Initial Population": true
define "Denominator": true
define "Numerator": true
