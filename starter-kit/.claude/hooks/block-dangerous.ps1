# PreToolUse hook for native Windows (kriatiz.com starter kit).
# In .claude/settings.json use:
#   "command": "powershell.exe -NoProfile -ExecutionPolicy Bypass -File .claude/hooks/block-dangerous.ps1"
# Exit code 2 blocks the tool call; the message on stderr is shown to Claude.

$data = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cmd = [string]$data.tool_input.command

$patterns = @(
  'rm\s+-[a-zA-Z]*r[a-zA-Z]*f?\s+(/|~|\*)(\s|$)',
  'Remove-Item\s+.*-Recurse.*-Force\s+(C:\\|\\|~|\*)',
  'git\s+push\s.*--force',
  'git\s+reset\s+--hard',
  'DROP\s+(TABLE|DATABASE)',
  'Format-Volume|format\s+[a-z]:'
)

foreach ($p in $patterns) {
  if ($cmd -match $p) {
    [Console]::Error.WriteLine("Blocked by block-dangerous.ps1: command matches '$p'. Ask the user to run it manually if it is really needed.")
    exit 2
  }
}
exit 0
