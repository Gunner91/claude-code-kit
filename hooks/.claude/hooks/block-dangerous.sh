#!/usr/bin/env bash
# PreToolUse (matcher: Bash) — blocks destructive shell commands. Exit 2 = block; stderr goes to Claude.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
cmd="$(j .tool_input.command)"
for p in \
  'rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f?[[:space:]]+(/|~|\$HOME|\*)([[:space:]]|$)' \
  'git[[:space:]]+push[[:space:]].*--force' \
  'git[[:space:]]+reset[[:space:]]+--hard' \
  'DROP[[:space:]]+(TABLE|DATABASE)' \
  'mkfs|dd[[:space:]]+if=.*of=/dev/' \
  'curl[^|]*\|[[:space:]]*(sudo[[:space:]]+)?(bash|sh)'; do
  if printf '%s' "$cmd" | grep -Eiq "$p"; then
    echo "Blocked by block-dangerous.sh: command matches a dangerous pattern. Ask the user to run it manually if it is really needed." >&2
    exit 2
  fi
done
exit 0
