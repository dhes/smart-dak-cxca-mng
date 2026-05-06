/*
 * Library: CXCAIND07Logic
 * Indicator: CXCA.IND.07 — Treatment completion rate
 *
 * @numerator: Number of women with positive screening results who received treatment per algorithm during measurement period.
 * @denominator: Number of women with positive screening results in measurement period.
 *
 * L2 Source: A/641 (2020) Annex 2 #12 — "% treated"
 *
 * Companion to CXCAIND02 (cascade completion). Where IND02 measures
 * "% reached cascade resolution" (success or documented LTFU), IND07
 * measures "% reached actual treatment" — a stricter completion bar.
 */

library CXCAIND07Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

define "Initial Population": true
define "Denominator": true
define "Numerator": true
