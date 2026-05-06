/*
 * Library: CXCAIND08Logic
 * Indicator: CXCA.IND.08 — New cervical cancer cases by age (continuous-variable measure)
 *
 * @numerator: Number of new cervical cancer diagnoses (ICD-10 C53.0–C53.9 or D06) in the measurement period.
 *
 * L2 Source: A/641 (2020) Annex 2 #13 — "Number of new cervical cancer cases by age"
 *
 * Differs from the proportion measures above — this is a continuous-variable
 * (count) measure rather than a numerator/denominator proportion. Stratified
 * by 5-year age bands when concrete CQL queries are wired (chunk 8).
 *
 * Useful for incidence trend monitoring and for comparing pre/post
 * elimination-programme effects (the WHO Mongolia April 2025 launch projects
 * a 22.4% rise by 2030 without intervention; this indicator tracks against
 * that projection).
 */

library CXCAIND08Logic version '0.0.1'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

parameter "Measurement Period" Interval<Date> default Interval[@2026-01-01, @2026-12-31]

context Patient

define "Initial Population": true

/*
 * @measurePopulation: cervical cancer cases (continuous variable scoring)
 */
define "Measure Population":
  true

/*
 * @measureObservation: count of cervical cancer cases per patient in initial population
 */
define "Cancer Case Count": 0
