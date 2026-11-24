# Claude Code MCP — commands (kriatiz.com, checked 2026-11-24)

Always double-check the vendor's docs: endpoints change.

## Add servers
claude mcp add --transport http notion https://mcp.notion.com/mcp
claude mcp add --transport http github https://api.githubcopilot.com/mcp/ --header "Authorization: Bearer YOUR_GITHUB_PAT"
claude mcp add --transport http linear https://mcp.linear.app/mcp
claude mcp add --transport http sentry https://mcp.sentry.dev/mcp
claude mcp add --transport http vercel https://mcp.vercel.com
claude mcp add --scope project --transport http supabase "https://mcp.supabase.com/mcp?read_only=true"
claude mcp add --transport http figma https://mcp.figma.com/mcp
claude mcp add --transport http context7 https://mcp.context7.com/mcp --header "Authorization: Bearer YOUR_CONTEXT7_KEY"
claude mcp add --transport http stripe https://mcp.stripe.com
claude mcp add --transport http hubspot --scope user https://mcp.hubspot.com/anthropic
claude mcp add playwright npx @playwright/mcp@latest
claude mcp add --transport stdio db -- npx -y @bytebase/dbhub --dsn "postgresql://readonly:pass@host:5432/db"

## Manage
claude mcp list              # status of all servers
claude mcp get <name>
claude mcp remove <name>     # add --scope if needed
claude mcp login <name>      # OAuth in the browser (or /mcp inside a session)
claude mcp reset-project-choices
/mcp                         # in session: status, authenticate, enable/disable

## Scopes
-s local    (default)  only you, this project      -> ~/.claude.json
-s project             team, committed            -> .mcp.json
-s user                you, all projects          -> ~/.claude.json

## Useful
@server:protocol://path        reference an MCP resource, e.g. @github:issue://123
/mcp__server__prompt args      run an MCP prompt
MAX_MCP_OUTPUT_TOKENS=50000    raise the tool output limit (default 25000)
ENABLE_TOOL_SEARCH=auto        defer MCP tool definitions until needed
