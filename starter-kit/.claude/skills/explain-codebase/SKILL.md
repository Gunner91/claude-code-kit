---
name: explain-codebase
description: Produces an onboarding map of the repository — architecture, main flows, where things live and how to run it. Use when someone is new to the project or asks how the codebase works.
context: fork
agent: Explore
---

Build a concise onboarding guide for this repository.

Investigate (read-only): README, package/dependency files, entry points, folder structure, configuration, tests, CI files.

Write the guide with these sections:
1. **What it is** — 2-3 sentences.
2. **Tech stack** — languages, frameworks, databases, hosting.
3. **Map** — the 8-15 most important folders/files with one line each.
4. **Main flows** — 2-4 key user or data flows traced through the code (file → function → file).
5. **How to run** — install, configure (.env keys without values), dev, test, build.
6. **Gotchas** — non-obvious conventions, generated code, fragile areas.
7. **Where to start** — 3 good first files to read.

Use file paths everywhere. Keep it under ~150 lines.
