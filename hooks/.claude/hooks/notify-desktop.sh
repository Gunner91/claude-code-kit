#!/usr/bin/env bash
# Notification (matcher: "") — desktop notification when Claude needs your attention (macOS / Linux).
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
msg="$(j .message)"; msg="${msg:-Claude Code needs your attention}"
if command -v osascript >/dev/null 2>&1; then
  osascript -e "display notification \"${msg//\"/}\" with title \"Claude Code\""
elif command -v notify-send >/dev/null 2>&1; then
  notify-send 'Claude Code' "$msg"
fi
exit 0
