// =============================================================================
// Example: synthetic Patient for the never-screened-35 fixture
// =============================================================================
// Minimal Patient stub. Vanilla FHIR Patient (no smart-core profile yet — we
// vendor that in Phase 5 along with the SRH profiles for the anamnesis).
//
// Birth date 1991-01-15 places age at 35 on the QuestionnaireResponse's
// authored timestamp of 2026-05-05.
// =============================================================================

Instance:    example-mng-woman-35
InstanceOf:  Patient
Title:       "Example: 35-year-old Mongolian woman"
Description: "Synthetic patient for testing the cervical cancer screening eligibility CDS chain. Never screened, no hysterectomy history. Age computes to 35 on the fixture's encounter date."
Usage:       #example

* gender    = #female
* birthDate = "1991-01-15"
