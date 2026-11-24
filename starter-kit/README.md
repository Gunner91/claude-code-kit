# Claude Code — kriatiz.com

EN · Free starter files for Claude Code by Vladyslav Koshelyev (KRIATIZ). Copy the contents into the root of your project. Guides: https://kriatiz.com/en/blog/

UA · Безкоштовні стартові файли для Claude Code від Владислава Кошелева (KRIATIZ). Скопіюйте вміст у корінь свого проєкту. Інструкції: https://kriatiz.com/ua/blog/

RU · Бесплатные стартовые файлы для Claude Code от Владислава Кошелева (KRIATIZ). Скопируйте содержимое в корень своего проекта. Инструкции: https://kriatiz.com/blog/

## Contents

- `CLAUDE.md` — project instructions template (edit it for your project).
- `.claude/settings.json` — safe permissions (allow / ask / deny) + two hooks.
- `.claude/hooks/block-dangerous.sh` — blocks destructive shell commands (needs `jq`).
- `.claude/hooks/block-dangerous.ps1` — the same for native Windows PowerShell.
- `.claude/hooks/format-file.sh` — formats files after edits (Prettier / Black if installed).
- `.claude/agents/code-reviewer.md` — a review subagent.
- `.claude/skills/` — skills: commit-message, write-tests, explain-codebase.
- `.mcp.json` — example MCP server config for the team.

macOS / Linux: run `chmod +x .claude/hooks/*.sh` after copying.

Need help setting up Claude Code or AI agents for your team? https://kriatiz.com · Telegram @vladkoshelev
