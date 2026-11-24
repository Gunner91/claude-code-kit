#!/usr/bin/env bash
# SessionStart (matcher: startup|resume) — gives Claude the current git state at the start of a session.
# Plain stdout from a SessionStart hook is added to Claude's context.
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
echo "## Git state at session start"
echo "Branch: $(git branch --show-current)"
echo "Uncommitted changes:"
git status --short | head -n 30
echo "Recent commits:"
git log --oneline -n 8
exit 0
