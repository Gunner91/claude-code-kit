# Project: <name>

<!-- Starter template from kriatiz.com. Keep this file under ~200 lines.
     Claude reads it at the start of every session. Delete what you don't need. -->

## What this project is
- One-paragraph description: what the product does and who uses it.
- Main stack: e.g. Next.js 15 + TypeScript, PostgreSQL, deployed with Docker.

## Commands
- Install: `npm install`
- Dev server: `npm run dev` (http://localhost:3000)
- Tests: `npm run test` — run a single file with `npm run test -- path/to/file.test.ts`
- Lint / format: `npm run lint`, `npm run format`
- Build: `npm run build`

## Project map
- `src/app/` — pages and routes
- `src/lib/` — shared logic; no UI code here
- `src/components/` — UI components, one component per file
- `tests/` — tests mirror the `src/` structure

## Code style
- TypeScript strict mode; no `any` without a comment explaining why.
- Prefer small pure functions; keep files under ~300 lines.
- Name things after the business domain, not the technology.
- Follow the existing patterns in neighbouring files before inventing new ones.

## Rules
- Never commit secrets. Configuration lives in `.env` (not in git); see `.env.example`.
- Before finishing a task: run lint and the tests that touch changed code.
- Do not edit generated files in `dist/` or `src/generated/`.
- Ask before adding a new dependency.
- Database changes go through migrations in `db/migrations/` only.

## Workflow
- For non-trivial changes, outline a short plan first, then implement.
- Make focused commits with clear messages (see the `commit-message` skill).

## More context (loaded on demand)
- Architecture notes: @docs/architecture.md
- API conventions: @docs/api.md

# Compact instructions
When compacting, keep: the current task, decisions made, files changed, failing tests and their errors.
