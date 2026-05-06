// =============================================================================
// FSH wrapper — publishes CXCAD2DTHPVResultRoutingLogic CQL as a Library.
// Source CQL: input/cql/CXCAD2DTHPVResultRoutingLogic.cql
// =============================================================================

Instance:    CXCAD2DTHPVResultRoutingLogic
InstanceOf:  Library
Title:       "CXCAD2DTHPVResultRoutingLogic"
Description: "CQL logic library for routing decisions after an HPV high-risk DNA test result returns. Implements the three-outcome decision tree from A/641 (2020) Fig 2.4: HPV negative → routine; HPV+ with negative cytology → repeat HPV in 12 months; HPV+ with cytology ≥ ASC-US → refer to colposcopy. Source CQL is at input/cql/CXCAD2DTHPVResultRoutingLogic.cql."
Usage:       #definition

* insert LogicLibrary( CXCAD2DTHPVResultRoutingLogic )
