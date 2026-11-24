#!/usr/bin/env bash
# PostToolUse (matcher: Bash) — audit log of every shell command Claude ran, with time and folder.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
mkdir -p "$HOME/.claude"
printf '%s\t%s\t%s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$(j .cwd)" "$(j .tool_input.command)" >> "$HOME/.claude/command-log.txt"
exit 0
