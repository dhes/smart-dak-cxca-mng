# Annex 4 — Pre-cancer Pathology Classification + Annex 5 — Bethesda 2014

**L1 source:** MOH Order A/641 (2020), pp. 155–158 (Annex 4 spans 155–156;
Annex 5 begins 156, continues to ~158)
**Mongolian titles:**
- Хавсралт 4: Умайн хүзүүний хорт хавдар ба хавдрын урьдал эмгэгийн ангилал
- Хавсралт 5: Умайн хүзүүний эсийн шинжилгээний Бетесда ангилал 2014

**English titles:**
- Annex 4 — Cervical cancer and pre-cancer pathology classification
- Annex 5 — Bethesda 2014 cervical cytology classification

⚠️ **Fidelity disclaimer:** model-generated translation; Mongolian original is
authoritative. See `README.md` in this directory.

⚠️ **Two L2-critical findings in this section:**

1. **The L2's `result_code_mapping` is wrong on its third column.** The L2
   currently shows a Bethesda × CIN × **ICD-10** cross-tab and attributes
   it to "Annex 4 Table X.4." The actual Annex 4 Table X.4 is a Bethesda × CIN ×
   **WHO terminology** cross-tab. The ICD-10 mapping is in *Хүснэгт 2.2*
   (Ch. 2.3.3), not Annex 4.
2. **Annex 5 specifies Bethesda 2014 in detail**, including microbiology
   findings (Trichomonas, Candida, Bacterial vaginosis, Actinomyces, HSV,
   CMV) and reactive/inflammatory categorizations not currently captured
   in L2's `axes.cytology_result` enum.

---

## Annex 4 — Pre-cancer pathology classification (pp. 155–156)

### 4.1 Background — Multiple classification systems coexist

> **English translation (key paragraphs):**
>
> Internationally, multiple systems are in use for naming and classifying
> cervical cancer pre-cancer lesions based on cytology and histology
> (see Хүснэгт X.4.1). Unified information about the most commonly used
> classifications has been published in recent decades.
>
> **CIN system** (Хавтгай эсийн доторх неоплази / squamous intraepithelial
> neoplasia) was developed in 1968. It has degrees of dysplasia change:
> CIN1 (mild dysplasia), CIN2 (moderate dysplasia), and CIN3 (severe
> dysplasia). Although CIN classification is widely used internationally
> for cytology results, strictly speaking CIN is a tissue-exam
> classification.
>
> **Bethesda system** was created in 1990 at the National Cancer Institute
> (USA) and is used only for cytology-result conclusions (microscopic
> evaluation of slide samples). In Bethesda, CIN2 and CIN3 are merged into
> a single category called **HSIL** (High-grade Squamous Intraepithelial
> Lesion). This is because cytology cannot reliably distinguish CIN2 from
> CIN3. CIN1 is named **LSIL** (Low-grade Squamous Intraepithelial Lesion).
>
> Other Bethesda terms:
> - **ASC-H**: Atypical squamous cells, cannot exclude HSIL
> - **ASCUS**: Atypical squamous cells of undetermined significance
> - **CIN**: Squamous intraepithelial neoplasia of the cervix
> - **HSIL**: High-grade squamous intraepithelial lesion (squamous cell
>   severe injury)
> - **LSIL**: Low-grade squamous intraepithelial lesion (squamous cell mild
>   injury)
>
> The international **ICD** (International Classification of Diseases) is
> the standardized international system for coding causes of disease and
> mortality. The 10th revision is currently used in over 110 countries.
> The cervical-cancer dysplasia and new-lesion ICD codes follow the WHO
> consensus shown in the right-hand column of the table. CIN and LSIL/HSIL
> references are included in ICD. The more detailed **ICD oncology
> (ICD-O)** classification provides more granular codes including
> histopathology classifications.

```mongolian
[Mongolian explanatory paragraphs reproduced in source PDF p. 155]
```

### 4.2 Хүснэгт X.4 — Cytology × Histology × WHO terminology cross-tab (p. 156)

⚠️ **CORRECTION TO L2.** The third column is **WHO terminology** (ДЭМБ-ийн
тайлбарласан ангилал), NOT ICD-10 codes. ICD-10 codes are in Хүснэгт 2.2 (Ch.
2.3.3) — see [ch02-screening.md §2.3.3](ch02-screening.md).

> **English translation:**
>
> | Cytology conclusion | Cytology conclusion | Histology conclusion | WHO classification |
> |---|---|---|---|
> | **PAP** | **Bethesda** | **CIN** | **WHO descriptive** |
> | Class I | Normal | Normal | Normal |
> | Class II | ASCUS | Normal | Normal |
> | Class II | ASC-H | Normal | Normal |
> | Class III | LSIL | CIN1 with flat condyloma | Koilocytosis |
> | Class III | HSIL | CIN2 | Moderate dysplasia |
> | Class III | HSIL | CIN3 | Severe dysplasia |
> | Class IV | HSIL | CIN3 | Carcinoma in situ (CIS, Байран өмөн) |
> | Class V | Invasive cancer (Цөмөрсөн өмөн) | Invasive cancer | Invasive cancer |

