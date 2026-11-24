#!/usr/bin/env bash
# PreToolUse hook (kriatiz.com starter kit): blocks obviously destructive shell commands.
# Claude Code sends the tool call as JSON on stdin. Exit code 2 = block, and stderr is shown to Claude as the reason.
# Requires jq (https://jqlang.org). On Windows without Git Bash, use block-dangerous.ps1 instead.

input="$(cat)"
if command -v jq >/dev/null 2>&1; then
  cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty')"
elif command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1; then
  py="$(command -v python3 || command -v python)"
  cmd="$(printf '%s' "$input" | "$py" -c 'import sys,json; print(json.load(sys.stdin).get("tool_input",{}).get("command",""))')"
else
  echo "block-dangerous.sh: install jq or python to enable command checks" >&2
  exit 0
fi

patterns=(
  'rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f?[[:space:]]+(/|~|\$HOME|\*)([[:space:]]|$)'   # rm -rf / ~ *
  'git[[:space:]]+push[[:space:]].*--force'                                             # force push
  'git[[:space:]]+reset[[:space:]]+--hard'                                              # lose local work
  'DROP[[:space:]]+(TABLE|DATABASE)'                                                    # SQL drops
  'mkfs|dd[[:space:]]+if=.*of=/dev/'                                                    # disk wipes
  'curl[^|]*\|[[:space:]]*(sudo[[:space:]]+)?(bash|sh)'                                 # pipe-to-shell installs
)

for p in "${patterns[@]}"; do
  if printf '%s' "$cmd" | grep -Eiq "$p"; then
    echo "Blocked by .claude/hooks/block-dangerous.sh: the command matches a dangerous pattern ($p). Ask the user to run it manually if it is really needed." >&2
    exit 2
  fi
done
exit 0
