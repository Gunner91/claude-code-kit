---
name: security-check
description: Reviews the current changes for common security problems (secrets, injection, auth, unsafe input handling) and proposes fixes. Use before merging or deploying.
allowed-tools: Read Grep Glob Bash(git diff *)
---

Scope: the current diff (`git diff` + `git diff --cached`). If the user names files, review those.

Check for:
- **Secrets**: API keys, tokens, passwords, private keys, connection strings committed in code or config.
- **Injection**: SQL built by string concatenation, shell commands with user input, template injection, unsafe `eval`.
- **XSS**: user data rendered as HTML without escaping.
- **AuthN/AuthZ**: endpoints or actions missing permission checks; IDs taken from user input without ownership checks (IDOR).
- **SSRF / path traversal**: fetching user-supplied URLs; file paths built from input.
- **Dependencies**: newly added packages — are they well known and maintained?
- **Data exposure**: logging personal data or tokens; overly broad API responses.

Output a table: severity (Critical/High/Medium/Low), file:line, issue, fix. Then show code for the top fixes. If nothing is found, say so — do not invent issues.
