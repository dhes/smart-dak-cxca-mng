// =============================================================================
// CXCA.D2.DT.HPVResultRouting — HPV Result Routing PlanDefinition
// =============================================================================
// CDS rule manifest for routing decisions after an HPV high-risk DNA test
// result returns. Implements A/641 (2020) Fig 2.4 routing tree.
//
// Three actions correspond to the three mutually-exclusive outcomes:
//   action[0] — HPV negative → return to routine (guidance only)
//   action[1] — HPV+, cytology negative → repeat HPV in 12 months (guidance only)
//   action[2] — HPV+, cytology ≥ ASC-US → refer to colposcopy (invokes ServiceRequest)
//
// Note: action[1]'s "repeat in 12 months" implies a recall trigger that
// belongs to the recall/scheduling logic layer (Phase 5 chunk 7, deferred).
// For now, action[1] surfaces the recommendation as guidance text only.
// =============================================================================

Instance:    CXCAD2DTHPVResultRouting
InstanceOf:  http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition
Title:       "CXCA.D2.DT — HPV Result Routing"
Description: "Decision support recommendation for routing after an HPV high-risk DNA test result returns. Implements the three-outcome decision tree from Mongolia MOH Order A/641 (2020) Fig 2.4: HPV negative → routine; HPV+ with negative cytology re-read → repeat HPV in 12 months; HPV+ with cytology ≥ ASC-US → refer to colposcopy."
Usage:       #definition

* url       = "http://smart.who.int/cxca/PlanDefinition/CXCAD2DTHPVResultRouting"
* version   = "0.0.1"
* name      = "CXCAD2DTHPVResultRouting"
* status    = #draft
* experimental = false
* publisher = "Dan Heslinga (independent contributor)"

* extension[+].url = "http://smart.who.int/cxca/StructureDefinition/cxca-bindingness"
* extension[=].valueCoding = http://smart.who.int/cxca/CodeSystem/CXCA.Bindingness#legal "Legal — binding regulatory instrument"

* library   = "http://smart.who.int/cxca/Library/CXCAD2DTHPVResultRoutingLogic"

// Action 0 (DE34): HPV negative — return to routine, guidance only
* action[0].title        = "HPV negative — return to routine screening"
* action[0].description  = "HPV high-risk DNA test result is negative. No further investigation indicated. Return the patient to the routine screening cycle per the binding pathway (HPV at next target age, or cytology at next 3-yearly visit)."
* action[0].condition[0].kind                 = #applicability
* action[0].condition[0].expression.language  = #text/cql-identifier
* action[0].condition[0].expression.expression = "Route — HPV negative, return to routine"

// Action 1 (DE35): HPV+ with negative cytology — repeat HPV in 12 months, guidance only
* action[1].title        = "HPV positive, cytology re-read negative — repeat HPV in 12 months"
* action[1].description  = "HPV high-risk DNA test result is positive but the cytology re-read of the saved slide shows no significant abnormality (NILM). Per A/641 Fig 2.4, do not refer to colposcopy at this time. Repeat the HPV test in 12 months. If still positive at the 12-month recheck, the next evaluation will route to colposcopy. (Recall scheduling — Phase 5 chunk 7 deferred.)"
* action[1].condition[0].kind                 = #applicability
* action[1].condition[0].expression.language  = #text/cql-identifier
* action[1].condition[0].expression.expression = "Route — HPV+, cytology negative, repeat HPV in 12 months"

// Action 2 (DE36): HPV+ with cytology ≥ ASC-US — refer to colposcopy via ServiceRequest
* action[2].title        = "HPV positive, cytology ≥ ASC-US — refer to colposcopy"
* action[2].description  = "HPV high-risk DNA test result is positive and the cytology re-read shows ≥ ASC-US (any of ASC-US, ASC-H, LSIL, HSIL per Bethesda 2014). Per A/641 Fig 2.4, refer the patient to colposcopy without delay. Create a proposed ServiceRequest for colposcopy."
* action[2].condition[0].kind                 = #applicability
* action[2].condition[0].expression.language  = #text/cql-identifier
* action[2].condition[0].expression.expression = "Route — HPV+, cytology ≥ ASC-US, refer to colposcopy"
* action[2].definitionCanonical               = "http://smart.who.int/cxca/ActivityDefinition/CXCAD2ColposcopyServiceRequest"
