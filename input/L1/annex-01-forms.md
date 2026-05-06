# Annex 1 — Cervical Cancer Screening Forms

**L1 source:** MOH Order A/641 (2020), pp. 147–152
**Mongolian title:** Хавсралт 1: Умайн хүзүүний хорт хавдрын илрүүлгийн маягтад дагалдах хуудас
**English title:** Annex 1 — Accompanying pages for the cervical cancer screening form

This annex enumerates the **six accompanying form slips (ЭИМ-5а..5е)** that
circulate through the screening registry. They accompany the two summary
patient-record pages (ЭИМ-5.1 at primary care, ЭИМ-5.2 at secondary care).

⚠️ **Fidelity disclaimer:** model-generated translation; Mongolian original is
authoritative. See `README.md` in this directory.

---

## Form ЭИМ-5а — Screening Invitation (p. 147)

**Mongolian title:** Умайн хүзүүний хорт хавдрын илрүүлэгт хамрагдах УРИЛГА хүргүүлэх нь
**English title:** Invitation to participate in cervical cancer screening

> **Fields:**
> - Issuing health-center / clinic (free text)
> - Овог (Last name): _______________
> - Нэр (First name): _______________
> - Phone number
> - Address (Place of residence)
> - Email
> - Birth month, Birth year
> - **Screening type** (one of two checkboxes — primary screening worker
>   indicates which path applies):
>   - ☐ Cytology-based screening (Умайн хүзүүний эсийн шинжилгээнд суурилсан)
>   - ☐ HPV detection screening (ХПВ илрүүлэх шинжилгээнд суурилсан)
> - Possible date and time of screening: ____ year ____ month ____ day
>   ____ hour ____ minute
> - *Note printed on form:* "Invitation must be delivered within 7 days
>   before the user's birthday in the relevant year."

⚠️ **L2-relevant.** The form contains the **screening-type choice**
(cytology vs. HPV) at the time of invitation. This means the recipient is
told *in advance* which test to expect — driven by the invitation source's
knowledge of the facility's lab capacity. This is consistent with the L2's
`screening-schedule.depends_on: lab_capacity` model, but the form makes the
patient-facing semantics explicit.

⚠️ **Confirms birthday-anchoring** noted in Ch. 2.3.5: the invitation must
be delivered within 7 days *before the user's birthday*.

L2 anchor: `forms[id=ЭИМ-5а]`

---

## Form ЭИМ-5б — HPV Sample Referral (p. 148)

**Mongolian title:** Шинжилгээний сорьц илгээх хуудас — Хүний папиллома вирусын шинжилгээний сорьц
**English title:** Sample referral page — HPV sample

