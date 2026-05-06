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

This DAK is a community contribution and is not (yet) published in the WHO IRIS catalogue. The repository and implementation tools are available at the project repository.

- Implementation tools:

   - [Link to the editable files of business processes, in .bpmn format](https://smart.who.int/dak-cxca/business-processes.html)
   
   - [Link to core data dictionary](https://smart.who.int/dak-cxca/dictionary.html)
 
   - [Link to decision support logic](https://smart.who.int/dak-cxca/decision-logic.html) 

   - [Link to scheduling logic](https://smart.who.int/dak-cxca/scheduling-logic.html)

   - [Link to indicators table](https://smart.who.int/dak-cxca/indicators.html)
 
   - [Link to functional and non functional requirements](https://smart.who.int/dak-cxca/system-requirements.html)

   

### L3 Machine readable guidelines
The L3 FHIR Implementation Guide for the cervical cancer screening SMART Guidelines is yet to be published. Links will be published here as soon as they're available.

### L4 Executable guidelines
Reference implementations representing the L4 layer for the cervical cancer screening SMART Guidelines are not yet available. Links will be published here as soon as they're available.

### L5 Dynamic guidelines
Content representing the L5 layer for the cervical cancer screening SMART Guidelines are not yet available. Links will be published here as soon as they're available.

### Contact Us

Feedback and issues can be submitted via the [GitHub issues page](https://github.com/dhes/smart-dak-cxca/issues) for this DAK.

### License
This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 3.0 IGO License][cc-by].

[![CC BY 3.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by-nc-sa/3.0/igo/
[cc-by-image]: https://i.creativecommons.org/l/by-nc-sa/3.0/igo/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%203.0-lightgrey.svg

For more license details please see the [license page](https://smart.who.int/dak-cxca/license.html).

### Providing Feedback
{% include feedback.md %}

<!---Note: Please keep the dsiclaimer note below in the main branch and when publishing the pre-release version of the DAK (v0.9.9). For official published versions, please delete the note from the file.-->
### Disclaimer
The specification herewith documented is a demo working specification and may not be used for any implementation purposes. This draft is provided without warranty of completeness or consistency and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification or its consequences.