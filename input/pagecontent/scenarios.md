User scenarios in this DAK are realized as **example fixtures** — synthetic patient data that exercises the decision logic end-to-end. Authors and reviewers use these fixtures to verify the CDS chain (LogicalModel → Questionnaire → CQL → PlanDefinition → ActivityDefinition) produces the expected outcomes.

The active scenario fixtures are:

- **First-encounter, never-screened** — [`example-mng-woman-35`](Patient-example-mng-woman-35.html) (a 35-year-old Mongolian woman) with [`Example.CXCAD2.QuestionnaireResponse.NeverScreened35`](QuestionnaireResponse-Example.CXCAD2.QuestionnaireResponse.NeverScreened35.html). Demonstrates the eligibility decision firing the "Due for HPV screening" outcome.
- **Loss-to-follow-up after HPV+** — [`example-mng-woman-37-ltfu`](Patient-example-mng-woman-37-ltfu.html) (a 37-year-old Mongolian woman) with [an HPV+ Observation](Observation-example-observation-hpv-positive-ltfu37.html) and a [paired ServiceRequest documenting non-occurrence](ServiceRequest-example-servicerequest-notrequested-ltfu37.html) using the [`CXCAServiceNotRequested`](StructureDefinition-cxca-servicenotrequested.html) profile. Models one of the 187 LTFU women from the April 2026 Khan-Uul pilot.

Additional scenarios (full anamnesis fixtures, hysterectomy-excluded, cytology-pathway client, HPV+ with cytology re-read positive routing to colposcopy, etc.) are deferred to later iterations as the corresponding artifacts mature.

For the methodology rationale linking these scenarios to the bindingness model and the NotDone pattern, see [Adapting Guidelines for Country Use](adapting.html).
