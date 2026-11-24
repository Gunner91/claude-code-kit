---
name: translate-i18n
description: Translates localization files (JSON, YAML, .po, PHP arrays) into another language while preserving keys, placeholders and formatting. Use when adding a new language to an app or website.
argument-hint: "[source file] [target language]"
---

Source file: $0. Target language: $1.

Rules:
- Never change keys, structure, ordering or file format.
- Preserve placeholders and markup exactly: `{name}`, `%s`, `{{count}}`, `:attr`, `<b>…</b>`, `\n`, emoji.
- Respect pluralization rules of the target language (e.g. Ukrainian/Russian one/few/many).
- Keep UI strings short — similar length to the source so layouts don't break.
- Use the established terminology of the product; if a glossary file exists (glossary.md / terms.json), follow it.
- Do not translate brand names, code, URLs or email addresses.

Process: translate in chunks of ~100 strings, then validate the output parses (JSON/YAML) and that placeholder counts match the source for every key. Write the result next to the source using the project's naming convention (e.g. `en.json` → `uk.json`) and list any strings that need human review.
