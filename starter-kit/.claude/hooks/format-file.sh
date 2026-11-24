#!/usr/bin/env bash
# PostToolUse hook (kriatiz.com starter kit): formats a file right after Claude edits it.
# Uses Prettier for web files and Black for Python if they are installed. Never fails the edit.

file="$(cat | jq -r '.tool_input.file_path // empty')"
[ -z "$file" ] || [ ! -f "$file" ] && exit 0

case "$file" in
  *.js|*.jsx|*.ts|*.tsx|*.css|*.scss|*.json|*.md|*.html|*.vue)
    command -v npx >/dev/null 2>&1 && npx --no-install prettier --write "$file" >/dev/null 2>&1 ;;
  *.py)
    command -v black >/dev/null 2>&1 && black -q "$file" ;;
esac
exit 0
