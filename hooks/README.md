# 10 Claude Code hooks — kriatiz.com

Copy `.claude/hooks/` into your project, make scripts executable (`chmod +x .claude/hooks/*.sh`),
then merge the parts you want from `.claude/settings.hooks.example.json` into `.claude/settings.json`
(or `~/.claude/settings.json` for all projects). Check active hooks with `/hooks`.

Requires bash and `jq` (or python3). Windows: run Claude Code with Git Bash, or use the `.ps1` variants.

| Script | Event | What it does |
|---|---|---|
| block-dangerous.sh | PreToolUse · Bash | blocks rm -rf /, force push, reset --hard, DROP TABLE, curl\|bash |
| protect-files.sh | PreToolUse · Edit\|Write | protects .env, lock files, .git/, keys |
| format-file.sh | PostToolUse · Edit\|Write | Prettier / Black / gofmt / php-cs-fixer after edits |
| log-commands.sh | PostToolUse · Bash | audit log in ~/.claude/command-log.txt |
| notify-desktop.sh / .ps1 | Notification | desktop notification when Claude needs you |
| notify-telegram.sh | Notification + Stop | Telegram message: needs input / task finished |
| session-context.sh | SessionStart | branch, uncommitted files, recent commits into context |
| prompt-secrets-guard.sh | UserPromptSubmit | blocks prompts containing API keys or private keys |
| tests-before-stop.sh | Stop | runs tests before finishing; keeps working if they fail |
| backup-before-compact.sh | PreCompact | backs up the transcript before compaction |

Guides (EN/UA/RU): https://kriatiz.com/en/blog/claude-code-hooks/ · Telegram @vladkoshelev
