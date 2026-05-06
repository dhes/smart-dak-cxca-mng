This page lists and describes the human users and digital services that interact with the system, derived from the business requirements defined at the operational level (L2). For more details about end-users and related stakeholders, see the [Generic Personas](personas.html) and the WHO Digital Adaptation Kit for cervical cancer screening.

Systems managing clinical and patient information are expected to interact with a shared health record, laboratory information system or a longitudinal health record, as appropriate, and to synchronize with data collected in a clinical encounter.

For additional actor definitions, see the [Digital Documentation of COVID-19 Certificates (DDCC) Implementation Guide](https://worldhealthorganization.github.io/ddcc/actors.html). Additionally, Integrating the Healthcare Enterprise (IHE) maintains a [repository with common actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) used in IHE profiles.

### Key generic personas interacting with the system 
In the clinical flows, generic personas are represented using profiles of the various entity resources in HL7 FHIR, such as [Patient](http://hl7.org/fhir/patient), [Practitioner](http://hl7.org/fhir/practitioner), [PractitionerRole](http://hl7.org/fhir/practitionerrole), and [RelatedPerson](http://hl7.org/fhir/relatedperson).

This DAK inherits the system-actor personas from [`smart.who.int.base`](http://smart.who.int/base) rather than authoring its own. The applicable system actors for the cervical cancer screening workflow are:

- **`DAK.Persona.System.ClientRegistry`** — the master patient index / client registry
- **`DAK.Persona.System.LIS`** — the Laboratory Information System (Mongolia: National Cancer Center laboratory for HPV-DNA and cytology results)
- **`DAK.Persona.System.EMR`** — the Electronic Medical Record
- **`DAK.Persona.System.HMIS`** — the Health Management Information System (Mongolia: DHIS2 for indicator aggregation)
- **`DAK.Persona.System.SurveillanceSystem`** — for cancer-incidence reporting (CXCA.IND.08)
- **`DAK.Persona.System.InteropPlatform`** — for cross-system data exchange
- **`DAK.Persona.System.LMIS`** — Logistics Management Information System (relevant for HPV test kit supply chain)



  
