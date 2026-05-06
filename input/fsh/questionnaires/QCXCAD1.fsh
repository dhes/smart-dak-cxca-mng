// =============================================================================
// QCXCAD1 — Cervical Cancer Screening Anamnesis (Questionnaire)
// =============================================================================
// Paired with CXCAD1 LogicalModel (input/fsh/models/CXCAD1.fsh).
// linkId values match CXCAD1 element names 1:1 so an SDC-extraction
// StructureMap can be authored mechanically.
//
// This is the form an outreach worker, midwife, or primary-care clinician
// fills out at the start of a cervical cancer screening encounter — the
// digital equivalent of the structured intake prescribed by Mongolia MOH
// Order A/641 (2020) Op.Inst. 5.1 (p. 105).
//
// Phase 5 chunk 3 — minimal item-set covering all CXCAD1 fields. Future
// iterations will:
//   * Add `enableWhen` rules so dependent items only display when relevant
//     (e.g., gestationalAgeWeeks shown only if currentlyPregnant = true)
//   * Add SDC StructureMap target extension for QuestionnaireResponse → CXCAD1 extraction
//   * Bind item answers to value sets where applicable
//   * Subclass SGQuestionnaire for SMART conformance
//   * Add Mongolian (mn) translations for use in remote outreach contexts
// =============================================================================

Instance:    QCXCAD1
InstanceOf:  Questionnaire
Title:       "QCXCAD1 — Cervical Cancer Screening Anamnesis"
Description: "Questionnaire that captures the cervical cancer screening anamnesis required by Mongolia MOH Order A/641 (2020) Op.Inst. 5.1. Paired with CXCAD1 LogicalModel; linkId values match LogicalModel element names so a StructureMap-based extraction can be authored mechanically."
Usage:       #definition

* url       = "http://smart.who.int/cxca/Questionnaire/QCXCAD1"
* version   = "0.0.1"
* status    = #draft
* experimental = false
* subjectType = #Patient
* language  = #en

// ---- Demographics ----
* item[+].linkId   = "clientAge"
* item[=].text     = "Client's age in years on the encounter date"
* item[=].type     = #integer
* item[=].required = true

* item[+].linkId   = "clientEducation"
* item[=].text     = "Highest level of education completed"
* item[=].type     = #string
* item[=].required = false

// ---- Reproductive history ----
* item[+].linkId   = "numberOfPregnancies"
* item[=].text     = "Total number of pregnancies (any outcome)"
* item[=].type     = #integer
* item[=].required = false

* item[+].linkId   = "numberOfBirths"
* item[=].text     = "Number of live births"
* item[=].type     = #integer
* item[=].required = false

* item[+].linkId   = "lastMenstrualPeriod"
* item[=].text     = "First day of the client's most recent menstrual period"
* item[=].type     = #date
* item[=].required = false

* item[+].linkId   = "currentlyPregnant"
* item[=].text     = "Is the client currently pregnant?"
* item[=].type     = #boolean
* item[=].required = false

* item[+].linkId   = "gestationalAgeWeeks"
* item[=].text     = "If currently pregnant, gestational age in weeks"
* item[=].type     = #integer
* item[=].required = false
* item[=].enableWhen[0].question = "currentlyPregnant"
* item[=].enableWhen[0].operator = #=
* item[=].enableWhen[0].answerBoolean = true

// ---- Contraception ----
* item[+].linkId   = "currentContraception"
* item[=].text     = "Current contraception method"
* item[=].type     = #string
* item[=].required = false

* item[+].linkId   = "pastContraception"
* item[=].text     = "Past contraception methods used"
* item[=].type     = #string
* item[=].required = false

// ---- Sexual history ----
* item[+].linkId   = "ageAtFirstSexualContact"
* item[=].text     = "Age at first sexual contact"
* item[=].type     = #integer
* item[=].required = false

* item[+].linkId   = "ageAtFirstDelivery"
* item[=].text     = "Age at first delivery (if any)"
* item[=].type     = #integer
* item[=].required = false

* item[+].linkId   = "numberOfSexualPartners"
* item[=].text     = "Lifetime number of sexual partners"
* item[=].type     = #integer
* item[=].required = false

* item[+].linkId   = "hasHadSTI"
* item[=].text     = "Has the client ever had a sexually transmitted infection?"
* item[=].type     = #boolean
* item[=].required = false

// ---- HIV ----
* item[+].linkId   = "hivStatus"
* item[=].text     = "HIV status"
* item[=].type     = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE17 "HIV-positive"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE18 "HIV-negative"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE19 "HIV status unknown"

* item[+].linkId   = "currentlyOnART"
* item[=].text     = "If HIV-positive, currently on antiretroviral therapy?"
* item[=].type     = #boolean
* item[=].required = false
* item[=].enableWhen[0].question = "hivStatus"
* item[=].enableWhen[0].operator = #=
* item[=].enableWhen[0].answerCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE17

// ---- Past cervical cancer screening ----
* item[+].linkId   = "lastScreeningDate"
* item[=].text     = "Date of most recent prior cervical cancer screening (leave blank if never)"
* item[=].type     = #date
* item[=].required = false

* item[+].linkId   = "lastScreeningType"
* item[=].text     = "Type of most recent prior screening"
* item[=].type     = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE23 "Past screening: HPV high-risk DNA test"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE24 "Past screening: cytology only"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE25 "Past screening: VIA (visual inspection with acetic acid)"

* item[+].linkId   = "lastScreeningResult"
* item[=].text     = "Result category of most recent prior screening"
* item[=].type     = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE26 "Past screening: normal / negative"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE27 "Past screening: abnormal / positive"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE28 "Past screening: result unknown"

// ---- Hysterectomy history ----
* item[+].linkId   = "hadHysterectomy"
* item[=].text     = "Has the client had a hysterectomy?"
* item[=].type     = #boolean
* item[=].required = false

* item[+].linkId   = "hysterectomyForCervicalCancer"
* item[=].text     = "If yes, was the hysterectomy for cervical cancer?"
* item[=].type     = #boolean
* item[=].required = false
* item[=].enableWhen[0].question = "hadHysterectomy"
* item[=].enableWhen[0].operator = #=
* item[=].enableWhen[0].answerBoolean = true

// ---- Risk-modifying habits ----
* item[+].linkId   = "smokingStatus"
* item[=].text     = "Smoking status"
* item[=].type     = #choice
* item[=].required = false
* item[=].answerOption[0].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE20 "Current smoker"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE21 "Former smoker"
* item[=].answerOption[+].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.D#DE22 "Never smoker"

* item[+].linkId   = "alcoholUse"
* item[=].text     = "Does the client consume alcohol regularly?"
* item[=].type     = #boolean
* item[=].required = false

// ---- Presenting symptoms ----
* item[+].linkId   = "hasPostcoitalBleeding"
* item[=].text     = "Bleeding after intercourse?"
* item[=].type     = #boolean
* item[=].required = false

* item[+].linkId   = "hasIntermenstrualBleeding"
* item[=].text     = "Bleeding between menstrual periods?"
* item[=].type     = #boolean
* item[=].required = false

* item[+].linkId   = "hasUnusualDischarge"
* item[=].text     = "Unusual vaginal discharge?"
* item[=].type     = #boolean
* item[=].required = false
