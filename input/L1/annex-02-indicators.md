# Annex 2 — Eligibility Criteria & Calculation Method (Indicator Framework)

**L1 source:** MOH Order A/641 (2020), pp. 153–154
**Mongolian title:** Хавсралт 2: Илрүүлгийн шалгуур үзүүлэлт, тооцох аргачлал
**English title:** Annex 2 — Screening criteria/indicators, calculation method

⚠️ **Fidelity disclaimer:** model-generated translation; Mongolian original is
authoritative. See `README.md` in this directory.

⚠️ **L2-critical.** This annex defines the **complete 14-metric indicator
framework** that the cxca Measure resources implement in part. The framework
spans target-population definition, screening operations, screening outputs,
and downstream-treatment/cancer-detection metrics.

---

## The 14 Indicators — Хүснэгт 2 (page 153)

> **English translation (full table):**
>
> | # | Indicator (Үзүүлэлт) | Calculation method (Тооцох аргачлал) |
> |---|---|---|
> | 1 | **Target population (Зорилтот хүн ам)** | For HPV-based screening: women aged 35 and 45 in the relevant screening year, by calendar year. For cytology-based screening: women aged 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60 in the relevant screening year, by calendar year. |
> | 2 | **Screening frequency (Илрүүлгийн давтамж)** | For HPV-based screening: if first screening at age 35 was negative, repeat 10 years later (i.e., at age 45). For cytology-based screening: women aged 30–60, repeated every 3 years. |
> | 3 | **Invitation status (Илрүүлэг үзлэгт урьсан байдал)** | Number of target-age women invited to screening in the relevant year (1 January – 31 December). |
> | 4 | **% of invited women who attended (Тухайн илрүүлгийн жилд уригдсан эмэгтэйчүүдээс илрүүлэг үзлэгт хамрагдсан хувь)** | (Number of users who received invitation and attended screening / Number of users who received invitation) × 100 |
> | 5 | **Time from invitation to attendance (Илрүүлгийн жилд урилга хүлээн авснаас хойш хамрагдсан хугацаа)** | Indicator calculating how long after invitation receipt the user was screened. |
> | 6 | **Invitation rate (Урьсан хувь)** | (Number of women invited in the relevant screening year × 100) / Number of target-age women who should have been included |
> | 7 | **Screening coverage rate (Илрүүлгийн хамралтын хувь)** | (Number of users included in screening × 100) / Number of target-age women who should have been included in screening during the screening period |
> | 8 | **Target-age population coverage (Зорилтот насны хүн амын хамралт)** | Proportion of target-age women who have been screened at least once. Demonstrates how target-age women have ever been included in screening. |
> | 9 | **Screening detection level (Илрүүлгийн түвшин)** | Proportion of target-age women included in screening for the first time during the year. (Number of target-age women newly included in screening that year × 100 / Number of target-age women newly registered as target population that year) |
> | 10 | **Positive results (Эерэг хариу)** | Number of cases requiring further monitoring/evaluation after screening exam. |
> | 11a | **% with positive result (Эерэг хариу гарсан хувь)** | (Number of users with positive result among first-time-screened target-age women in the year × 100) / Total target-age women included in screening that year |
> | 11b | **Negative results (Сөрөг хариу)** | Number of cases not requiring further evaluation after screening exam. *(Note: source numbers this also as #11 — appears to be a duplicate numbering or a sub-row.)* |
> | 12 | **% receiving treatment (Эмчилгээнд хамрагдсан хувь)** | Computed by treatment type. (Number of first-time-screened target-age women with positive result who received treatment × 100) / Total target-age women with positive result included in screening |
> | 13 | **Age-specific new cervical cancer cases (Насаар өвөрмөц, умайн хүзүүний хорт хавдрын шинэ тохиолдлын тоо)** | (Number of new cancer cases among target-age women included in screening during the period × 100) / Total women in that age group |
> | 14 | **Algorithm-driven treatment/monitoring of cancer-suspected cases (Хорт хавдрын сэжигтэй тохиолдлуудад бүдүүвчийн дагуу эмчилгээ, хяналт хийсэн байдал)** | (Number of algorithm-driven treatment/monitoring cases among cancer-suspected cases × 100) / Total users found cancer-suspected by screening |

```mongolian
Хавсралт 2.
Илрүүлгийн шалгуур үзүүлэлт, тооцох аргачлал

[Full table reproduced in original Mongolian — see source PDF p. 153–154]
```

---

## Mapping to cxca L3 Measures

| Annex 2 # | Indicator | cxca L3 Measure | Status |
|---|---|---|---|
| 1 | Target population | (used as denominator across all coverage measures) | implicit |
| 2 | Screening frequency | (encoded in PlanDefinition recall scheduling) | implicit |
| 3 | Invitation status | — | ⚠️ **not yet implemented** |
| 4 | % of invited who attended | — | ⚠️ **not yet implemented** |
| 5 | Time from invitation to attendance | — | ⚠️ **not yet implemented** |
| 6 | Invitation rate | — | ⚠️ **not yet implemented** |
| 7 | **Screening coverage rate** | **CXCAIND01 (age 35), CXCAIND04 (age 45), CXCAIND02 (cytology)** | ✅ implemented |
| 8 | Target-age population coverage (lifetime) | — | ⚠️ **not yet implemented** |
| 9 | Screening detection level (first-time) | (CXCAIND07 likely covers this — verify wording) | possibly implemented |
| 10 | Positive results count | — | ⚠️ **not yet implemented as count** |
| 11a | % with positive result | **CXCAIND03** (HPV positivity rate) | ✅ implemented |
| 11b | Negative results count | — | ⚠️ **not yet implemented** |
| 12 | **% receiving treatment** | **CXCAIND06 (cascade-completion), CXCAIND08 (treatment completion)** | ✅ implemented |
| 13 | Age-specific new cervical cancer cases | — | ⚠️ **not yet implemented** |
| 14 | Algorithm-driven treatment of suspected cases | — | ⚠️ **not yet implemented** |

⚠️ **Summary: cxca L3 implements 5 of 14 Annex 2 metrics** (CXCAIND01,
CXCAIND02, CXCAIND03, CXCAIND04, CXCAIND06, CXCAIND07, CXCAIND08, where
07 and a few others are partial mappings). The remaining 9 metrics define
**operational measures** (invitation rates, response times) that the cxca
DAK could add as Phase 8+ work.

⚠️ **The current L2 says "L3 implements 7 of an estimated >9 metrics" — the
correct numbers are: L3 implements 5–7 of 14 metrics, with the upstream
framework now confirmed at exactly 14 (numbered 1–14 with one
double-numbered row).**

L2 anchor: `indicators` — needs full 14-metric framework added with
implementation status per metric.

---

## Translator's notes

1. **Indicator #11 appears to be double-numbered.** The source has two
   rows both numbered "11" — one for "Эерэг хариу гарсан хувь" (% with
   positive result) and one for "Сөрөг хариу" (Negative results count).
   I've split them as 11a and 11b in the table above. Likely a typo in
   the source PDF that an SME could confirm.

2. **Indicator #2 (frequency) is operationalized differently for the two
   pathways.** HPV: "if 35 was negative, repeat at 45" — i.e., a
   conditional next-step rule, not a fixed interval. Cytology: "every 3
   years from 30 to 60" — a regular interval. The L2 currently captures
   both but doesn't surface the "if 35 was negative" condition explicitly.

3. **Operational vs. clinical metrics.** Indicators 3–6 are about *invitation
   workflow operations* (invited, attended, response time). Indicators 7–9
   are about *screening coverage/uptake*. Indicators 10–12 are about
   *result outcomes and cascade*. Indicators 13–14 are about *cancer
   detection effectiveness*. The current cxca L3 prioritizes 7–9 and 11–12;
   the operational metrics (3–6) and the cancer-detection metrics (13–14)
   are the largest gap.

4. **"Algorithm-driven" (бүдүүвчийн дагуу) is the source's term** for "per
   the appropriate sub-algorithm in §5.3" — i.e., the Bethesda-branched
   triage tree. Indicator #14 thus measures *protocol adherence* in the
   triage cascade. This is a real cxca methodology contribution: the
   measure depends on actually having the sub-algorithms encoded as
   PlanDefinitions to compare actual care against.

5. **Target-population definition** (#1) is defined per calendar year, by
   calendar age. Calendar-year-anchored eligibility is consistent with the
   Ch. 2.3.5 birthday-anchored invitation rule.
