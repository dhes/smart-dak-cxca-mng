Security and privacy considerations for cervical cancer screening implementations are not yet documented in this DAK. Authoring is deferred to a later iteration; concrete requirements depend on the deployment context (national screening registry vs. soum-level outreach device vs. centralized HMIS).

Implementation contexts should consider, at minimum: role-based access control for the screening registry, audit logging for any clinician-actioned recommendation (per the recall scheduling layer), encrypted-at-rest storage for the personally-identifiable Patient resources and screening Observations, and consent/disclosure handling for HIV-status data captured in the anamnesis (per the cxca-d1-hiv-positive-needs-art-status invariant on the CXCAD1 LogicalModel).

For the related [Non-functional Requirements](non-functional-requirements.html) and [System Requirements](system-requirements.html) pages see the parents.
