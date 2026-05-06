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

// -----------------------------------------------------------------------------
// Bethesda 2014 cytology categories — A/641 Annex 5; standard system used
// in cytology re-read after a positive HPV result (per Fig 2.4 routing tree)
// -----------------------------------------------------------------------------
* #DE29 "Cytology: NILM (negative for intraepithelial lesion or malignancy)" "Bethesda 2014 NILM. Cytology shows no evidence of pre-cancerous or cancerous change. In the HPV+ pathway this returns the patient to a 1-year repeat HPV cycle per A/641 Fig 2.4."
* #DE30 "Cytology: ASC-US (atypical squamous cells of undetermined significance)" "Bethesda 2014 ASC-US. Atypical squamous cells of undetermined significance. Triggers colposcopy referral in the HPV+ pathway per A/641 Fig 2.4."
* #DE31 "Cytology: ASC-H (atypical squamous cells, cannot exclude HSIL)" "Bethesda 2014 ASC-H. Atypical squamous cells where high-grade squamous intraepithelial lesion (HSIL) cannot be excluded. Triggers colposcopy referral."
* #DE32 "Cytology: LSIL (low-grade squamous intraepithelial lesion)" "Bethesda 2014 LSIL. Low-grade squamous intraepithelial lesion (corresponds to histologic CIN1). Triggers colposcopy referral in the HPV+ pathway."
* #DE33 "Cytology: HSIL (high-grade squamous intraepithelial lesion)" "Bethesda 2014 HSIL. High-grade squamous intraepithelial lesion (corresponds to histologic CIN2 or CIN3). Triggers colposcopy referral with priority."

// -----------------------------------------------------------------------------
// Routing-outcome codes — outputs of the result-routing decision tables.
// What the system should do next given a particular result combination.
// -----------------------------------------------------------------------------
* #DE34 "Route: return to routine screening" "Routing decision output: no abnormality detected; return the patient to the routine screening cycle per the binding pathway (HPV at 35/45 or cytology at the 11-age cycle)."
* #DE35 "Route: repeat HPV test in 12 months" "Routing decision output: HPV+ with negative cytology re-read; repeat the HPV test in 12 months per A/641 Fig 2.4."
* #DE36 "Route: refer to colposcopy" "Routing decision output: HPV+ with cytology ≥ ASC-US, OR HPV+ at 12-month recheck; refer to colposcopy per Op.Inst. 5.6."

// -----------------------------------------------------------------------------
// Additional clinical procedures (for ActivityDefinition order codes)
// -----------------------------------------------------------------------------
* #DE37 "Colposcopy" "A diagnostic procedure in which the cervix is examined under magnification (typically with acetic acid application) to identify lesions for biopsy. Per A/641 Op.Inst. 5.6."

// -----------------------------------------------------------------------------
// Recall reasons — A/641 §2.3 timeout-based reminder triggers
// Used as the reasonCode on the CommunicationRequest issued by the
// CXCAD18SRecallScheduling PlanDefinition.
// -----------------------------------------------------------------------------
* #DE38 "Recall: HPV sample result timeout (3 weeks)" "Recall trigger: an HPV sample was dispatched to the lab more than 3 weeks ago and no result has been entered into the registry. Per A/641 §2.3, this triggers a reminder to follow up with the lab and (if the result is in but not yet entered) the entering staff."
* #DE39 "Recall: positive result follow-up timeout (4 weeks)" "Recall trigger: a positive screening result was entered into the registry more than 4 weeks ago and no follow-up examination has been recorded. Per A/641 §2.3, this triggers a reminder to the patient and the obstetrician-gynaecologist."
* #DE40 "Recall: biopsy result timeout (4 weeks)" "Recall trigger: a biopsy sample was received at the lab more than 4 weeks ago and no histopathology result has been entered. Per A/641 §2.3."
* #DE41 "Recall: treatment timeout after positive biopsy (4 weeks)" "Recall trigger: a positive biopsy result has been entered for more than 4 weeks and no treatment record exists. Per A/641 §2.3."
* #DE42 "Recall: cytology slide unread timeout (2 weeks)" "Recall trigger: a cytology slide was received at the lab more than 2 weeks ago and no cytologist conclusion has been entered. Per A/641 §2.3."
* #DE43 "Recall: second reminder (4 weeks after first)" "Recall trigger: a first reminder was sent more than 4 weeks ago and the underlying gap remains unresolved. Per A/641 §2.3 a second reminder should issue."
* #DE44 "Recall: missed scheduled examination" "Recall trigger: the patient had a scheduled examination that they did not attend. Per A/641 §2.3, immediate flag — does not wait for a timeout."

// -----------------------------------------------------------------------------
// Surgical procedures (for use as Procedure.code when querying patient history)
// -----------------------------------------------------------------------------
* #DE45 "Hysterectomy" "Surgical removal of the uterus. The cervical-cancer-screening exclusion in A/641 §2.2 applies only when the hysterectomy was for a non-cervical-cancer indication and the post-operative vaginal-smear cytology was negative."
