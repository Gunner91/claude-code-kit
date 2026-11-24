---
name: bug-hunt
description: Systematically finds the root cause of a bug — reproduce, form hypotheses, verify, fix and add a regression test. Use when something is broken and the cause is unclear.
argument-hint: "[bug description or error message]"
---

Bug: $ARGUMENTS

Follow these steps and show your reasoning briefly at each one:
1. **Reproduce** — find or write the smallest command/test that shows the bug. Do not guess fixes before you can reproduce.
2. **Gather evidence** — error messages, stack traces, logs, recent changes (`git log -p` on suspicious files).
3. **Hypotheses** — list 2-4 possible causes ranked by likelihood.
4. **Verify** — test the top hypothesis with the cheapest experiment (log, assertion, debugger). Eliminate, don't assume.
5. **Fix the root cause**, not the symptom. Keep the change minimal.
6. **Regression test** that fails before the fix and passes after.
7. **Summary** — cause, fix, how it was verified, any related risks.