```mongolian
Хүснэгт X.4: Хавдрын урьдал эмгэгийн эс ба эдийн шинжилгээний дүгнэлт

Эсийн шинжилгээний дүгнэлт            | Эдийн шинжилгээний дүгнэлт
ПАП       | Бетесда систем             | CIN                          | ДЭМБ-ийн тайлбарласан ангилал
──────────|────────────────────────────|──────────────────────────────|──────────────────────────────
Ангилал I | Хэвийн                     | Хэвийн                       | Хэвийн
Ангилал II| ASCUS                      | Хэвийн                       | Хэвийн
          | ASC-H                      | Хэвийн                       | Хэвийн
Ангилал III| LSIL                      | Хавтгай кондилома бүхий CIN1 | Койлоцитоз
Ангилал III| HSIL                      | CIN2                         | Дунд зэргийн гаж хувирал
Ангилал III| HSIL                      | CIN3                         | Хүнд зэргийн гаж хувирал
Ангилал IV | HSIL                      | CIN3                         | Байран өмөн
Ангилал V  | Цөмөрсөн өмөн             | Цөмөрсөн өмөн                | Цөмөрсөн өмөн
```

L2 anchor: `result_code_mapping` — needs split into:
- `result_code_mapping_icd10` (from Хүснэгт 2.2)
- `result_code_mapping_pap_bethesda_cin_who` (from Хүснэгт X.4)

---

## Annex 5 — Bethesda 2014 (pp. 156–158)

This annex defines the **complete Bethesda 2014 classification used by
Mongolia for cytology readings.** It significantly extends what the L2
currently captures in `axes.cytology_result` (which has only the squamous
cell categories).

### 5.1 Sample types

> - Conventional smear (Уламжлалт нааац, Pap түрхэц)
> - Liquid-based (Шингэнд суурилсан нааац)
> - Other (Бусад)

### 5.2 Sample adequacy (Шаардлага хангасан / хангаагүй)

> **Adequate** if:
> - Endocervical/transformation zone components present, OR other indicators
>   present, OR partially blood-stained
>
> **Inadequate** (with reason):
> - Slide returned without going through laboratory (reason)
> - Sample went through laboratory but cell content insufficient for
>   evaluation (reason)

### 5.3 General categorization (Ерөнхий ангилал — selectable)

