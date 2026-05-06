# Operational Instruction 5.1 — Anamnesis-Taking and Women's Specialized Exam

**L1 source:** MOH Order A/641 (2020), pp. 104–106
**Mongolian title:** Үйлдлийн зааварчилгаа 5.1: Дурдатгал (анамнез) авах, эмэгтэйчүүдийн тусгайлсан үзлэг хийх
**English title:** Op.Inst. 5.1 — Taking the anamnesis (history) and conducting the women's specialized exam

This Op.Inst. is the **first-encounter intake protocol** for any woman presenting
for cervical-cancer screening. It is the upstream gate to all of Ch. 2's
screening pathways: every woman who enters either the cytology arm or the
HPV arm is first run through this protocol so that risk factors and current
clinical state are documented.

---

## ⚠️ Fidelity disclaimer

This file is a **model-generated translation and structural extraction** from
the Mongolian-language source (A/641, 2020). It was produced by an AI
assistant (Claude, claude-opus-4-7, May 2026) reading the source PDF directly,
without reference to any prior translation work. It is offered for SME critique
and as a provenance trail between the L1 source and the L2 representation at
`input/L2/cervical-cancer-mng-moh-2020.yaml`.

**The Mongolian original (block-quoted in each section) is authoritative.**

---

## Part 1 — Anamnesis (Дурдатгал авах)

### 1.1 Purpose

> **English translation:**
>
> The provider takes the anamnesis from the woman during cervical-cancer
> screening exam and treatment, identifying cervical cancer risk factors and
> signs/symptoms.

```mongolian
Үйлчлүүлэгчийг УХХХ-ын илрүүлэг үзлэг ба эмчилгээний үед эмэгтэйгээс
дурдатгал авч УХХХ-ын эрсдэлт хүчин зүйл, шинж тэмдэг байгаа эсэхийг
тодруулна.
```

### 1.2 Required equipment

> **English translation:**
>
> - Ambulatory (outpatient) card
> - Hand-washing water, soap, alcohol-based hand sanitizer
> - Side lamp
> - Clean cover-paper-lined exam table for women
> - Single-use gloves (clean gloves during exam)
> - Single-use exam speculum

```mongolian
Шаардлагатай зүйлс:
• Амбулаторийн карт
• Гар угаах ус, саван, спиртэн суурьтай гар ариутгагч
• Хажуугийн гэрэл
• Цэвэр дэвсгэр дэвссэн эмэгтэйчүүдийн үзлэгийн ор
• Нэг удаагийн бээлий (эмчилгээний үед ариун бээлий)
• Нэг удаагийн үзлэгийн толь
```

### 1.3 Information collected from the woman

