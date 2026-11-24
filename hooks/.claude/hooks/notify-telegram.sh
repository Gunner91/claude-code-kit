#!/usr/bin/env bash
# Notification + Stop — sends a Telegram message when Claude needs input or finishes a task.
# Setup: create a bot with @BotFather, get your chat id from @userinfobot, then export
#   CLAUDE_TG_TOKEN=123456:ABC...   CLAUDE_TG_CHAT=123456789   (e.g. in ~/.bashrc or settings.json "env")
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
[ -n "$CLAUDE_TG_TOKEN" ] && [ -n "$CLAUDE_TG_CHAT" ] || exit 0
event="$(j .hook_event_name)"
project="$(basename "$(j .cwd)")"
if [ "$event" = "Stop" ]; then
  last="$(j .last_assistant_message | head -c 600)"
  text="✅ Claude Code finished in ${project}"$'\n\n'"${last}"
else
  text="🔔 Claude Code (${project}): $(j .message)"
fi
curl -s -m 10 "https://api.telegram.org/bot${CLAUDE_TG_TOKEN}/sendMessage" \
  --data-urlencode "chat_id=${CLAUDE_TG_CHAT}" --data-urlencode "text=${text}" >/dev/null 2>&1
exit 0
