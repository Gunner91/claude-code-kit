# Notification hook for Windows. In settings.json:
#   "command": "powershell.exe -NoProfile -ExecutionPolicy Bypass -File .claude/hooks/notify-desktop.ps1"
$data = [Console]::In.ReadToEnd() | ConvertFrom-Json
$msg = if ($data.message) { $data.message } else { 'Claude Code needs your attention' }
Add-Type -AssemblyName System.Windows.Forms
$n = New-Object System.Windows.Forms.NotifyIcon
$n.Icon = [System.Drawing.SystemIcons]::Information
$n.Visible = $true
$n.ShowBalloonTip(5000, 'Claude Code', $msg, [System.Windows.Forms.ToolTipIcon]::Info)
Start-Sleep -Seconds 6
$n.Dispose()
