#!/usr/bin/env bash
# Stop — before Claude finishes, run the test suite; if tests fail, ask Claude to keep working.
# Set TEST_CMD (default: npm test --silent). Uses stop_hook_active to avoid endless loops.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
[ "$(j .stop_hook_active)" = "true" ] && exit 0
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
# only when code was changed in this repo
git diff --quiet 2>/dev/null && git diff --cached --quiet 2>/dev/null && exit 0
out="$(bash -c "${TEST_CMD:-npm test --silent}" 2>&1)"; code=$?
[ $code -eq 0 ] && exit 0
reason="Tests are failing. Fix them before finishing. Last output:
$(printf '%s' "$out" | tail -n 40)"
# build JSON safely (handles quotes, tabs, unicode)
if command -v jq >/dev/null 2>&1; then
  jq -n --arg r "$reason" '{decision:"block", reason:$r}'
else
  REASON="$reason" python3 -c 'import os,json; print(json.dumps({"decision":"block","reason":os.environ["REASON"]}))'
fi
exit 0
