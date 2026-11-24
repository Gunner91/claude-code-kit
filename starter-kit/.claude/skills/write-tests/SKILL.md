---
name: write-tests
description: Writes or extends automated tests for a given file, function or recent change, following the project's existing test framework and style. Use when the user asks for tests or test coverage.
argument-hint: "[file, function or 'diff']"
---

Target: $ARGUMENTS (if empty, use the files changed in `git diff`).

1. Find the test framework and conventions: look at package.json / pyproject.toml / existing tests near the target. Mirror their structure, naming and helpers.
2. List the behaviours to cover before writing code:
   - the main happy path,
   - edge cases (empty input, limits, unicode, large values),
   - error paths (invalid input, failing dependencies),
   - any bug that was just fixed (regression test).
3. Write focused tests: one behaviour per test, descriptive names, no logic in tests, mock only external boundaries (network, time, filesystem).
4. Run the tests. If something fails, decide whether the test or the code is wrong — never weaken an assertion just to make it pass.
5. Report: what is covered, what is intentionally not covered, and the command to run the tests.
