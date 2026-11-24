# Claude Code Kit

Ready-to-use configuration for [Claude Code](https://code.claude.com/docs): **10 skills, 10 hooks, 8 subagents, MCP examples and a project starter** with safe permissions. Copy what you need into your project and adjust.

Maintained by [Vladyslav Koshelyev (KRIATIZ)](https://kriatiz.com/en/) — full-stack developer and AI engineer. Every folder links to a step-by-step guide (English, Ukrainian, Russian).

| Folder | What's inside | Guide |
|---|---|---|
| [`starter-kit/`](starter-kit) | `CLAUDE.md` template, `.claude/settings.json` with allow/ask/deny permissions, two hooks, a review subagent, 3 skills, `.mcp.json` | [Install and safe setup](https://kriatiz.com/en/blog/claude-code-install-setup/) |
| [`skills/`](skills) | 10 skills: commit messages, tests, bug hunting, API docs, changelog, security check, SEO meta, landing copy, i18n, codebase onboarding | [How Claude Code skills work](https://kriatiz.com/en/blog/claude-code-skills/) |
| [`hooks/`](hooks) | 10 hooks: block dangerous commands, protect `.env`, auto-format, audit log, desktop/Telegram notifications, secrets guard, tests before stop, backup before compaction | [Claude Code hooks guide](https://kriatiz.com/en/blog/claude-code-hooks/) |
| [`subagents/`](subagents) | 8 subagents: code reviewer, debugger, test runner, security auditor, refactor planner, researcher, docs writer, copywriter | [Subagents guide](https://kriatiz.com/en/blog/claude-code-subagents/) |
| [`mcp/`](mcp) | `.mcp.json` example (GitHub, Linear, Notion, Sentry, Supabase, Playwright) and a cheat sheet of `claude mcp` commands | [MCP servers guide](https://kriatiz.com/en/blog/claude-code-mcp/) |

## Quick start

```bash
git clone https://github.com/Gunner91/claude-code-kit.git
cp -r claude-code-kit/starter-kit/. your-project/        # starter config
cp -r claude-code-kit/skills/write-tests your-project/.claude/skills/   # any single skill
chmod +x your-project/.claude/hooks/*.sh                 # macOS / Linux
```

Then open the project in Claude Code and check what's active with `/skills`, `/hooks`, `/agents` and `/mcp`.

## Skills

| Skill | Use it to |
|---|---|
| `commit-message` | write a Conventional Commits message for staged changes |
| `write-tests` | add tests for a file, function or recent change in your project's style |
| `bug-hunt` | find a root cause: reproduce → hypotheses → verify → fix → regression test |
| `api-docs` | generate API documentation from the source code |
| `changelog` | produce release notes from git history |
| `security-check` | review changes for secrets, injection, auth and input-handling issues |
| `seo-meta` | write titles, meta descriptions, Open Graph tags and JSON-LD |
| `landing-copy` | draft conversion-focused landing page copy |
| `translate-i18n` | translate localization files while keeping keys and placeholders |
| `explain-codebase` | create an onboarding map of an unfamiliar repository |

## Hooks

See [`hooks/README.md`](hooks/README.md) for the event and matcher of each script. They need `bash` and `jq` (or `python3`); Windows users can run Claude Code from Git Bash or use the `.ps1` variants.

> Hooks run shell commands on your machine. Read each script before enabling it.

## Subagents

Copy files from `subagents/.claude/agents/` to `.claude/agents/` (project) or `~/.claude/agents/` (all projects). Claude delegates to them automatically based on the `description`, or you can ask for one by name.

## Other languages

- 🇺🇦 Українською: гайди з налаштування Claude Code — [kriatiz.com/ua/blog](https://kriatiz.com/ua/blog/)
- 🇷🇺 На русском: гайды по настройке Claude Code — [kriatiz.com/blog](https://kriatiz.com/blog/)

## Need help?

I set up Claude Code, AI agents and automations for teams and businesses — [kriatiz.com](https://kriatiz.com/en/) · Telegram [@vladkoshelev](https://t.me/vladkoshelev).

## License

[MIT](LICENSE) — free to use, modify and share.
