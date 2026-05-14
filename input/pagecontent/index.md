<!---Note: Please keep the div below in the main branch and when publishing the pre-release version of the DAK (v0.9.9). For official published versions, please delete the div from the file.-->
<div>
<p> This DAK and set of implementation tools are still undergoing development. </p>
<p> Content is for demonstration purposes only. </p>
</div>{:.stu-note}


### Summary

This Implementation Guide is a community contribution to the WHO SMART Guidelines ecosystem covering **cervical cancer screening**. It is structured to be SMART-conformant at the publication boundary (FHIR profiles, CQL libraries, FSH, the CPG/CRMI/SDC/CQF Measures stack) so that downstream tooling and Community of Practice reviewers can consume it on familiar terms. It is **not a WHO publication**.

The DAK uses Mongolia MOH Order A/641 (2020) as a country-adaptation case study to demonstrate four methodology contributions: a **bindingness model** distinguishing legal vs. programmatic vs. operational regulatory positions; a **NotDone pattern** for explicit loss-to-follow-up tracking; a **NotDone-aware cascade-completion eCQM**; and a **lab-capacity-as-selector axis** for facility-conditional eligibility branching. See the [Adapting Guidelines for Country Use](adapting.html) page for the methodology in depth.

### L1 Narrative guidelines

The clinical content in this DAK derives from:

- **Mongolia MOH Order A/641** (2020), *Comprehensive Cervical Cancer Surveillance Guideline* (Cyrillic title: Умайн хүзүүний хорт хавдрын цогц хяналтын заавар), signed 31 December 2020 by Health Minister T. Münkhsaikhan. The legally binding national instrument.
- **WHO 2021** *Guideline for screening and treatment of cervical pre-cancer lesions for cervical cancer prevention*, second edition. The L1 source for global cervical content.
- **WHO Mongolia** news release of 22 April 2025 (Cervical Cancer Elimination Programme launch) and feature story of 16 April 2026 (Khan-Uul HPV-DNA pilot conclusion). Sources for evolving programmatic and operational positions tracked via the bindingness model.

### L2 Operational guidelines

This DAK does not ship a separate xlsx-based L2 publication (the conventional WHO format). Instead, the L2 operational content — data dictionary, decision-support logic, scheduling logic, indicators — is encoded directly in the L3 machine-readable layer (this IG) and surfaced via the following navigation pages:

- [Data Dictionary](dictionary.html) — the `CXCA.D` and `CXCA.Bindingness` CodeSystems
- [Decision-support Logic](decision-logic.html) — the active PlanDefinitions for screening eligibility, HPV result routing, and cytology pathway
- [Scheduling Logic](scheduling-logic.html) — the recall scheduling layer (CXCAD18S, the LTFU-prevention process)
- [Indicators](indicators.html) — the seven active eCQM Measure resources, including the methodology-contribution cascade-completion measure
- [Business Processes](business-processes.html) — workflow framing (BPMN authoring deferred)
- [System Requirements](system-requirements.html) — capability framing (xlsx requirements doc deferred)

### L3 Machine-readable guidelines

**This DAK is the L3 machine-readable representation.** The artifacts (FHIR profiles, CQL libraries, FSH source, PlanDefinitions, ActivityDefinitions, Measures, Questionnaires, LogicalModels) are published in this Implementation Guide. See the [Artifact Index](artifacts.html) for the full inventory or [Adapting Guidelines for Country Use](adapting.html) for the methodology overview.

### L4 Executable guidelines

Reference implementations (executable software hosting the L3 artifacts) are not part of this repository. Implementation work in candidate Open Technologies — particularly Google Open Health Stack on Android FHIR SDK as a candidate L4 host — is being explored separately. See [Reference Implementations](reference-implementations.html).

### L5 Dynamic guidelines

L5 dynamic-knowledge content is out of scope for this DAK.

### Contact Us

Feedback and issues can be submitted via the [GitHub issues page](https://github.com/dhes/smart-dak-cxca-mng/issues) for this DAK.

### License
This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 3.0 IGO License][cc-by].

[![CC BY 3.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by-nc-sa/3.0/igo/
[cc-by-image]: https://i.creativecommons.org/l/by-nc-sa/3.0/igo/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%203.0-lightgrey.svg

For more license details please see the [license page](license.html).

### Providing Feedback
{% include feedback.md %}

<!---Note: Please keep the dsiclaimer note below in the main branch and when publishing the pre-release version of the DAK (v0.9.9). For official published versions, please delete the note from the file.-->
### Disclaimer
The specification herewith documented is a demo working specification and may not be used for any implementation purposes. This draft is provided without warranty of completeness or consistency and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification or its consequences.