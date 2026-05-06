// =============================================================================
// CXCA.D1 — Cervical Cancer Screening Anamnesis (Logical Model)
// =============================================================================
// Data shape for the first-encounter clinical history captured at intake.
// Mirrors the structured anamnesis prescribed by Mongolia MOH Order A/641 (2020)
// Operational Instruction 5.1 (p. 105), which lists the fields a clinician
// must collect before performing the women's specialized exam.
//
// PAIRED ARTIFACTS:
//   - QCXCAD1 Questionnaire (input/fsh/questionnaires/QCXCAD1.fsh) — the
//     form a clinician fills out at intake, with linkIds matching the
//     element names below 1:1.
//   - Future SDC StructureMap will extract the QuestionnaireResponse into
//     FHIR resources (Patient extensions, Observation, Condition, etc.)
//     conforming to vendored smart-core profiles.
//
// METHODOLOGY NOTE:
// This LogicalModel is intentionally comprehensive — it captures everything
// A/641 §5.1 requires. Many of the captured concepts have canonical homes
// in WHO smart-core (HIV status, contraception, sexual history, etc.), but
// the smart-core package is not registered in the FHIR package registry
// as of 2026-05, so we cannot import its profiles via SUSHI dependencies.
// When concrete fixture instances are authored (later Phase 5 chunk),
// selected smart-core profiles will be vendored into input/profiles/ with
// cxca-namespaced canonicals; this LogicalModel's element shapes will
// guide which profiles to vendor.
//
// L2 SOURCE: A/641 (2020) Op.Inst. 5.1, p. 105 — "Information collected from
// client (Дурдатгал авах)".
// =============================================================================

Logical:      CXCAD1
Id:           CXCAD1
Title:        "CXCA.D1 — Cervical Cancer Screening Anamnesis"
Description:  "Logical model for the first-encounter intake / anamnesis used at the start of a cervical cancer screening encounter. Mirrors A/641 (2020) Op.Inst. 5.1 (p. 105). Paired with QCXCAD1 Questionnaire for data capture; the eventual SDC StructureMap will extract a filled-in QuestionnaireResponse into FHIR resources conforming to vendored smart-core profiles."

* ^url = "http://smart.who.int/cxca/StructureDefinition/CXCAD1"
* ^version = "0.0.1"
* ^status = #draft
* ^experimental = false

// ---- Demographics ----
* clientAge 1..1 integer "Client's age in years on the encounter date"
* clientEducation 0..1 string "Client's highest level of education completed (free text in this iteration; may be coded against an ISCED valueset in a future iteration)"

// ---- Reproductive history ----
* numberOfPregnancies 0..1 integer "Number of pregnancies (gravidity), regardless of outcome"
* numberOfBirths 0..1 integer "Number of live births (parity)"
* lastMenstrualPeriod 0..1 date "First day of the client's most recent menstrual period. Drives sample-collection timing — per A/641 Op.Inst. 5.1 §10, samples should not be collected during heavy menstrual flow."
* currentlyPregnant 0..1 boolean "Whether the client is currently pregnant. Pregnant women in the first 3 months may be opportunistically included in screening per A/641 §2.2."
* gestationalAgeWeeks 0..1 integer "If currently pregnant, gestational age in weeks. Required if currentlyPregnant = true."

// ---- Contraception ----
* currentContraception 0..1 string "Description of the client's current contraception method (free text; will bind to a contraception-method valueset when smart-core's medicationstatement-current-contraceptive-methods profile is vendored)"
* pastContraception 0..1 string "Description of past contraception methods used (free text)"

// ---- Sexual history ----
* ageAtFirstSexualContact 0..1 integer "Client's age in years at first sexual contact. Risk factor — earlier age is associated with higher cervical cancer risk."
* ageAtFirstDelivery 0..1 integer "Client's age in years at first delivery (if any). Risk factor."
* numberOfSexualPartners 0..1 integer "Lifetime number of sexual partners. Risk factor."
* hasHadSTI 0..1 boolean "Whether the client has had any sexually transmitted infection. Risk factor."

// ---- HIV ----
* hivStatus 0..1 Coding "Client's HIV status. Bound to CXCA.D codes DE17 (HIV-positive), DE18 (HIV-negative), DE19 (HIV status unknown). Per WHO, WLHIV are 6× more likely to develop cervical cancer."
* currentlyOnART 0..1 boolean "If HIV-positive, whether the client is currently on antiretroviral therapy. Required (per FHIRPath invariant) when hivStatus indicates HIV-positive."

// ---- Past cervical cancer screening ----
* lastScreeningDate 0..1 date "Date of the client's most recent prior cervical cancer screening, if any. Drives the recall-cycle / not-due-in-cycle decision."
* lastScreeningType 0..1 Coding "Type of the most recent prior screening. Bound to CXCA.D codes DE23 (HPV), DE24 (cytology), DE25 (VIA)."
* lastScreeningResult 0..1 Coding "Result category of the most recent prior screening. Bound to CXCA.D codes DE26 (normal), DE27 (abnormal), DE28 (unknown)."

// ---- Hysterectomy history ----
* hadHysterectomy 0..1 boolean "Whether the client has had a hysterectomy. Drives the eligibility-exclusion check per A/641 §2.2."
* hysterectomyForCervicalCancer 0..1 boolean "If hadHysterectomy = true, whether the indication was cervical cancer (in which case the screening exclusion does NOT apply per A/641 §2.2). Required when hadHysterectomy = true."

// ---- Risk-modifying habits ----
* smokingStatus 0..1 Coding "Client's smoking status. Bound to CXCA.D codes DE20 (current), DE21 (former), DE22 (never)."
* alcoholUse 0..1 boolean "Whether the client consumes alcohol regularly. Documented as a risk factor per A/641 §1.3.2."

// ---- Presenting symptoms (cervical-cancer-relevant) ----
* hasPostcoitalBleeding 0..1 boolean "Whether the client reports bleeding after intercourse. May indicate cervical pathology — flag for clinician attention."
* hasIntermenstrualBleeding 0..1 boolean "Whether the client reports bleeding between menstrual periods. May indicate cervical pathology."
* hasUnusualDischarge 0..1 boolean "Whether the client reports unusual vaginal discharge."

// ---- FHIRPath invariants ----
* obeys cxca-d1-pregnant-needs-gestational-age
* obeys cxca-d1-hiv-positive-needs-art-status
* obeys cxca-d1-hysterectomy-needs-indication
* obeys cxca-d1-screening-date-not-future

Invariant:    cxca-d1-pregnant-needs-gestational-age
Description:  "If currentlyPregnant = true, gestationalAgeWeeks must be provided"
Expression:   "currentlyPregnant.empty() or currentlyPregnant = false or gestationalAgeWeeks.exists()"
Severity:     #error

Invariant:    cxca-d1-hiv-positive-needs-art-status
Description:  "If hivStatus indicates HIV-positive (CXCA.D#DE17), currentlyOnART must be provided"
Expression:   "hivStatus.empty() or hivStatus.code != 'DE17' or currentlyOnART.exists()"
Severity:     #error

Invariant:    cxca-d1-hysterectomy-needs-indication
Description:  "If hadHysterectomy = true, hysterectomyForCervicalCancer must be provided"
Expression:   "hadHysterectomy.empty() or hadHysterectomy = false or hysterectomyForCervicalCancer.exists()"
Severity:     #error

Invariant:    cxca-d1-screening-date-not-future
Description:  "Last screening date cannot be in the future"
Expression:   "lastScreeningDate.empty() or lastScreeningDate <= today()"
Severity:     #error
