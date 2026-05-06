// =============================================================================
// Example: synthetic Patient for the LTFU (Loss to Follow-Up) cascade fixture
// =============================================================================
// Different patient from example-mng-woman-35 (the never-screened scenario).
// This patient: 37 years old, screened with HPV in March 2026, result was
// positive, follow-up cytology never occurred. Models one of the 187 women
// from the April 2026 Khan-Uul pilot LTFU cohort.
//
// Birth date 1989-03-15 places age at 37 on 2026-05-05.
// =============================================================================

Instance:    example-mng-woman-37-ltfu
InstanceOf:  Patient
Title:       "Example: 37-year-old Mongolian woman (LTFU after HPV+)"
Description: "Synthetic patient for the cascade-completion fixture. Was HPV-screened in March 2026 with a positive result; follow-up cytology never occurred. Represents one of the 187 women lost to follow-up in the April 2026 Khan-Uul pilot."
Usage:       #example

* gender    = #female
* birthDate = "1989-03-15"
