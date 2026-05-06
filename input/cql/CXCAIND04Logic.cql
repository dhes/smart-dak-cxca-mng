/*
 * Library: CXCAIND04Logic
 * Indicator: CXCA.IND.04 — Cervical cancer screening coverage at age 45
 *
 * @numerator: Number of women aged 45 in measurement period with HPV high-risk DNA screening event during period.
 * @denominator: Number of women aged 45 in measurement period (target population for second binding HPV screening per A/641 §2.2).
 *
 * L2 Source: A/641 (2020) Annex 2 #6 — Coverage %, applied to the second binding age.
 *
 * Companion to CXCAIND01 (coverage at age 35). The two binding ages should
 * be reported as separate indicators per WHO Mongolia's stratified-coverage
 * convention.
 */

library CXCAIND04Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

define "Initial Population": true
define "Denominator": true
define "Numerator": true
