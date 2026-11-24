---
name: changelog
description: Generates a human-readable changelog or release notes from git history between two refs. Use when preparing a release or summarising what changed.
argument-hint: "[from-ref] [to-ref]"
allowed-tools: Bash(git log *) Bash(git tag *) Bash(git describe *)
---

Range: from `$0` to `$1`. If not given, use the latest tag to HEAD (`git describe --tags --abbrev=0`).

1. Read the commits: `git log <from>..<to> --no-merges --pretty=format:"%h %s%n%b"`.
2. Group them for humans, not by commit:
   - ✨ New features
   - 🐛 Fixes
   - ⚡ Performance
   - 🔧 Internal / maintenance (one line summary only)
   - ⚠️ Breaking changes (always first if any, with migration steps)
3. Rewrite each item in plain language from the user's point of view. Merge commits that are part of the same change.
4. Output Markdown ready to paste into CHANGELOG.md or a GitHub release, with the version and today's date as the heading.
