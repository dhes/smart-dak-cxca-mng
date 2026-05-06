## What this DAK is

This Implementation Guide is a community contribution to the WHO SMART Guidelines ecosystem covering **cervical cancer screening**. It is structured to be SMART-conformant at the publication boundary — FHIR profiles, CQL libraries, FSH, the CPG/CRMI/SDC/CQF Measures stack — so that downstream tooling and Community of Practice reviewers can consume it on familiar terms. It is **not a WHO publication**; the publisher field reflects this and the methodology choices are explicitly the author's, not WHO's.

The IG is derived from [`WorldHealthOrganization/smart-dak-empty`](https://github.com/WorldHealthOrganization/smart-dak-empty) (CC BY-IGO 3.0), with attribution preserved in `LICENSE.md`. The clone-then-detach approach was deliberate: this is a derivative work, not a downstream fork tracking the empty starter's evolution. The license is inherited (CC BY-IGO 3.0) via the `SGImplementationGuide` profile constraint from `smart.who.int.base`.

**Scope.** The DAK covers Mongolia MOH Order A/641 (2020) Chapter 2 (Prevention & Screening) in full, Chapter 5 (Pre-cancer diagnosis & treatment) for its algorithmic decisions only, and Chapter 3 (Community engagement & counseling) selectively. Out of scope: Chapter 4 (HPV vaccination — defer to `smart-dak-immz`), Chapter 6 (invasive cancer treatment), Chapter 7 (palliative care), and the narrative-only material from Chapter 1 (epidemiology, anatomy, pathogenesis), which lives in `pagecontent/` rather than as L3 artifacts.

## Framing: the Full-STAC paradigm

The work follows the **Full-STAC remedy** for global digital health transformation articulated by Mehl, Haskew, et al. The framework comprises four open layers, all in service of person-focused health:

| Layer | Definition (Mehl) | Canonical example |
|---|---|---|
| **Open Standards** | Semantic and syntactic models for data representation, exchange, and processing | FHIR, SDC, CQL, ICD-10, SNOMED CT |
| **Open Technologies** | Modular, accessible software tools that collect, store, transmit, and analyze data represented in open standards | Google Open Health Stack (Android FHIR SDK) |
| **Open Architectures** | Documentation, using open standards, of reusable enterprise architecture patterns | OpenHIE Architecture |
| **Open Content** | Public-health, health-system, and clinical knowledge developed against open architectures and standards | WHO SMART Guidelines DAKs |

This Implementation Guide sits in **Open Content** as its primary home, while consuming **Open Standards** (FHIR R4 + the SMART/CPG/CQF/SDC profile family) and being designed against candidate **Open Technologies** (Google Open Health Stack as a candidate L4 implementation host) and candidate **Open Architectures** (OpenHIE as a candidate national-repository pattern).

The Full-STAC framework is jurisdictionally agnostic; real implementation is jurisdictionally specific. This IG layers a **country-adaptation overlay** on top — Mongolia, with MOH Order A/641 (2020) as the binding instrument and the April 2025 Cervical Cancer Elimination Programme launch + April 2026 Khan-Uul HPV-DNA pilot as evolving programmatic and operational positions. The country overlay is treated as a cross-cutting concern through a bindingness model documented below, not as a fifth Full-STAC quadrant.

## Predecessor work studied

The IG was authored after substantive study of existing official WHO smart-dak instances and foundation IGs. The intent was to inherit conventions rather than invent them, and to identify gaps where convention was insufficient for this DAK's needs.

Repositories studied directly:

- **`smart-base`** (canonical: `http://smart.who.int/base`) — the foundation IG that defines the `DAK` resource type, the `SGImplementationGuide` profile, the `SG*` profile family for every common SMART artifact type, the 12 generic DAK Personas (CommunityHealthWorker, HealthcareProvider, Person, etc.), the `CoreDataElement` LogicalModel, and the WHO meta-frameworks (CDHI categories, CDSC, ISCO-08 occupational classification). The foundation; this DAK depends on smart-base@0.2.0.
- **`smart-base-clinical`** (`http://smart.who.int/base-clinical`) — clinical-domain profile layer (24 `sg-*` profiles for Patient, Encounter, Observation, ServiceRequest, Procedure, etc., plus paired `sg-*-NotDone` variants for documenting non-occurrence). Not currently a SUSHI dependency due to a smart-base version-pin mismatch; a future migration path is open.
- **`smart-core`** (`http://fhir.org/guides/who/core`) — cross-DAK shared clinical data element profiles, particularly strong on sexual & reproductive health, contraception, HIV, and gender-based violence. Not registered in the FHIR package registry as of authoring date; selected profiles are planned for **vendoring** (copy-with-attribution into this IG's `input/profiles/`) when the full anamnesis fixtures are authored.
- **`smart-immunizations`** (also published as `smart-dak-immz`) — the most mature SMART DAK and the primary structural reference. The 6-layer CQL stack (Concepts → Common → Elements → DiseaseElements → Encounter/Period wrapper → Logic), the Library/PlanDefinition/ValueSet/Examples FSH structure, the RuleSet macros for boilerplate, and the decision-table letter conventions (D2 = eligibility, D5 = contraindications, D18 = scheduling) all derive from IMMZ.
- **`smart-anc`** (Antenatal Care) — actively maintained women's health peer DAK; useful precedent for intake forms, reproductive history, and age-stratified eligibility. Authored in direct FHIR JSON rather than FSH, illustrating the FSH-vs-direct-FHIR fork in the WHO ecosystem.
- **`smart-dak-empty`** — the official empty-DAK starter from which this IG was derived. Three documented bugs were fixed locally (see `notes/upstream-prs.md` for upstream PR candidates).

Conventions inherited verbatim from these repositories: the `SG*` profile family, the `LogicLibrary` RuleSet macro pattern, the decision-table letter conventions, the `path-pages` parameter convention, the SDC StructureMap extraction pattern (deferred for this DAK), and the publication template. Conventions extended where this DAK required content the predecessors did not address: the bindingness model, the NotDone pattern at the cxca-namespace, the lab-capacity-as-selector axis. These extensions are documented as methodology contributions below.

## CDS/eCQM harmonization (the McClure commitment)

This IG follows the harmonization pattern argued by McClure et al. in *"Igniting Harmonized Digital Clinical Quality Measurement through Terminology, CQL, and FHIR"* (Appl Clin Inform 2020;11:23–33). The paper's central claim:

> The eCQMs intend to use point-of-care electronic data to trigger actions and evaluate adherence to evidence-based guidelines at the individual patient level. Given that we want to improve quality, eCQMs should align with clinical decision support (CDS) applications and address these same care gaps in real time.

The harmonization mechanism McClure identifies is a **shared substrate**: when a CDS rule asks "is this patient due for screening today?" and an eCQM asks "what % of the cohort got screened in the period?", they are asking different *aggregations* of the same underlying clinical fact ("did this patient get screened?"). If both consumers compute that fact independently, they drift, and the population report stops aligning with the per-patient rule that drove care. The fix is to define the underlying fact ONCE in a shared CQL layer and have both consumers reference it by name.

WHO IMMZ realizes this pattern with `IMMZElements` and disease-specific `IMMZD2DTMeasles*Elements` libraries; both decision-table Logic CQL and indicator-measure Logic CQL include the same Elements layer.

This IG mirrors the pattern with `CXCAElements` (`input/cql/CXCAElements.cql`), published as a FHIR Library at `http://smart.who.int/cxca/Library/CXCAElements`. The chunk-8 demonstration realizes one shared define — `Has Had Hysterectomy` — as a real FHIR query against `[Procedure]` filtered by code; the screening eligibility Logic CQL was refactored to consume it (replacing a placeholder Boolean parameter in six places). Migrating the remaining placeholder parameters to CXCAElements is mechanical work, deferred to as-needed iterations.

## Methodology contributions

Four methodology contributions are physically realized as artifacts in this IG. Each addresses a gap in the WHO SMART pattern as observed in the predecessor work studied. The Mongolia case study provides the concrete motivation throughout.

### 1. The bindingness model

**Motivation.** Country adapters working with evolving guidelines face a representational problem the WHO Table 1 model does not address: when a national programme announces a new screening position before issuing a new ministerial order, both positions are "true" simultaneously — one legally binding, the other programmatically advocated. Traditional country-adaptation patterns either overwrite the binding rule (losing the legal anchor) or fork the IG (creating governance fragmentation).

The Mongolia case is the clear example. Mongolia MOH Order A/641 (2020) §2.2 binds HPV screening to ages 35 and 45. The April 2025 Cervical Cancer Elimination Programme launch announced screening at ages 30 and 40. The April 2026 Khan-Uul pilot ran at the binding 35–45 ages and was expanded mid-execution to 40–60 due to low participation. Three concurrent positions; only one (A/641) carries legal force; all three are operationally relevant for different consumers (compliance auditors, programme planners, monitoring & evaluation).

**Mechanism.** A FHIR Extension `cxca-bindingness` (`http://smart.who.int/cxca/StructureDefinition/cxca-bindingness`) tags any PlanDefinition / Library / Measure / ActivityDefinition with a value from the `CXCA.Bindingness` CodeSystem (`legal` | `programmatic` | `operational`). Consumers filter artifacts by tag at query time.

**Realization.** Two PlanDefinitions co-exist in this IG, both referencing the same CXCA D2 screening eligibility CQL Library:

- `CXCAD2DTScreeningEligibility` is tagged `bindingness = legal` and fires on the CQL define `"Client is due for HPV screening (legal binding)"` — the A/641 §2.2 ages 35 and 45 rule.
- `CXCAMNGD2DTScreeningEligibility-Programmatic` is tagged `bindingness = programmatic` and fires on `"Client is due for HPV screening (programmatic)"` — the April 2025 launch's ages 30 and 40 announcement.

Both PlanDefinitions reference the same Library; they differ only in the action condition expression and the bindingness tag. The 2026 Khan-Uul pilot's operational-drift position (40-60) is documented in narrative, not encoded as a third PlanDefinition. Two encoded layers, not three; the choice was deliberate to avoid encoding ephemeral programmatic positions as if they had the standing of binding rules.

**Significance.** Country adapters working downstream of this DAK can author programmatic-overlay artifacts without overwriting the binding instrument. CDS engines query for "currently legally binding rules" and get the legal-tagged PlanDefinitions; programme dashboards query for "programmatic positions" and get the overlay artifacts. The binding instrument remains queryable, citable, and auditable while the country also surfaces what its programme is currently advocating.

### 2. The NotDone pattern for loss-to-follow-up

**Motivation.** The April 2026 Khan-Uul HPV-DNA pilot in Mongolia tested 5,382 women, identified 371 HPV-positive results, and successfully obtained follow-up cytology from 184 of them. **187 women — approximately 50 percent — were lost to follow-up.** In a vanilla FHIR data system, those 187 women appear as *absence of records*: no ServiceRequest, no Observation, no Procedure linked to them after the HPV+ result. They are invisible to queries.

This is not a Mongolia-specific problem. Cascade-completion failures in cervical cancer screening are documented across LMICs. Without an explicit data-shape pattern for non-occurrence, programme managers cannot distinguish "we know this patient did not get follow-up" from "we have no record of what happened to this patient" — which produces both under-reporting of effort and over-reporting of certainty.

**Mechanism.** A FHIR profile `CXCAServiceNotRequested` (`http://smart.who.int/cxca/StructureDefinition/cxca-servicenotrequested`) constrains `ServiceRequest` with `status` fixed to `revoked` and `reasonCode` required (must support). The profile mirrors `smart-base-clinical`'s `sg-servicenotrequested` pattern (which this IG cannot subclass directly because `who.fhir.core` is not a registered FHIR package; the pattern is therefore re-realized at the cxca namespace).

**Realization.** A fixture in `input/fsh/examples/Example.ServiceRequest.NotRequested.LTFU37.fsh` instantiates the profile concretely: a synthetic Mongolian woman with a March 2026 HPV+ Observation and a paired ServiceRequest using `CXCAServiceNotRequested`, recording that the expected follow-up cytology did not occur because the patient could not be reached at the phone number on file. One of the 187 LTFU cases from the Khan-Uul pilot, modeled.

**Significance.** With this profile applied, the 187 women become explicit records of non-occurrence — queryable by reason, reportable in indicators, distinguishable from absent records. The cascade-completion eCQM described next uses this profile as its data substrate.

### 3. The cascade-completion eCQM

**Motivation.** A vanilla cascade measure for HPV+ follow-up reports a single number: *cytology completed / HPV positive*. For the Khan-Uul pilot this would be 184/371 ≈ 49.6 percent. The number conflates "47 percent confirmed not followed up" with "0 percent unknown" — programme managers see an apparent follow-up gap but cannot tell whether the gap reflects system failure, patient choice, or absent records.

**Mechanism.** `CXCAIND02CascadeCompletionLogic` is a FHIR Measure with proportion scoring and four populations: Initial Population, Denominator (HPV+ in period), Numerator (HPV+ AND (cytology completed OR documented LTFU)), and **Numerator Exclusion** (HPV+ AND documented LTFU AND no completed cytology). The Numerator Exclusion is the methodology trick — FHIR Measure semantics subtract it from the Numerator when computing the proportion, which lets one Measure resource expose three computable views simultaneously.

**Realization.** With the NotDone profile applied to all 187 LTFU women from the Khan-Uul pilot, the same data computes:

- **Cascade resolution rate** = Numerator / Denominator = 371/371 = 100 percent
- **True follow-up rate** = (Numerator − NumeratorExclusion) / Denominator = 184/371 ≈ 49.6 percent
- **Documented LTFU rate** = NumeratorExclusion / Denominator = 187/371 ≈ 50.4 percent

Plus (Denominator − Numerator) reveals the visibility gap: patients whose state is unknown. In the Khan-Uul case this is 0 (all 371 patients have either completed cytology or a documented non-occurrence record). In a real implementation without the NotDone profile, this same partition would surface the absent-records cohort as a fourth value, making the visibility gap measurable rather than hidden.

**Significance.** The methodology improvement is not in any single number, but in the partition. Programme managers who currently see "49.6 percent follow-up" learn from this measure that they have **a 50 percent LTFU sub-rate**, not a 50 percent invisible cohort — which is a qualitatively different programme problem to address.

### 4. Lab-capacity-as-selector axis

**Motivation.** A/641 §2.2 binds two different age cycles for cervical cancer screening, one of which applies depending on whether the client's primary-care facility has HPV-DNA testing capability:

- HPV-test-capable facilities: women aged 35 and 45 (two lifetime tests)
- Cytology-only facilities: women at 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60 (3-year cycle)

The same legally binding instrument; same country; the eligibility branch depends on a property of the *facility*, not the patient. WHO IMMZ has no analog for this branching pattern because immunizations do not fork by facility lab capability.

**Mechanism.** A CQL parameter `FacilityHasHPVCapability` (`true | false`) selects the pathway. Two PlanDefinitions sit as siblings, both tagged `bindingness = legal` and both referencing the same Library:

- `CXCAD2DTScreeningEligibility` fires on the HPV-pathway define when `FacilityHasHPVCapability = true`
- `CXCAD2DTScreeningEligibility-Cytology` fires on the cytology-pathway define when `FacilityHasHPVCapability = false`

Each invokes a different ServiceRequest ActivityDefinition (`CXCAD2HPVScreeningServiceRequest` or `CXCAD2CytologyScreeningServiceRequest`).

**Significance.** Any country with mixed-capability primary-care facilities — which is most LMICs running cervical cancer screening programmes — needs this axis. WHO Table 1 does not represent it; this DAK shows that representation can be done within the WHO SMART pattern by adding lab-capacity as a CQL parameter and authoring sibling PlanDefinitions, both legally binding.

## Reading the artifacts

The IG follows WHO SMART conventions for file layout. Authors looking to use, review, or extend this DAK should know the following.

**Top-level structure.** The repository is a fork of `smart-dak-empty` with the standard `input/` directory layout: `input/fsh/` for FSH source, `input/cql/` for CQL source, `input/profiles/` for direct-FHIR JSON profiles (vendored from upstream when needed), `input/pagecontent/` for narrative pages including this one, `input/fsh/examples/` for QuestionnaireResponse and other example fixtures.

**Naming conventions.** All cxca-baseline artifacts carry the `CXCA` prefix. Mongolia-overlay artifacts carry `CXCAMNG`. Decision-table letters reuse the IMMZ convention where meaning aligns: `D1` = anamnesis (capture client history), `D2` = eligibility decision, `D5` = contraindications/exclusions, `D18` = scheduling/recall. Bindingness-distinguished artifacts use ID suffixes (`-Programmatic`, `-Operational`); the absence of a suffix implies legal/binding.

**Where to find what.**

| Concern | Files |
|---|---|
| Data dictionary (codes for clinical concepts) | `input/fsh/codesystems/CXCA.D.fsh` |
| Bindingness vocabulary | `input/fsh/codesystems/CXCA.Bindingness.fsh` |
| LogicalModels (data shapes) | `input/fsh/models/CXCAD1.fsh` (anamnesis), `CXCAD2.fsh` (eligibility) |
| Questionnaires (data capture forms) | `input/fsh/questionnaires/QCXCAD1.fsh`, `QCXCAD2.fsh` |
| CQL decision logic | `input/cql/CXCAD2DTScreeningEligibilityLogic.cql`, `CXCAD2DTHPVResultRoutingLogic.cql`, `CXCAD18SRecallSchedulingLogic.cql` |
| Shared CQL substrate | `input/cql/CXCAElements.cql` |
| eCQM Logic libraries | `input/cql/CXCAIND0*Logic.cql` |
| FSH Library wrappers | `input/fsh/libraries/*.fsh` |
| PlanDefinitions (CDS rule manifests) | `input/fsh/plandefinitions/*.fsh` |
| ActivityDefinitions (order templates) | `input/fsh/activitydefinitions/*.fsh` |
| eCQM Measures | `input/fsh/measures/CXCAIND0*.fsh` |
| Profiles (notably the NotDone profile) | `input/fsh/profiles/CXCAServiceNotRequested.fsh` |
| Extension definitions | `input/fsh/extensions/cxca-bindingness.fsh` |
| Example fixtures | `input/fsh/examples/Example.*.fsh` |

**Build instructions.** The IG uses the standard `_genonce.sh` pattern from smart-dak-empty. Authors who maintain a centralized FHIR IG Publisher jar (recommended hygiene, given the jar's ~225 MB size) should symlink it into `input-cache/publisher.jar`; the script's resolution order picks it up there first. The `.gitignore` excludes `/input-cache` so the symlink does not enter version control.

**Adapting this DAK to another country.** The Mongolia overlay (`CXCAMNG*` artifacts) demonstrates the pattern; a different country adapter would author parallel `CXCA<ISO>*` artifacts at the analogous layer, applying the `cxca-bindingness` extension as appropriate. The shared `CXCA*` baseline does not need modification for country adaptation; it is the CXCAMNG-namespaced overlay that carries country-specific content.

## What's done, what's deferred, what's open

**Done (43 FHIR resources at this writing):**

- Vertical slice — end-to-end CDS for the simplest meaningful eligibility decision, paired eCQM, fixture
- Bindingness model materialized in CodeSystem, ValueSet, Extension, and one programmatic overlay PlanDefinition
- NotDone profile and LTFU fixture
- Full eligibility tree (four outcomes, both binding ages); cascade-completion eCQM with NumeratorExclusion partitioning; full CXCAD1 anamnesis LogicalModel and Questionnaire; cytology-pathway sibling PlanDefinition; HPV result routing decision tree; six A/641 Annex 2 indicators; recall scheduling with seven timeout triggers; shared CXCAElements CQL layer with one library refactored to consume it

**Deferred (mechanical or scope-bounded):**

- Migration of remaining placeholder Boolean parameters in CQL to the shared CXCAElements layer (mechanical; pattern established)
- Vendoring of selected smart-core SRH profiles into `input/profiles/` for full anamnesis fixtures
- Deeper Fig 2.4 routing decisions (colposcopy → biopsy → CIN routing)
- ConceptMaps bridging Mongolia MOH form codes (ЭИМ-5а..е) to cxca canonical artifacts
- SDC StructureMap targets on Questionnaires for QuestionnaireResponse → LogicalModel extraction
- Additional Annex 2 indicators (IND05 cytology cycle coverage, IND09 first-time-screening level, IND10/11 raw counts, IND14 cancer-suspected care completion)

**Open (awaiting external input or governance decisions):**

- Whether the Mongolia MOH has issued any non-order instrument (албан бичиг — official letter rather than ministerial order) bridging A/641 to the April 2025 launch's 30/40 programmatic position. This would not appear in moh.gov.mn's orders register but would matter for what providers are actually being told to do.
- Whether the WHO L3 SOP exists as a referenceable document (mentioned in `smart-example-immz` but not located in any examined repository).
- The smart-base / smart-base-clinical version-pin reconciliation that would let this DAK depend on smart-base-clinical and inherit the `sg-*-NotDone` profile family directly rather than re-realizing the pattern locally.
- Four upstream-PR candidates against `smart-dak-empty` and `smart-base` are tracked in `notes/upstream-prs.md`.

## References

The anchor references for the framing and methodology choices documented above:

- **Mehl, Haskew, et al.** *A full-STAC remedy for global digital health transformation*. The four-quadrant framework adopted for the framing section above.
- **McClure et al. 2020.** *Igniting Harmonized Digital Clinical Quality Measurement through Terminology, CQL, and FHIR*. Appl Clin Inform 11:23–33. The harmonization commitment.
- **Mongolia Ministry of Health.** *Comprehensive Cervical Cancer Surveillance Guideline*, Ministerial Order A/641, 31 December 2020. The legally binding instrument the country-overlay artifacts encode.
- **WHO Mongolia.** *Mongolia launches national programme to eliminate cervical cancer*, news release, 22 April 2025. The April 2025 programmatic position (HPV at ages 30 and 40).
- **WHO Mongolia.** *MOH and WHO concludes pilot on HPV testing for cervical cancer screening in Mongolia*, feature story, 16 April 2026. The April 2026 Khan-Uul pilot operational realities, including the 5,382 / 371 / 184 / 187 cascade numbers.
- **UNFPA Asia-Pacific Regional Office & Cancer Council NSW.** *Mongolia: Cervical Cancer Elimination — Country Review & Roadmap for Action*, January 2022. The analytical groundwork that fed the April 2025 launch.
