# L1 Source Layer — Mongolia A/641 (2020)

This directory contains a **structured side-by-side translation** of the
L2-relevant sections of MOH Order A/641 (2020), the legally-binding
ministerial order on cervical cancer surveillance in Mongolia.

The L1 layer (Layer 1 in the WHO SMART Guidelines model) is the narrative
and tabular source-of-truth that the L2 representation
(`smart-dak-cxca/input/L2/cervical-cancer-mng-moh-2020.yaml`) derives from.
The L3 FHIR/CQL artifacts in `input/fsh/` and `input/cql/` in turn derive
from the L2.

---

## ⚠️ Fidelity disclaimer

These files are **model-generated translations and structural extractions**
from the Mongolian-language source (A/641, 2020). They were produced by an
AI assistant (Claude, claude-opus-4-7, May 2026) reading the source PDF
directly, **without reference to any prior translation work**.

**These translations are NOT certified.** They are offered as:
1. A provenance trail between the L1 source and the L2 representation
2. An artifact for SME critique and verification
3. A bilingual reference for community contributors who want to inspect
   the upstream content but do not read Mongolian

**The Mongolian original (block-quoted in each section file) is
authoritative.** The English translation is the AI translator's best
effort. Specifically:

- Specialized medical and regulatory terminology is translated with care
  but is not subject to formal medical translation review.
- Page references throughout are to the **Mongolian PDF source pagination**
  (the original document is 166 pages).
- Some figures (Зураг 2.3, 2.4, 5.1–5.10) are described in narrative
  algorithmic form rather than reproduced as graphics.

**Any commercial implementation deploying the cxca DAK in Mongolia should
commission a professional certified translation.** Please report errors
in these L1 files as GitHub issues against this repository.

---

## File index

| File | L1 source | L2-relevance |
|---|---|---|
| [`ch02-screening.md`](ch02-screening.md) | Ch. 2, pp. 20–28 | Target ages, exclusions, recall triggers, registry architecture, ICD-10 mapping, forms catalog |
| [`ch05-precancer-dx-tx.md`](ch05-precancer-dx-tx.md) | Ch. 5, pp. 48–60 | Screening tests (HPV/VIA/cytology), diagnostic tests, 10 Bethesda sub-algorithms, treatment modalities |
| [`opinst-05-01-anamnesis.md`](opinst-05-01-anamnesis.md) | Op.Inst. 5.1, pp. 104–106 | Anamnesis intake protocol, women's specialized exam (3 parts), 22-step procedural protocol |
| [`annex-01-forms.md`](annex-01-forms.md) | Annex 1, pp. 147–152 | Six accompanying forms (ЭИМ-5а..5е) — invitation, sample referrals, result, recall |
| [`annex-02-indicators.md`](annex-02-indicators.md) | Annex 2, pp. 153–154 | **Full 14-metric indicator framework** for screening operations and outcomes |
| [`annex-04-05-classification.md`](annex-04-05-classification.md) | Annex 4 + Annex 5, pp. 155–158 | Bethesda × CIN × WHO terminology cross-tab; full Bethesda 2014 classification |

---

## What this directory does NOT cover

The following sections of A/641 are **not represented** in this L1 layer
because they are outside the L2-relevant scope of the cxca DAK:

| Section | Topic | Reason for exclusion |
|---|---|---|
| Ch. 1 | Introduction (epidemiology, anatomy, pathogenesis) | Background knowledge, not adaptable logic |
| Ch. 3 | Community engagement, education, counseling | Outside L2-decision scope |
| Ch. 4 | HPV vaccination | Primary prevention, separate scope |
| Ch. 6 | Cervical cancer (staging, surgery, radiation) | Cancer treatment, outside screening |
| Ch. 7 | Palliative care | Outside screening scope |
| Op.Inst. 6.x, 7.x | Cancer-treatment operational instructions | Outside screening scope |
| Op.Inst. 5.2–5.10 | Procedural detail for sample collection | Implementation detail, not L2-relevant |
| Annex 3 | Infection prevention/control | Universal precautions, not cervical-specific |
| Annex 6 | Monsel's paste preparation | Implementation detail |
| Annex 7 | HPV sample transport | Implementation detail |
| Annex 8 | Radiation therapy adverse-event criteria (RTOG/EORTC) | Outside screening scope |

If a future scope expansion of the cxca DAK requires any of these sections,
the L1 layer should be extended at that time.

---

## How to use this directory

### For SME review and critique

1. Read the file(s) corresponding to your area of expertise.
2. Compare the English translation against the Mongolian original.
3. If you find a translation error, file a GitHub issue with:
   - File and section reference (e.g., `ch02-screening.md §2.2.2`)
   - The proposed correction
   - The reasoning

### For L2-to-L1 traceability

Each L2 entry in `input/L2/cervical-cancer-mng-moh-2020.yaml` is annotated
with a comment indicating its L1 source. To trace from L2 to L1:

1. Identify the L1 source page in the L2 entry (e.g., "@source: A/641 Ch. 2.2 + Annex 2").
2. Open the corresponding L1 file in this directory.
3. Find the matching section (every L1 section has an L2 anchor).

### For L3-to-L1 traceability

L3 CQL files (`input/cql/*.cql`) and FSH files (`input/fsh/**/*.fsh`)
include `@source:` annotations referencing L2 anchors. To trace from L3 to
L1: L3 → L2 → L1 (this directory).

---

## What changed in this revision (2026-05-06)

This is the **inaugural** L1 layer for the cxca DAK. Prior to this revision,
the cxca DAK had no L1 layer of its own — it relied on first-pass
extraction artifacts in the methodology repository
(`dak-authoring-methodology/country-level/mongolia/`) which had been
produced ~10 days earlier (2026-04-25 / 2026-04-26 timestamps).

This revision:

1. **Eliminates the multi-generation provenance gap.** The previous L2
   (v0.1.0) was generated from first-pass artifacts which were themselves
   generated from a prior reading of the source PDF. The L2 was three
   generations removed from the source. This new L1 layer is **one
   generation removed from the source** (the AI translator read the source
   PDF directly).

2. **Surfaces real divergences** between the L2's content and the source.
   Several sections of the existing L2 v0.1.0 are now known to be
   incorrect or incomplete. See the per-file divergence notes in each
   L1 file for details. The L2 will be updated to v0.2.0 incorporating
   these findings.

3. **Provides a substrate for SME critique.** The previous methodology-repo
   translation artifacts (Word documents) were not version-controlled and
   not bilingual. The files in this directory are markdown, version-controlled,
   and structured for side-by-side comparison.

For the prior translation artifacts (kept as historical reference), see:
- `dak-authoring-methodology/country-level/mongolia/Mongolia_MOH_Cervical_Cancer_Guideline_Ch2_Ch5_EN.docx` (2026-04-26)
- `dak-authoring-methodology/country-level/mongolia/Mongolia_MOH_Cervical_Cancer_Algorithms_EN.docx` (2026-04-26)
- `dak-authoring-methodology/country-level/mongolia/translated-mongolia-protocols-and-forms.md` (2026-05-03)

These prior artifacts are **superseded** by the files in this directory
for the L2-relevant content; they remain useful as cross-reference.
