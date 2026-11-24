#!/usr/bin/env bash
# PostToolUse (matcher: Edit|Write) — formats the edited file. Never fails the edit.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
f="$(j .tool_input.file_path)"
[ -n "$f" ] && [ -f "$f" ] || exit 0
case "$f" in
  *.js|*.jsx|*.ts|*.tsx|*.css|*.scss|*.json|*.md|*.html|*.vue|*.yaml|*.yml)
    command -v npx >/dev/null 2>&1 && npx --no-install prettier --write --ignore-unknown "$f" >/dev/null 2>&1 ;;
  *.py)  command -v black >/dev/null 2>&1 && black -q "$f" ;;
  *.go)  command -v gofmt >/dev/null 2>&1 && gofmt -w "$f" ;;
  *.php) command -v php-cs-fixer >/dev/null 2>&1 && php-cs-fixer fix -q "$f" ;;
esac
exit 0
