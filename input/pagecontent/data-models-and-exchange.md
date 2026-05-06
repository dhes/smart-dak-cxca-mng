This section contains the data models and data exchange protocols with actors and transactions defined. It is part of the L3 machine-readable knowledge representation.

The pages included in this section are described below.

- [**System Actors**](system-actors.html) — software or human entities that interact with the system, derived from business requirements at the L2 level.
- [**Sequence Diagrams**](sequence-diagrams.html) — interactions between system actors, derived from business processes at L2.
- [**Transactions**](transactions.html) — system transactions at an atomic level for each actor.
- [**Indicators and Measures**](indicators-measures.html) — the indicators defined in this IG.

### Design notes

The decision logic in this DAK is represented as FHIR PlanDefinition resources conformant to the [CPG-on-FHIR Computable Plan Definition profile](http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition). Each PlanDefinition references one or more CQL Library resources via canonical URL; library content is base64-encoded CQL embedded in the Library resource. PlanDefinition actions reference CQL `define` statements by name in their condition expressions.

Each clinical workflow step that produces an order is represented as an ActivityDefinition (`kind = #ServiceRequest` for screening test orders, `kind = #CommunicationRequest` for recall reminders). PlanDefinition actions invoke ActivityDefinitions via `definitionCanonical`; at runtime, the ActivityDefinition is instantiated into a real FHIR resource (e.g., a `ServiceRequest` for HPV testing with `intent = #proposal`).

The CQL Libraries follow a layered pattern adapted from WHO IMMZ: a shared `CXCAElements` library at the substrate level (consumed by both decision-support and quality-measure libraries — the harmonization point per the McClure paper) and per-decision logic libraries above it. See [Adapting Guidelines for Country Use](adapting.html) for the methodology rationale.

### CodeSystems and value sets

The data dictionary [`CXCA.D`](CodeSystem-CXCA.D.html) is the primary CodeSystem; the bindingness vocabulary [`CXCA.Bindingness`](CodeSystem-CXCA.Bindingness.html) is the second. Where this DAK references concepts that have canonical homes elsewhere (FHIR core code systems, LOINC, SNOMED CT, ICD-10), it does so by URL without re-defining them locally; ConceptMaps bridging local concepts to upstream code systems are deferred to a later iteration.

For the full artifact inventory see the [Artifact Index](artifacts.html).
