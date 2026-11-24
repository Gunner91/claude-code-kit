---
name: commit-message
description: Writes a clear Conventional Commits message for the currently staged changes. Use when the user asks to commit or to write a commit message.
disable-model-invocation: true
allowed-tools: Bash(git diff *) Bash(git status *) Bash(git commit *)
argument-hint: "[optional context, e.g. ticket number]"
---

## Staged changes
!`git diff --cached --stat`

!`git diff --cached`

## Task
Write ONE commit message for the staged changes above.

Format (Conventional Commits):
```
<type>(<scope>): <summary in imperative mood, max 72 chars>

<body: what changed and WHY, wrapped at 72 chars, 1-5 lines>

<footer: BREAKING CHANGE: ... / Refs: $ARGUMENTS>
```
- type: feat, fix, refactor, perf, docs, test, build, ci, chore.
- scope: the main module or folder touched; omit if the change is global.
- Do not describe every file — describe the intent.
- If nothing is staged, say so and suggest `git add -p`.

Show the message, then ask the user whether to run `git commit` with it.
