#!/usr/bin/env bash
# PreCompact — saves a copy of the full transcript before Claude compacts the context.
# read hook input (JSON on stdin) with jq, or python as a fallback
INPUT="$(cat)"
j() { if command -v jq >/dev/null 2>&1; then printf '%s' "$INPUT" | jq -r "$1 // empty";
      else printf '%s' "$INPUT" | python3 -c "import sys,json
d=json.load(sys.stdin)
for k in sys.argv[1].lstrip('.').split('.'):
    d=d.get(k,'') if isinstance(d,dict) else ''
print(d if d is not None else '')" "$1"; fi; }
src="$(j .transcript_path)"
[ -f "$src" ] || exit 0
dir="$HOME/.claude/transcript-backups"; mkdir -p "$dir"
cp "$src" "$dir/$(date +%Y%m%d-%H%M%S)-$(j .trigger)-$(basename "$src")"
exit 0
