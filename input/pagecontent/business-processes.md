A business process is a set of related activities or tasks performed together to achieve the objectives of a health programme area — for example, the cervical cancer screening visit, the recall workflow, the follow-up cascade. Workflows are visual representations of the progression of activities and provide a "story" for the business process being modeled.

This DAK does not currently ship BPMN business-process diagrams. The decision logic and recall logic that would normally be wrapped in a BPMN orchestration are encoded directly as FHIR PlanDefinitions (see [Decision-support Logic](decision-logic.html)) and consumed in their natural integration points (Encounter at chart-open, Periodic batch sweep for recall).

BPMN authoring is deferred to a later iteration. The orchestration that BPMN would document — *first encounter → anamnesis → eligibility → screening order → result handling → recall on timeout* — is implicit in the existing PlanDefinitions and the recall scheduling logic. Concrete BPMN files would help reviewers visualize that orchestration but are not load-bearing for the executable artifacts.

For the methodology rationale, particularly around how the recall scheduling layer pairs with the NotDone pattern, see [Adapting Guidelines for Country Use](adapting.html).
