The scheduling logic in this DAK encodes A/641 (2020) §2.3 recall and re-call rules — the timeout-based reminder triggers that drive follow-up after a screening sample is collected, a positive result is entered, a biopsy is received, or a treatment is recommended. The xlsx form of the scheduling table is deferred to a future iteration.

The active scheduling artifacts are:

- **CQL Library [`CXCAD18SRecallSchedulingLogic`](Library-CXCAD18SRecallSchedulingLogic.html)** — seven timeout-trigger defines, one per A/641 §2.3 row (HPV sample timeout 3wk, cytology unread 2wk, positive-result follow-up 4wk, biopsy 4wk, treatment after positive biopsy 4wk, second reminder 4wk, missed scheduled exam immediate)
- **PlanDefinition [`CXCAD18SRecallScheduling`](PlanDefinition-CXCAD18SRecallScheduling.html)** — seven actions, one per timeout trigger, each invoking the same reminder ActivityDefinition with a different reasonCode that identifies which trigger caused the recall
- **ActivityDefinition [`CXCAD18ReminderCommunicationRequest`](ActivityDefinition-CXCAD18ReminderCommunicationRequest.html)** — the recall reminder template (kind = #CommunicationRequest); becomes a phone call, SMS, or outreach-worker visit per the deployment context

The recall scheduling layer is also the **LTFU-prevention process layer** — DE39 (positive-result follow-up timeout, 4 weeks) is the trigger that should fire for each of the 187 women lost to follow-up in the April 2026 Khan-Uul pilot. Recall scheduling and the [NotDone profile](StructureDefinition-cxca-servicenotrequested.html) are the two halves of the LTFU story; recall is the *process* that prevents LTFU, NotDone is the *data shape* that documents it when prevention fails. See [Adapting Guidelines for Country Use](adapting.html) for the methodology rationale.

For the full artifact inventory see the [Artifact Index](artifacts.html).
