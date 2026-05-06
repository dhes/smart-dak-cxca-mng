The decision-support logic encodes A/641 (2020) §2.2 (eligibility), Fig 2.4 (HPV result routing), and §2.3 (recall scheduling) as machine-readable rules with explicit inputs and outputs. The DAK uses CQL (Clinical Quality Language) as the executable representation, packaged as FHIR Library resources and consumed by FHIR PlanDefinition and Measure resources. The xlsx form of the decision tables (the more conventional WHO presentation) is deferred to a future iteration.

The active decision artifacts are:

- **PlanDefinition [`CXCAD2DTScreeningEligibility`](PlanDefinition-CXCAD2DTScreeningEligibility.html)** — full four-outcome HPV-pathway eligibility (legal-binding, A/641 §2.2 ages 35 and 45)
- **PlanDefinition [`CXCAD2DTScreeningEligibility-Cytology`](PlanDefinition-CXCAD2DTScreeningEligibility-Cytology.html)** — sibling for the cytology-only-facility 11-age cycle (legal-binding)
- **PlanDefinition [`CXCAMNGD2DTScreeningEligibility-Programmatic`](PlanDefinition-CXCAMNGD2DTScreeningEligibility-Programmatic.html)** — Mongolia overlay for the April 2025 launch's 30/40 announcement (programmatic)
- **PlanDefinition [`CXCAD2DTHPVResultRouting`](PlanDefinition-CXCAD2DTHPVResultRouting.html)** — three-outcome routing tree per A/641 Fig 2.4
- **PlanDefinition [`CXCAD18SRecallScheduling`](PlanDefinition-CXCAD18SRecallScheduling.html)** — seven timeout-trigger recall rules per A/641 §2.3

All PlanDefinitions reference shared CQL libraries; the [`CXCAElements`](Library-CXCAElements.html) library is the harmonization substrate — both decision-support and quality-measure libraries consume it. See [Adapting Guidelines for Country Use](adapting.html) for the methodology rationale, including the bindingness model that lets the legal and programmatic-overlay PlanDefinitions co-exist.

For the full inventory of CQL Libraries and ActivityDefinitions see the [Artifact Index](artifacts.html).
