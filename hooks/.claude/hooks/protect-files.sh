#!/usr/bin/env bash
# PreToolUse (matcher: Edit|Write) — stops Claude from editing secrets, lock files and .git internals.
# Note: this guards the Edit/Write tools; also deny Bash access to these paths in permissions.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
f="$(j .tool_input.file_path)"
f="${f//\\//}"   # normalise Windows backslashes
for p in '.env' '.env.' 'package-lock.json' 'yarn.lock' 'pnpm-lock.yaml' 'composer.lock' '.git/' 'secrets/' '.pem' 'id_rsa'; do
  case "$f" in *"$p"*)
    echo "Blocked: $f is protected (matches '$p'). Change it manually or ask the user." >&2
    exit 2 ;;
  esac
done
exit 0