> **Fields (identifiers):**
> - Эмнэлгийн нэр (Clinic name)
> - Үйлчлүүлэгчийн овог, нэр (User last name, first name)
> - Регистрийн дугаар (National registration number)
> - Нас (Age)
> - Гэрийн хаяг (Home address)
> - Утасны дугаар (Phone number)
> - Цахим хаяг (Email)
> - Шинжилгээний сорьц авсан огноо (Date sample was taken): year/month/day
> - Лабораторид илгээсэн сорьцын дугаар (Sample number sent to lab)
> - Огноо (Date sent)
> - Сүүлийн биеийн юм ирсэн эхний өдөр (Last menstrual period start date):
>   year/month/day
>
> **Mini-anamnesis sections (embedded within the form):**
>
> **Зовуурь (Symptoms):**
> - ☐ Байхгүй (None)
> - ☐ Үтрээний ялгадас (Vaginal discharge)
> - ☐ Цус гарах (Bleeding)
> - ☐ Биеийн юмны үед цус их гарах (Heavy menstrual bleeding)
> - ☐ Цэвэршилтийн дараа цус гарах (Post-menopausal bleeding)
> - ☐ Бусад: ______ (Other)
>
> **ЖСА хэрэглээ (Contraception use):**
> - ☐ Хэрэглэдэггүй (Not using)
> - ☐ Даавруийн эм (Hormonal pill)
> - ☐ Суулгац (IUD/implant)
> - ☐ Ерөндөг (IUD wire — likely copper IUD)
> - ☐ Бэлгэвч (Condom)
> - ☐ Бусад: ______ (Other)
>
> **Тамхи татдаг эсэх (Smoking status):**
> ☐ Тийм (Yes) ☐ Үгүй (No) ☐ Өмнө нь татдаг байсан (Previously smoked)
> ☐ Хариулаагүй (No answer)
>
> **Умайн хүзүүний хорт хавдрын илрүүлэгт өмнө нь хамрагдаж байсан эсэх**
> (Whether previously screened for cervical cancer):
> ☐ Тийм (Yes) ☐ Үгүй (No)
>
> **Хүний папиллома вирусын вакцинд хамрагдаж байсан эсэх** (Whether previously
> received HPV vaccine):
> ☐ Тийм (Yes) ☐ Үгүй (No) ☐ Мэдэхгүй (Don't know)
>
> **Умайн хүзүүний эсийн шинжилгээ хийлгэж байсан эсэх** (Whether previously
> had cervical cytology):
> - ☐ Тогтмол /3 жил тутамд/ (Regular / every 3 years)
> - ☐ Шинжилгээ хийлгэж байсан, гэвч тогтмол хугацаанд бус
>   (Had screening but not on a regular schedule)
> - ☐ Шинжилгээ хийлгэж байгаагүй (Never screened)
> - ☐ Мэдэхгүй (Don't know)
> - ☐ Хариулаагүй (No answer)
>
> **Умайн хүзүүний эсийн шинжилгээнд эмгэг өөрчлөлт илэрч авсан арга хэмжээ**
> (Action taken if cytology revealed pathological change):
> - ☐ Эмчилгээ хийлгэж эрүүлжсэн (Underwent treatment and recovered)
> - ☐ Одоо ч эмэгтэйчүүдийн эмчийн хяналтанд байгаа (Currently still under
>   gynecologist's monitoring)
> - ☐ Би өөрөө эмчилгээ, хяналтаас татгалзсан (I myself declined treatment/monitoring)
> - ☐ Мэдэхгүй (Don't know)
> - ☐ Хариулаагүй (No answer)
>
> **Умайн хүзүүний эсийн шинжилгээ хийлгэж байсан бол эмгэг өөрчлөлт илэрч
> байсан эсэх** (Whether cytology, if previously performed, revealed pathology):
> ☐ Тийм (Yes) ☐ Үгүй (No) ☐ Мэдэхгүй (Don't know) ☐ Хариулаагүй (No answer)
>
> **Тампон хэрэглэдэг эсэх** (Whether uses tampons):
> ☐ Тийм (Yes) ☐ Үгүй (No) ☐ Урд нь хэрэглэдэг байсан (Previously used)
> ☐ Хариулаагүй (No answer)
>
> **Дотуур үзлэг (Internal exam findings):**
> - ☐ Умайн хүзүү хэвийн (Cervix normal)
> - ☐ Шархтай (With sores/scars)
> - ☐ Хүрэхэд цус гарна (Bleeding on touch)
> - ☐ Хавдрын сэжигтэй (Suspicious for cancer)
>
> **Кольпоскопи (Colposcopy findings):**
> - ☐ Хийгээгүй (Not performed)
> - ☐ Хэвийн (Normal)
> - ☐ Бусад (Other)
> - ☐ Метаплази (Metaplasia)
> - ☐ ХПВ (HPV)
> - ☐ Хорт хавдар (Cervical cancer)
> - ☐ Хавтгай хучуур эсийн хөнгөн гэмтэц (LSIL)
> - ☐ Хавтгай хучуур эсийн хүнд гэмтэц (HSIL)
> - ☐ Дүгнэлт гаргах боломжгүй (Cannot issue conclusion)
>
> **Бottom of form:**
> - Шинжилгээний хариуг хүлээн авах цахим хаяг (Email to receive results)
> - Албан тушаал (Job title) / Эмч, ажилтны нэр (Doctor/staff name) / Signature

⚠️ **L2-relevant — major.** This form is the **operational mini-anamnesis**
that runs alongside Op.Inst. 5.1's full anamnesis. It contains a curated
subset of the most decision-relevant fields for the HPV pathway. A future
L3 Questionnaire derived from this form would have a clear pre-printed
structure to model.

L2 anchor: `forms[id=ЭИМ-5б]` — needs `embedded_anamnesis_fields` detail expansion

---

## Form ЭИМ-5в — Cytology Sample Referral (p. 149)

**Mongolian title:** Шинжилгээний сорьц илгээх хуудас — Умайн хүзүүний эсийн шинжилгээний наац
**English title:** Sample referral page — Cytology sample

⚠️ **Critical detail.** ЭИМ-5в is **structurally identical** to ЭИМ-5б —
same field set, same checkbox options, same mini-anamnesis sections. The
only differences are:
1. The form title says "Cytology sample" instead of "HPV sample."
2. There is an additional field at the top: **Нааацын дугаар** (Slide number),
   with checkboxes for ☐ Шинэ (New) and ☐ Хяналтын-давтан (Monitoring/repeat).

> **Fields (only the differences vs. ЭИМ-5б):**
> - **Нааацын дугаар (Slide number)** — ☐ Шинэ (New) ☐ Хяналтын-давтан (Repeat)
> - Шинжилгээний төрөл (Sample type): "Умайн хүзүүний эсийн шинжилгээний наац"
> - Лабораторид илгээсэн огноо (Date sent to lab): year/month/day
> - All other fields identical to ЭИМ-5б

L2 anchor: `forms[id=ЭИМ-5в]` — same `embedded_anamnesis_fields` as ЭИМ-5б
plus slide-number tracking

---

## Form ЭИМ-5г — Tissue Sample Referral (p. 150)

**Mongolian title:** Эдийн шинжилгээний сорьц илгээх хуудас
**English title:** Tissue sample referral page

> **Fields (identifiers):** Эмнэлгийн нэр (Clinic name)
>
> **Сорьцын төрөл (Sample type) — checkbox:**
> - ☐ Шинжилгээнд авсан эд (Tissue obtained for examination)
> - ☐ LEEP-ээр авсан эд (Tissue obtained via LEEP)
> - ☐ Мэс заслын хутгаар конус хэлбэрээр авсан эд (Tissue obtained via cone-shaped excision with knife)
>
> **Identifier section:**
> - Лабораторид илгээсэн сорьцын дугаар (Sample number sent to lab)
> - Үйлчлүүлэгчийн овог, нэр (User last name, first name)
> - Регистрийн дугаар (National registration number)
> - Нас (Age)
> - Гэрийн хаяг (Home address)
> - Утасны дугаар (Phone number)
> - Цахим хаяг (Email)
> - Шинжилгээ авсан огноо (Date sample taken): year/month/day
>
> **Pregnancy / fertility section:**
> - Жирэмсэн эсэх (Pregnant?): ☐ Тийм (Yes) ☐ Үгүй (No) — If yes, gestational age (weeks)
> - Цэвэршсэн эсэх (Menopausal?): ☐ Тийм (Yes) ☐ Үгүй (No) — If yes, year
>   - If no: Last menstrual period start date: year/month/day
> - Жирэмслэлтийн тоо (Pregnancy count) ____ , Төрөлтийн тоо (Delivery count) ____ ,
>   Үр хөндөлтийн тоо (Abortion count) ____ , Зулбалтын тоо (Miscarriage count) ____
>
> **ЖСА хэрэглээ (Contraception):** Same checkbox options as ЭИМ-5б
>
> **Үзлэгээр умайн хүзүүний харагдах байдал** (Cervical findings on visual exam):
> - ☐ Цэвэр (Clean/normal)
> - ☐ Улайлттай (With redness)
> - ☐ Цэвэрүүтэй (With clear discharge)
> - ☐ Хавдрын сэжигтэй (Cancer-suspicious)
>
> **Past tissue exam:**
> - Умайн хүзүүний эдийн шинжилгээ хийлгэж байсан эсэх (Has previously had
>   cervical tissue exam): ☐ Тийм / ☐ Үгүй / ☐ Мэдэхгүй
>   - If yes: year, result
>
> **TORCH testing:**
> - Халдварын TORCH шинжилгээ хийлгэж байсан эсэх (Has previously had TORCH
>   infection screen): ☐ Тийм / ☐ Үгүй / ☐ Мэдэхгүй
>   - If yes: year, result
>
> **Эмнэлзүйн талаарх товч мэдээлэл (Brief clinical information)**: free text
> **Эмнэлзүйн урьдчилсан онош (Preliminary clinical diagnosis)**: free text
>
> **Bottom of form:**
> - Лабораторид илгээсэн огноо (Date sent to lab)
> - Шинжилгээний хариуг хүлээн авах цахим хаяг (Email to receive results)
> - Албан тушаал / Signature

L2 anchor: `forms[id=ЭИМ-5г]`

---

## Form ЭИМ-5д — Result/Conclusion Notification (p. 151)

**Mongolian title:** Шинжилгээний хариу, дүгнэлтийг үйлчлүүлэгчид эргэн мэдээлэх хуудас
**English title:** Result/conclusion notification page (returned to client)

> **Fields:**
> - Issuing health-center / clinic
> - Үйлчлүүлэгчийн овог, нэр (User last name, first name)
> - Регистрийн дугаар (Registration number)
> - Нас (Age)
> - Гэрийн хаяг (Home address)
> - Утасны дугаар (Phone number)
> - Цахим хаяг (Email)
> - **Шинжилгээ хийлгэсэн огноо (Date test was performed)**: year/month/day
> - **Хариу, дүгнэлт гарсан огноо (Date result/conclusion issued)**: year/month/day
> - **Шинжилгээний хариу, дүгнэлт (Test result/conclusion):** free text
> - **Онош (Diagnosis):** free text
> - **Цаашдын хяналт, зөвлөмж (Further monitoring / advice):** free text
> - Мэдээлсэн огноо (Date informed)
> - Албан тушаал / Signature
> - **ТЭМДЭГЛЭЛ: (Notes section)** — free text

⚠️ **Result codes are FREE TEXT in this form**, not constrained to a coded
vocabulary. This has L2 implications: any L3 Observation derived from this
form would lose information unless a structured coding step is added at
data-capture time.

L2 anchor: `forms[id=ЭИМ-5д]`

---

## Form ЭИМ-5е — Repeat-Screening Recall (p. 152)

**Mongolian title:** Давтан шинжилгээнд эргэн дуудах хуудас
**English title:** Repeat-screening recall page

> **Fields:**
> - Эмнэлгийн нэр (Clinic name)
> - **Шинжилгээний төрөл (Test type):** free text
>
> **Эргэн дуудсан шалтгаан (Reason for recall) — three checkboxes:**
> - ☐ Өмнө нь авсан шинжилгээний наац оношилгоо тавих боломжгүй (Previous
>   sample inadequate for diagnosis)
> - ☐ Эмчилгээний дараах үр дүнг үнэлэх (Evaluate post-treatment outcome)
> - ☐ Хяналтын-давтан шинжилгээ (Monitoring repeat exam)
>
> **Identifier section:**
> - Овог, нэр (Last name, first name)
> - Регистрийн дугаар (Registration number)
> - Нас (Age)
> - Гэрийн хаяг (Home address)
> - Утасны дугаар (Phone number)
> - Цахим хаяг (Email)
> - **Өмнө нь _____ шинжилгээ хийлгэсэн огноо** (Previous _____ test date):
>   year/month/day
> - **Үйлчлүүлэгчийг эргэн дуудахаар товлосон огноо** (Scheduled recall date):
>   year/month/day
>
> **ГҮЙЦЭТГЭЛ (Execution / outcome):**
> - _____ шинжилгээг давтан авсан огноо (Date the repeat test was actually performed)
>
> **Давтан шинжилгээнд эргэн дуудахад үйлчлүүлэгч ирэхгүй тохиолдолд авсан
> арга хэмжээ** (Action taken if user does not respond to recall):
> - Мэдэгдэл илгээсэн (Notification sent) — Огноо (Date)
> - Арга хэмжээ — бусад (Other action) — free text
> - **ТЭМДЭГЛЭЛ (Notes):** free text
> - Албан тушаал / Signature

⚠️ **L2-relevant.** This is the form structure that operationalizes the
six recall triggers in §2.3 (recall_triggers in L2). The three reasons
correspond to:
- "previous sample inadequate" → roughly maps to triggers #2, #4 (cytology
  unread, biopsy unread)
- "post-treatment outcome" → maps to trigger #5 (positive biopsy no treatment)
  and post-treatment monitoring schedule
- "monitoring repeat exam" → maps to trigger #3 (positive result no follow-up)

The form also captures **outcome of the recall attempt** — whether the
patient came in, and if not what action was taken. This is the **substrate
for the CXCAServiceNotRequested NotDone profile** in cxca's L3.

L2 anchor: `forms[id=ЭИМ-5е]` — also informs `recall_triggers` and
`pilot_evidence.l3_implication`

---

## Translator's notes

1. **No ЭИМ-5.1 or ЭИМ-5.2 form templates appear in Annex 1.** The two
   summary records (ЭИМ-5.1 = primary care, ЭИМ-5.2 = secondary care) are
   referenced in figures 2.3, 2.4, 2.5 as form codes but **no Annex 1 page
   shows them as standalone form templates.** This may mean they are
   ambulatory-card sections or compiled records rather than standalone
   forms. Worth verifying with an SME.

2. **Form structure is heavily checkbox-driven.** Most fields offer
   pre-printed multiple-choice options. This is implementation-friendly for
   a future Questionnaire — the fields are already enumerated.

3. **National Registration Number ("Регистрийн дугаар") is the universal
   patient identifier** across all forms. This would be the natural
   `Patient.identifier` value in any L3 representation.

4. **Email-as-result-channel.** Most forms include a "shinjilgeenii hariug
   khleen avah tsakhim hayag" (email to receive test results) field. This
   is a 2020-era expectation that the screening result will be returned
   electronically, even when the form itself is paper.

5. **Кольпоскопи (Colposcopy)** field on ЭИМ-5б and ЭИМ-5в has a "ХПВ" (HPV)
   checkbox option — meaning visual evidence of HPV infection on colposcopy.
   This is observational, not a result of HPV testing. Worth noting for
   any future L3 representation that distinguishes these data sources.
