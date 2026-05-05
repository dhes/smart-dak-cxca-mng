# Upstream PR Backlog

Issues found while building cxca that should be filed back to upstream WHO repos. Tracked here so they don't get lost in the cxca momentum. Each entry includes the upstream repo, the exact change, the symptom in cxca, and when it was discovered.

When an entry is filed upstream, move it to **Filed** and add the PR/issue link. When merged, move to **Merged**.

---

## Open

### 4. `path-binary: input/cql` not declared in smart-dak-empty's `sushi-config.yaml`

- **Upstream repo:** [`WorldHealthOrganization/smart-dak-empty`](https://github.com/WorldHealthOrganization/smart-dak-empty)
- **File:** `sushi-config.yaml`, the `parameters:` block
- **Change:** add `path-binary:` and `path-pages:` entries for `input/cql` (mirroring how IMMZ does it):
  ```yaml
  parameters:
    path-pages:
    - ...existing entries...
    - input/cql
    path-binary:
    - input/cql
  ```
- **Symptom:** Without these parameters, any DAK that adds CQL to `input/cql/` and a Library FSH wrapper using the `LogicLibrary` ruleset will fail validation with `Library.content[0]: Cannot invoke "Attachment.getData()" because "a" is null`, plus two cascading errors about missing CQL content. The IG publisher's `ig-loader` mechanism cannot find the .cql file because `input/cql/` isn't registered as a binary source path.
- **Discovered:** 2026-05-05, fourth cxca build (after first attempt to wire CQL Library).
- **cxca local fix:** applied in `sushi-config.yaml` 2026-05-05 — added `input/cql` to both `path-binary` and `path-pages`.
- **Note:** the empty starter is supposed to be a starting point for SMART DAKs; CQL is one of the most important artifact types in a DAK. This is a real onboarding wall — anyone using smart-dak-empty to start a DAK that includes CQL will hit it.

### 1. `<static_server_port>` not HTML-escaped in `testing.md`

- **Upstream repo:** [`WorldHealthOrganization/smart-dak-empty`](https://github.com/WorldHealthOrganization/smart-dak-empty)
- **File:** `input/pagecontent/testing.md`, lines 35 and 44 (or equivalent in current upstream)
- **Change:** `<static_server_port>` → `&lt;static_server_port&gt;` (both occurrences)
- **Symptom:** IG publisher reports `Internal error: Illegal HTML: illegal html element: static_server_port` and the build emits an error in `qa.html` against `output/testing.html`. The angle brackets are parsed as an HTML element by the publisher's validator.
- **Discovered:** 2026-05-04, first cxca empty build (Phase 1 validation).
- **cxca local fix:** applied in `input/pagecontent/testing.md` 2026-05-04.

### 3. Windows file path leaked into `SGImplementationGuide` profile metadata

- **Upstream repo:** [`WorldHealthOrganization/smart-base`](https://github.com/WorldHealthOrganization/smart-base)
- **File:** the published `StructureDefinition-SGImplementationGuide.json` (or its source FSH) — specifically a reference URL inside the profile's narrative or text content
- **Symptom:** Any IG that depends on `smart.who.int.base@0.2.0` and declares `meta.profile = SGImplementationGuide` gets the validation error `The URL is not valid because '(URL contains 6 Invalid Characters: '\')': file://C:\work\ImplementationGuides\ig-release\who\smart-base\output/StructureDefinition-SGImplementationGuide.html`. The file path indicates the SGImplementationGuide profile was published from a Windows build environment, and the Windows-style path leaked into the profile's text/narrative reference URLs. URLs in FHIR resources must be valid URIs; backslashes are not.
- **Likely root cause:** the smart-base CI/build process embeds file:// paths into the profile's `text.div` or a similar narrative field instead of resolving them to canonical HTTP URLs at publish time. Likely a template configuration issue or a Linux/Windows path-normalization bug in the IG publisher template that smart-base uses.
- **Discovered:** 2026-05-05, third cxca build (after SGImplementationGuide profile reference was corrected, allowing the validator to actually load and check the profile).
- **cxca local fix:** none possible — this is in the upstream profile metadata. The error will persist in any cxca build until smart-base republishes with a corrected profile. Could be suppressed via `input/ignoreWarnings.txt` if it becomes blocking, but the right fix is upstream.

### 2. `SMARTImplementationGuide` should be `SGImplementationGuide` in `sushi-config.yaml`

- **Upstream repo:** [`WorldHealthOrganization/smart-dak-empty`](https://github.com/WorldHealthOrganization/smart-dak-empty)
- **File:** `sushi-config.yaml`, the `meta.profile` block
- **Change:** `SMARTImplementationGuide` → `http://smart.who.int/base/StructureDefinition/SGImplementationGuide`
- **Symptom:** IG publisher reports two warnings: `A definition could not be found for Canonical URL 'SMARTImplementationGuide'` and `Profile reference '...' has not been checked because it could not be found`. The actual profile shipped by `smart.who.int.base@0.2.0` is named `SGImplementationGuide` (visible in [smart-base/input/fsh/profiles/](https://github.com/WorldHealthOrganization/smart-base/tree/main/input/fsh/profiles)); `smart-base-clinical`'s own `sushi-config.yaml` uses the correct name. So this is a stale reference in the empty starter.
- **Discovered:** 2026-05-05, second cxca build (after Phase 1 errors cleared).
- **cxca local fix:** applied in `sushi-config.yaml` 2026-05-05.
- **Note:** the upstream fix should also use the absolute URL form (`http://smart.who.int/base/StructureDefinition/SGImplementationGuide`), not the bare name, to satisfy the publisher's "Canonical URLs must be absolute" rule.

---

## Filed

*(none yet)*

---

## Merged

*(none yet)*
