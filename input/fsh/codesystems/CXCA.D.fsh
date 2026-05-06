// =============================================================================
// CXCA.D — Cervical Cancer Screening Data Dictionary
// =============================================================================
// Codes for clinical concepts used in the cervical cancer screening pathway.
// Mirrors the IMMZ.D / IMMZ.Z naming convention from smart-immunizations.
//
// L2 source: A/641 (2020), Mongolia MOH Order — Comprehensive Cervical Cancer
// Surveillance Guideline, Chapter 2 (Prevention & Screening) and Operational
// Instruction 2.1 (Screening leadership and organization).
//
// This file currently contains the minimal set of codes needed to clear the
// IG publisher's "at least one resource" rule and establish the FSH compile
// pipeline for Phase 2. Additional codes will be added incrementally as the
// vertical slice expands.
// =============================================================================

CodeSystem: CXCA_D
Id: CXCA.D
Title: "CXCA Data Dictionary"
Description: "Data elements for the cervical cancer screening Digital Adaptation Kit (DAK). Contains clinical concepts referenced from the screening pathway, recall logic, and pre-cancer management decision tables."

* ^url = "http://smart.who.int/cxca/CodeSystem/CXCA.D"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// -----------------------------------------------------------------------------
// Target ages — A/641 §2.2, binding HPV screening ages
// -----------------------------------------------------------------------------
* #DE1 "Target age 35 for HPV screening" "First binding age at which a woman becomes a target for primary HPV high-risk DNA screening per Mongolia MOH Order A/641 (2020) §2.2 (HPV-test-capable facilities)."
* #DE2 "Target age 45 for HPV screening" "Second binding age at which a woman becomes a target for primary HPV high-risk DNA screening per Mongolia MOH Order A/641 (2020) §2.2 (HPV-test-capable facilities)."

// -----------------------------------------------------------------------------
// Screening tests
// -----------------------------------------------------------------------------
* #DE3 "HPV high-risk DNA test" "A laboratory test that detects high-risk human papillomavirus DNA from a cervical sample. The careHPV test (used in the April 2026 Khan-Uul pilot) is one such platform. Detects 14 high-risk HPV genotypes in pooled form."

// -----------------------------------------------------------------------------
// Eligibility decision outcomes — outputs of the Phase 2 vertical slice
// "Is this woman due for HPV screening today?"
// -----------------------------------------------------------------------------
* #DE4 "Due for HPV screening" "Eligibility outcome: the client meets the criteria to be offered HPV high-risk DNA screening at this encounter."
* #DE5 "Not due — already screened in current cycle" "Eligibility outcome: the client is in the target age range, but has had a recent valid HPV screening result and is not due for re-screening at this encounter."
* #DE6 "Excluded — outside target age range" "Eligibility outcome: the client is not in the binding target age range (per A/641 §2.2). For HPV-test-capable facilities, the binding ages are 35 and 45 only."
* #DE7 "Excluded — prior hysterectomy" "Eligibility outcome: the client has had a hysterectomy for non-cervical-cancer indication with a documented negative post-operative vaginal-smear cytology, and is therefore exempt from cervical cancer screening per A/641 §2.2."

// -----------------------------------------------------------------------------
// Test results — for use in Observation.valueCodeableConcept
// -----------------------------------------------------------------------------
* #DE8 "HPV high-risk positive" "Result: at least one high-risk human papillomavirus genotype detected in the cervical sample."
* #DE9 "HPV high-risk negative" "Result: no high-risk human papillomavirus genotypes detected in the cervical sample."

// -----------------------------------------------------------------------------
// LTFU and cascade-completion outcome codes — for use in ServiceRequest.reasonCode
// when documenting non-occurrence of expected services.
// -----------------------------------------------------------------------------
* #DE10 "Lost to follow-up" "Service was expected (e.g., follow-up cytology after a positive HPV result) but did not occur because the patient could not be contacted or did not return for care. Generic LTFU reason; specific causes (phone disconnected, distance, declined) may be added as sub-codes in future iterations."

// -----------------------------------------------------------------------------
// Additional screening tests
// -----------------------------------------------------------------------------
* #DE13 "Cervical cytology test" "A laboratory test in which cervical cells are collected, stained (Papanicolaou or liquid-based), and examined microscopically. Used as a primary screening test in cytology-only facilities (per A/641 §2.2 cytology pathway) and as a follow-up to a positive HPV result (per A/641 Fig 2.4)."

// -----------------------------------------------------------------------------
// Anamnesis concepts — for use in CXCAD1 (first-encounter intake)
// -----------------------------------------------------------------------------

// HIV status (subset; full HIV status detail will use vendored smart-core profile in later chunk)
* #DE17 "HIV-positive" "Client has a documented positive HIV test or active HIV diagnosis. Per WHO Mongolia, women living with HIV are approximately 6× more likely to develop cervical cancer; HIV+ status is a significant risk modifier for screening intensity and follow-up urgency."
* #DE18 "HIV-negative" "Client has a documented negative HIV test."
* #DE19 "HIV status unknown" "Client's HIV status has not been documented. May warrant offering HIV testing alongside cervical cancer screening."

// Smoking status (per A/641 Op.Inst. 5.1 anamnesis: tobacco use is a risk factor)
* #DE20 "Current smoker" "Client currently smokes tobacco (any amount, any form)."
* #DE21 "Former smoker" "Client has smoked tobacco in the past but has quit."
* #DE22 "Never smoker" "Client has never smoked tobacco."

// Past screening test types (for capturing what kind of screening the client previously had)
* #DE23 "Past screening: HPV high-risk DNA test" "Client's most recent prior cervical cancer screening was an HPV high-risk DNA test."
* #DE24 "Past screening: cytology only" "Client's most recent prior cervical cancer screening was cytology (Pap smear) only."
* #DE25 "Past screening: VIA (visual inspection with acetic acid)" "Client's most recent prior cervical cancer screening was VIA. Note: VIA is used in some low-resource settings; it is not part of the A/641 (2020) Mongolia binding pathway but may appear in client history from prior years or other countries."

// Past screening result categories (broad — finer Bethesda-classification codes added in a later chunk)
* #DE26 "Past screening: normal / negative" "Client's most recent prior screening result was normal / negative for cervical pre-cancer or cancer."
* #DE27 "Past screening: abnormal / positive" "Client's most recent prior screening result was abnormal / positive (any abnormality — finer classification not captured at this level)."
* #DE28 "Past screening: result unknown" "Client recalls having been screened but cannot recall the result, or the result is not in available records."
