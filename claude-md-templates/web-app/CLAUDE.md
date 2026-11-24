# Project: <name> — web app (Next.js / React + Node)

## Commands
- Install: `npm ci`
- Dev server: `npm run dev` (http://localhost:3000)
- Tests: `npm test` — run the related test file after every change
- Lint + types: `npm run lint && npm run typecheck` — must pass before you finish

## Architecture
- `app/` — routes and pages; `components/` — shared UI; `lib/` — business logic, no React here
- API routes live in `app/api/*/route.ts`; database access only through `lib/db/`
- State: server components by default; client components only when you need interactivity

## Conventions
- TypeScript strict; no `any` without a comment explaining why
- 2-space indentation, named exports, one component per file
- Styling: Tailwind utility classes; no inline styles
- Every new API route gets input validation with `zod`

## Don't
- Don't edit `.env*`, `package-lock.json` or generated files in `.next/`
- Don't add dependencies without asking first
- Don't commit; I review and commit myself

## More context
- API conventions: @docs/api-conventions.md
