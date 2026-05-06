// =============================================================================
// CXCA.Bindingness — Regulatory bindingness CodeSystem
// =============================================================================
// Codes for tagging cxca DAK artifacts by their regulatory bindingness — the
// degree to which the artifact represents authoritative legal text vs. a
// programmatic announcement vs. an empirically-observed operational reality.
//
// METHODOLOGY CONTRIBUTION:
// This CodeSystem materializes the bindingness model that distinguishes
// three regulatory positions a country adapter may need to encode separately
// when guidelines evolve. The Mongolia case study (April 2025 onward)
// motivated this — A/641 (2020) is legal, the 2025 Cervical Cancer
// Elimination Programme launch announced 30/40 ages programmatically without
// issuing a successor ministerial order, and the April 2026 Khan-Uul pilot
// drifted operationally to ages 40-60 due to low participation. Three
// concurrent positions, one country, all relevant for different consumers.
//
// Tagging artifacts with bindingness lets:
//   * CDS engines filter by what's currently legally binding
//   * Reporting tools distinguish what providers are *required* to do from
//     what programmes are *currently asking* them to do
//   * Auditors trace every recommendation back to its regulatory origin
//   * Country-adapter authors model evolving guidelines without overwriting
//     the binding instrument until it formally changes
// =============================================================================

CodeSystem:  CXCA_Bindingness
Id:          CXCA.Bindingness
Title:       "CXCA Regulatory Bindingness"
Description: "CodeSystem for tagging cervical cancer screening DAK artifacts by their regulatory bindingness. Distinguishes legal/binding instruments from programmatic announcements from empirically-observed operational realities."

* ^url = "http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #legal "Legal — binding regulatory instrument" "The artifact encodes a rule from a legally-binding regulatory instrument (e.g., a signed ministerial order, a national law, an enacted regulation). Providers are required to follow this rule. Example: Mongolia MOH Order A/641 (2020) section 2.2."

* #programmatic "Programmatic — announced position not yet binding" "The artifact encodes a position announced via a national programme, ministerial communication, or strategy document, where the announcement has not (yet) been operationalised as a legally-binding instrument. Providers may be encouraged or guided toward this position but are not legally required to follow it. Example: Mongolia's April 2025 Cervical Cancer Elimination Programme launch announcing HPV screening at ages 30 and 40."

* #operational "Operational — empirically-observed delivery state" "The artifact encodes a rule or threshold that reflects how a programme is *actually being delivered* in the field, regardless of its formal regulatory status. Useful for modelling pilot adjustments, mid-execution age-range expansions, and other operational drifts. Example: Mongolia's April 2026 Khan-Uul pilot, which started at the binding 35–45 ages and was expanded mid-execution to 40–60 due to low participation."