⚠️ **Compared to the current L2 (`parameters[id=anamnesis-intake]`):** field
list is substantively the same as the prior extraction. One important
nuance — the source groups current and past contraceptive methods together as
a single composite item (not two separate fields), and the symptoms field is
generic ("УХХХ ба бусад өвчний шинж тэмдэг" = "signs/symptoms of cervical
cancer and other diseases"), not pre-enumerated. Worth noting.

> **English translation:**
>
> Information to obtain from the user:
>
> - Age, education, pregnancies, deliveries, live births, last menstrual
>   period date, menstrual cycle pattern, currently used and previously used
>   contraceptive methods, age at first sexual intercourse, age at first
>   delivery, number of sexual partners, history of STIs (BЗДХ)
> - Date of last cervical-cancer screening, test performed, result
> - Disease history
> - Risk-increasing habits — cervical cancer (alcohol, tobacco)
> - Signs/symptoms of cervical cancer and other diseases

```mongolian
Үйлчлүүлэгчээс авах мэдээлэл:
• Нас, боловсрол, жирэмслэлт, төрөлт, амьд төрсөн хүүхдийн тоо, сүүлийн
  биеийн юм ирсэн огноо, биеийн юмны мөчлөг, одоогийн болон хэрэглэж
  байсан жирэмслэхээс хамгаалах арга, анхны бэлгийн харьцаанд орсон нас,
  анхны жирэмслэлтийн нас, бэлгийн хамтрагчийн тоо, БЗДХ-аар өвчилсөн
  эсэх,
• Сүүлийн УХХХ-ын илрүүлэгт хамрагдсан огноо, хийгдсэн шинжилгээ, хариу
• Өвчний түүх
• УХХХ-ын эрсдэлийг нэмэгдүүлэх хорт зуршил (архи, тамхи)
• УХХХ ба бусад өвчний шинж тэмдэг
```

L2 anchor: `parameters[id=anamnesis-intake]`

### 1.4 Anamnesis-field structure for L2

For convenience, here is the field list as it would map to a FHIR
Questionnaire or LogicalModel:

| Field | Type | L2 anchor reference | L2-current name |
|---|---|---|---|
| Age | integer | drives eligibility | age |
| Education | string | demographic | education |
| Pregnancy count | integer | gravidity | pregnancy-count |
| Delivery count | integer | parity | delivery-count |
| Live-birth count | integer | parity-detail | live-birth-count |
| Last menstrual period date | date | sample-timing | last-menstrual-period |
| Menstrual cycle pattern | string | gynecological | menstrual-cycle-status |
| **Currently used contraception** | string | (composite L1 item) | current-contraception |
| **Previously used contraception** | string | (composite L1 item) | past-contraception |
| Age at first sexual intercourse | integer | risk factor | age-at-first-sexual-contact |
| Age at first delivery | integer | risk factor | age-at-first-delivery |
| Number of sexual partners | integer | risk factor | number-of-sexual-partners |
| STI history | structured | risk factor | sti-history |
| Last screening date | date | recall-vs-new branching | last-cxca-screening-date |
| Last screening test type | code (HPV/cytology/unknown) | branching | last-cxca-screening-test |
| Last screening result | string | branching | last-cxca-screening-result |
| Past disease history | string | clinical | past-disease-history |
| Smoking | code (current/past/never) | risk factor | smoking |
| Alcohol use | code | risk factor | alcohol-use |
| Current symptoms | structured (free-text per source) | clinical | current-symptoms |

⚠️ **Discrepancy note vs. current L2:**
- The L2 lists "current-contraception" and "past-contraception" as **two
  separate fields**. The source treats them as a **single composite item**
  ("одоогийн болон хэрэглэж байсан жирэмслэхээс хамгаалах арга" = "currently
  used and previously used contraceptive methods"). Either interpretation is
  defensible; flagging for awareness.
- The L2 lists `current-symptoms` with examples `[bleeding, discharge, post-coital-bleeding]`. The source uses an **open-ended** phrasing ("УХХХ
  ба бусад өвчний шинж тэмдэг" = "signs/symptoms of cervical cancer and
  other diseases"), without enumeration. The L2's pre-enumerated example
  list is provider-friendly but not strictly source-faithful.

---

## Part 2 — Specialized exam (Эмэгтэйчүүдийн тусгайлсан үзлэг)

A/641 specifies that the women's specialized exam consists of three parts:

> **English translation:**
>
> 1. Examination of external genitalia (Гадна бэлэг эрхтэнг харж шинжлэх)
> 2. Speculum exam (Үтрээнд толь тавьж шинжлэх)
> 3. Bimanual exam (Хоёр гарын хавсарсан үзлэг)

```mongolian
Эмэгтэйчүүдийн тусгайлсан үзлэг нь 3 хэсгээс бүрдэнэ:
1. Гадна бэлэг эрхтэнг харж шинжлэх
2. Үтрээнд толь тавьж шинжлэх
3. Хоёр гарын хавсарсан үзлэг
```

L2 anchor: `parameters[id=anamnesis-intake].exam_parts`

---

## Part 3 — 22-step procedural protocol (Үзлэг хийхийн өмнөх бэлтгэл)

⚠️ **Currently not captured in L2.** The L2 has only the three-part exam
structure; the source provides a 22-step protocol. Most of these steps are
implementation detail not fitting a typical L2 representation, but two
sub-segments **are** L2-relevant: the pre-exam consent steps and the
post-exam documentation/follow-up steps. They define the workflow contract
that an L3 PlanDefinition for an intake encounter would need to enforce.

### 3.1 Pre-exam preparation (steps 1–6)

> **English translation:**
>
> 1. Prepare all required equipment and supplies. The exam speculum should
>    be at human body temperature (warm).
> 2. If a sample is going to be taken, explain the purpose, and tell the
>    woman when she will receive the results.
> 3. Verify whether the woman has any questions; provide accurate, clear
>    answers.
> 4. Explain how the exam will be performed; show the speculum.
> 5. Ask the woman to remove the clothes below the pelvis.
> 6. Have the woman lie down on the exam table.

```mongolian
Үзлэг хийхийн өмнөх бэлтгэл:
1. Шаардлагатай бүх багаж, хэрэгслийг бэлдэнэ. Үзлэгийн толь нь хүний
   биеийн хэмд тохирсон дулаан байх
2. Хэрэв шинжилгээ авахаар бол зорилгоо ойлгуулан хариугаа хэзээ авахыг
   хэлнэ.
3. Эмэгтэйд асуулт бий эсэхийг лавлан асуултанд үнэн зөв тодорхой
   хариулт өгнө.
4. Үзлэг хэрхэн хийгдэхийг тайлбарлан, толио харуулна.
5. Давсгаа суллан бүсхийнээс доошх хувцсаа тайлахыг эмэгтэйгээс хүснэ.
6. Эмэгтэйг үзлэгийн орон дээр хэвтүүлнэ.
```

### 3.2 External genitalia exam (step 7)

> **English translation:**
>
> 7. When examining the external genitalia, observe for any swelling,
>    growths, ulcers, abnormal discharge, sores, scars, signs of STI (BЗДХ).

```mongolian
Гадна бэлэг эрхтэнг харж шинжлэх:
7. Гадна бэлэг эрхтэнг харж шинжлэхдээ улайлт, үүсвэр, хаван хавдар,
   хэвийн бус шүүрэл, шарх, урагдал, сорви, БЗДХ-ийн шинж байгаа эсэхийг
   анхаарна.
```

### 3.3 Speculum exam (steps 8–11)

> **English translation:**
>
> 8. Hold the speculum's two halves together and gently insert into the
>    vagina. The tongue and urethra should not be pressed. Once inserted,
>    rotate to position the speculum's tongue downward. Open the speculum
>    gently to visualize the cervix. After fully visualizing, fix the
>    speculum open with the locking screw.
> 9. Normal cervix is round and smooth. A small yellow soft swelling or red
>    ring around the cervix's external opening with clear discharge is a
>    normal sign.
> 10. Check the following abnormal changes:
>     - Heavy vaginal discharge, red vaginal walls = signs of inflammation;
>       thick yellow discharge could indicate possible fungal infection
>     - Sores, scars. Scars from herpes, scattered virus, or in some cases
>       trauma
>     - Bleeding from cervix on touch with cotton swab, or thick yellow
>       discharge = signs of cervical infection
>     - Abnormal growth or presence of mass
> 11. Carefully release the speculum's lock, close the speculum, remove.

L2 anchor: `parameters[id=anamnesis-intake].exam_parts[order=2]`

### 3.4 Bimanual exam (steps 12–14)

> **English translation:**
>
> By bimanual exam, examine the lower pelvic-cavity organs.
>
> 12. Determine whether the cervix is mobile and tender. Insert the index
>     and middle fingers into the vagina, palm facing up. Gently move the
>     cervix to determine its location, then with the other hand placed on
>     the lower abdomen, palpate down on the upper cervix area. If the
>     cervix moves freely and without tenderness, this is normal. If
>     tenderness is present, it indicates inflammation. Limited movement
>     suggests adhesion.
> 13. Examining the lower abdomen with finger pressure: place fingers
>     between the uterus and the abdominal wall on both sides. Identify
>     uterine position, shape, size, and consistency. Then check the right
>     and left ovaries (or the area where they should be palpable).
>     - If uterus is enlarged and soft → may be pregnant
>     - If large and hard → may be fibroids or other masses
>     - If tender on palpation → sign of inflammation
>     - Limited movement → sign of adhesion
> 14. Palpate fallopian tubes and ovaries. These are usually not palpable in
>     normal cases. If a samar-larger mass is palpable or there is sharp
>     pain, with last menstrual period missed, may suggest ectopic pregnancy
>     or sharp pelvic inflammation.

L2 anchor: `parameters[id=anamnesis-intake].exam_parts[order=3]`

### 3.5 Continued exam (steps 15–16)

> **English translation:**
>
> 15. Check whether there are any growths, scars, or polyps in the vagina.
> 16. Have the woman cough or strain to check for genital prolapse and/or
>     stress incontinence.

### 3.6 Post-exam (steps 17–22)

⚠️ **L2-relevant.** These steps define the intake-encounter workflow contract:
documentation, communication, escalation, scheduling.

> **English translation:**
>
> Post-exam:
>
> 17. Wash hands with soap.
> 18. Document exam findings in the ambulatory card.
> 19. Tell the woman about the exam findings; if any abnormalities found,
>     explain.
> 20. **If signs of STI (BЗДХ) appear, examine the woman's partner together
>     and provide treatment as a couple.**
> 21. **If urgent diagnosis is needed, refer to the next-tier facility.**
> 22. **Schedule when the woman will return for monitoring.**

```mongolian
Үзлэгийн дараа:
17. Гараа савандаж угаана
18. Үзлэгийн дүгнэлтээ амбулаторийн картанд тэмдэглэнэ.
19. Үзлэгийн тухай мэдээллийг эмэгтэйд хэлнэ ба хэвийн бус эмгэг
    илэрсэн бол тайлбарлана.
20. Хэрэв БЗДХ-ын шинж илэрвэл эмэгтэйг хамтрагчийнхтай нь хамт онош
    тодруулан эмчилнэ.
21. Яаралтай оношилгоо шаардлагатай үед дараагийн шатлалын эмнэлэгт
    илгээнэ.
22. Хяналтанд хэзээ эргэж ирэхийг товлоно.
```

L2 anchor: ⚠️ **none yet** — proposal: add `parameters[id=intake-workflow]` or
fold into `parameters[id=anamnesis-intake]` as a sibling field
`post_exam_workflow` listing: document_in_card, communicate_to_woman,
sti_partner_treatment, urgent_referral, schedule_followup.

---

## Translator's notes (Claude, May 2026)

1. **Composite vs. discrete contraception fields.** The L2 currently
   separates "current-contraception" and "past-contraception" into two
   fields. The source treats them as a single composite phrase. Both
   interpretations are useful: the L2's discrete fields are easier to
   represent in a Questionnaire; the source's composite phrasing is faithful
   to the original document. Either is defensible; flagging for SME review.

2. **Symptoms field is open-ended in source.** The L2 enumerates symptoms
   examples (`bleeding`, `discharge`, `post-coital-bleeding`); the source
   does not. The L2's enumeration is implementation guidance, not a
   normative list. Worth annotating.

3. **STI partner treatment is a non-trivial workflow item.** Step 20 of
   the protocol says "examine the woman's partner together and provide
   treatment as a couple." This is a real workflow obligation that may not
   fit neatly into a single-patient PlanDefinition. Worth flagging if
   future L3 work covers STI co-detection.

4. **Urgent-diagnosis referral.** Step 21 ("If urgent diagnosis is needed,
   refer to the next-tier facility") is a triage exit point. A full L3
   intake PlanDefinition would need to encode the criteria for "urgent
   diagnosis needed" — those criteria are not enumerated in this Op.Inst.
   and would need to be derived from clinical judgment or other guidance
   documents. L2-relevant gap.

5. **Documentation gate.** Step 18 mandates documentation of exam findings
   in the ambulatory card. This is the upstream source for the data that
   ЭИМ-5.1 (the primary-care summary record) compiles. Worth tracing in any
   future L3 representation of the registry data flow.
