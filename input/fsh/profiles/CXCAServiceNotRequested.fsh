// =============================================================================
// CXCAServiceNotRequested — Profile for documenting non-occurrence of expected services
// =============================================================================
// METHODOLOGY CONTRIBUTION:
// This profile materializes the second methodology contribution of the
// smart-dak-cxca DAK: explicit modeling of expected-but-not-occurred clinical
// services. Mirrors the smart-base-clinical sg-servicenotrequested pattern
// (which we cannot subclass directly because who.fhir.core is not a registered
// FHIR package — see project memory).
//
// MOTIVATION:
// The April 2026 Khan-Uul HPV-DNA pilot in Mongolia tested 5,382 women,
// identified 371 HPV-positive results, and successfully obtained follow-up
// cytology from only 184 of them. **187 women (50%) were lost to follow-up.**
// In a vanilla FHIR data system, those 187 women appear as *absence of records*
// — no ServiceRequest, no Observation, no Procedure linked to them after the
// HPV+ result. They are invisible to queries.
//
// With this profile, each of those 187 women would have an explicit
// CXCAServiceNotRequested resource: "follow-up cytology was expected but did
// not occur, here's the reason." Now they're queryable.
//
// CASCADE-COMPLETION ECQM:
// A future eCQM (Phase 5) using this profile can compute "% of HPV+ patients
// whose full cascade reached resolution" — where resolution includes either
// completion (Procedure performed) OR explicit-non-occurrence (this profile).
// Patients who are simply absent from records are *neither* — they fall out
// of both numerator and denominator, accurately reflecting our ignorance
// of their state.
//
// TECHNICAL NOTES:
// FHIR ServiceRequest with status=#revoked and a required reasonCode.
// The intent stays as #order or #plan (the service was originally ordered;
// it's the execution that didn't happen, not the order itself).
// =============================================================================

Profile:    CXCAServiceNotRequested
Parent:     ServiceRequest
Id:         cxca-servicenotrequested
Title:      "CXCA Service Not Requested (NotDone)"
Description: "Profile on ServiceRequest for documenting an expected clinical service that did not occur. Intended for cascade-completion tracking — most prominently for HPV-positive screening results that did not reach follow-up cytology, addressing the loss-to-follow-up problem documented in Mongolia's April 2026 Khan-Uul pilot. Status is fixed to revoked; reasonCode is required to capture why."

* ^url       = "http://smart.who.int/cxca/StructureDefinition/cxca-servicenotrequested"
* ^version   = "0.0.1"
* ^status    = #draft
* ^experimental = false
* ^publisher = "Dan Heslinga (independent contributor)"

// Status fixed to revoked — the service was ordered/planned but withdrawn before completion
* status     = #revoked (exactly)

// Reason for non-occurrence is required — the whole point is to capture why
* reasonCode 1..* MS

// The patient who didn't receive the service
* subject    1..1 MS
