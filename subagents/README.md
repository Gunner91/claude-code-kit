# 8 Claude Code subagents — kriatiz.com

Copy the files into `.claude/agents/` (this project, share via git) or `~/.claude/agents/` (all projects).
Restart Claude Code if a new agent does not appear. Use them by asking, e.g.
"Use the code-reviewer subagent to review my changes" or "Run the tests with test-runner".

| Agent | Model | Tools | Job |
|---|---|---|---|
| code-reviewer | sonnet | read + git | reviews the diff by severity |
| test-runner | haiku | bash, read | runs tests, returns only failures |
| debugger | inherit | read, edit, bash | root-cause analysis + fix + regression test |
| security-auditor | sonnet | read-only | security audit table |
| docs-writer | sonnet | read, write | README / API docs from real code |
| researcher | sonnet | read + web | sourced answers and library comparisons |
| refactor-planner | opus | read-only | step-by-step refactoring plan |
| copywriter | sonnet | read, write, web | marketing copy without invented claims |

Guides (EN/UA/RU): https://kriatiz.com/en/blog/claude-code-subagents/ · Telegram @vladkoshelev
