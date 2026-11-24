#!/usr/bin/env bash
# UserPromptSubmit — blocks prompts that contain something that looks like a secret key,
# so it never reaches the model or the transcript.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
prompt="$(j .prompt)"
if printf '%s' "$prompt" | grep -Eq '(sk-[A-Za-z0-9_-]{20,}|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{30,}|xox[baprs]-[A-Za-z0-9-]{10,}|-----BEGIN [A-Z ]*PRIVATE KEY-----|[0-9]{8,10}:[A-Za-z0-9_-]{35})'; then
  printf '{"decision":"block","reason":"Your prompt looks like it contains a secret key (API token or private key). Remove it and reference an environment variable instead."}\n'
  exit 0
fi
exit 0