> - Negative for intraepithelial lesion or malignancy
> - Other: descriptive findings (e.g., 45+ women's endometrial cells)
> - Atypical cell unknown findings: descriptive findings (squamous or
>   glandular cell sources, specify)

### 5.4 Тайлбар / Үр дүн (Description / Result)

#### 5.4.1 Negative for intraepithelial lesion or malignancy

> **Non-cancer cellular changes (Хавдрын бус эсийн өөрчлөлтүүд):**
> - Squamous cell metaplasia (Хавтгай эсийн метаплази)
> - Keratinization changes (Эвэршилтийн өөрчлөлтүүд)
> - Tubal metaplasia (Гууран хоолойн метаплази)
> - Atrophy (Атрофи)
> - Pregnancy-related changes (Жирэмсэнтэй холбоот өөрчлөлтүүд)
>
> **Cell reactive changes (Эсийн урвалжит өөрчлөлтүүд):**
> - Inflammation (with regenerative tissue) (Үрэвсэл — нөхөн төлжилтийг
>   агуулна)
> - Lymphocytic (follicular) cervicitis (Лимфоцитын/фолликулын цервицит)
> - Radiation-related changes (Туяаны өөрчлөлт)
> - IUD-related changes (Ерөндөг)
> - Post-hysterectomy glandular cellular state (Умай авахуулсны дараах
>   булчирхайлаг эсийн байдал)

#### 5.4.2 Microorganisms (Бичил биетэн)

⚠️ **Currently missing from L2.** A/641 explicitly enumerates microorganism
findings on cytology. These would be relevant if the L3 ever includes
co-detection of pelvic infections during screening.

> - Trichomonas vaginalis (Трихомонад вагиналис)
> - Mycelial morphology suggestive of Candida spp. (Мөөгөнцрийн бичил биетэн,
>   морфологиор Кандида спп.)
> - Bacterial vaginosis suggested by flora shift (Флор дахь шифт, бактерийн
>   вагинозыг санагдуулах)
> - Bacteria suggestive of Actinomyces spp. (Бактер, морфологиор
>   Актиномикоз спп.)
> - Cellular changes suggesting herpes virus (Эс дэх өөрчлөлт херпес
>   вирусийг санагдуулах)
> - Cellular changes suggesting cytomegalovirus (Эс дэх өөрчлөлт
>   цитомегаловирусийг санагдуулах)

#### 5.4.3 Other (Бусад)

> - Endometrial cells (45+ year-old woman) — Эндометрийн эсүүд (45-с дээш
>   насны эмэгтэй) — *if absence of squamous cell intraepithelial lesion,
>   indicate*

### 5.5 Squamous cell categorization (Хучуур эсийн хэвшинжгүйдэл) — Squamous lineage

> - Atypical squamous cells (Хэвшинжгүй хавтгай эс):
>   - Of undetermined significance (Өөрчлөлт нь тодорхой бус, ASCUS)
>   - Cannot exclude HSIL (HSIL байхыг үгүйсгэхгүй, ASC-H)
> - LSIL (хавтгай хучуур эсийн хөнгөн гэмтэц) — Includes HPV / mild dysplasia / CIN1
> - HSIL (хавтгай хучуур эсийн хүнд гэмтэц) — Includes moderate and severe
>   dysplasia, CIS, CIN2 and CIN3
> - Suspicious for invasion / algorithm-suspicious (Цөмрөлтийн сэжигтэй
>   алгоритмтай — хэрвээ цөмрөлтийг сэжиглэж байвал)

### 5.6 Glandular cell categorization (Булчирхайлаг эс) — p. 158

> **Atypical (unknown significance) — Хэвшинжгүй:**
> - Endocervical cells (specify if not otherwise noted)
> - Endometrial cells (specify if not otherwise noted)
> - Glandular cells, other type (specify if not otherwise noted)
>
> **Atypical (neoplasia-suspected) — Хэвшинжгүй:**
> - Endocervical cells, neoplasia (Эндоцервикал эсүүд, неоплази)
> - Glandular cells, neoplasia (Булчирхайлаг эсүүд, неоплази)
>
> **Glandular cell carcinoma in situ (Булчирхайлаг эсийн байран хавдар) =**
> AIS (Adenocarcinoma in situ; БЭБӨ in Mongolian abbreviation)
>
> **Glandular cell invasive cancer (Булчирхайлаг эсийн цөмөрсөн хавдар)** —
> with specification of origin:
> - Endocervical
> - Endometrial
> - Outside uterus (Умайн гаднах)
> - Specify if unable to determine
>
> **Other malignancies — Бусад хорт хавдрууд:** specify

⚠️ **L2 has the wrong axis structure.** The current L2's `axes.cytology_result`
enum is `[NILM, ASC-US, ASC-H, LSIL, HSIL, AGC]` — collapsing all glandular
findings to a single `AGC` token. The source actually has FIVE distinct
glandular categories (atypical/atypical-neoplasia-suspected × endocervical /
endometrial / glandular-other) plus AIS and invasive — so seven distinct
glandular states. The L2's `AGC` is shorthand that loses information.

L2 anchor: `axes.cytology_result` — needs expansion to enumerate Bethesda 2014
categories more fully. Or, alternatively, leave `cytology_result` as the
*algorithm-decision-relevant* roll-up and add a separate
`bethesda_2014_findings` axis for the full classification.

L2 anchor: `axes.cytology_result` — needs expansion to include
non-cancer/reactive/microorganism categories. Or, alternatively, leave the
axis enumerated only for screening-decision-relevant categories (the
current squamous/AGC enumeration) and add a separate `cytology_findings`
axis for the descriptive findings.

---

## Translator's notes

1. **Two cross-tabs, not one.** The L2 currently has a single
   `result_code_mapping` section with Bethesda × CIN × ICD-10. This needs
   to be split. The ICD-10 codes (Z01.4, Z12.4, N86, N87.x, N88.x, D06,
   C53.x) are from Хүснэгт 2.2 and represent **clinical encounter coding**
   (screening visit vs. diagnosis). The Bethesda × CIN × WHO terminology
   table (Хүснэгт X.4) represents **lab-result interpretation hierarchy**.
   They serve different purposes; both are L2-relevant.

2. **WHO terminology column** uses descriptive English-medical terms
   (Mild/Moderate/Severe dysplasia, Carcinoma in situ, Invasive cancer)
   rather than codes. This is the bridge that allows different national
   classification traditions to interoperate.

3. **Microorganism findings on cytology** are an under-appreciated
   side-output of the screening test. A patient screened for cervical
   cancer may also have evidence of Trichomonas, Candida, BV, etc. detected
   incidentally. A/641 captures these explicitly. Worth flagging if cxca
   future scope extends to STI/co-infection management.

4. **Mongolian uses "Цөмөрсөн өмөн" for "invasive cancer."** The literal
   translation is "swelling/lesion that has 'broken through'" — referring
   to invasion past the basement membrane. Worth preserving the source
   terminology in any L3 displayName mapping.

5. **PAP "Class I" through "Class V" is the older Papanicolaou
   classification system**, distinct from the Bethesda system. A/641's
   X.4 cross-tab maps both, suggesting that in 2020 some Mongolian labs
   may have still been using the PAP class system. By 2026 this is
   probably obsolete in favor of pure Bethesda — worth verifying.
