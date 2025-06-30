# === CONFIGURATION ===
$SourcePath = "\\10.153.68.53\eco1\Calidad\Calidad QA\Gagetrak"
$BackupRoot = "\\elceoaecofsp01.us.essilor.pvt\public\Gagetrak\ECO1 Backup"
$RetentionDays = 14

# === Get script directory reliably ===
$ScriptDir = $PSScriptRoot
if (-not $ScriptDir) {
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
}
if (-not $ScriptDir) {
    $ScriptDir = (Get-Location).Path  # fallback if run directly
}

$LogFile = Join-Path $ScriptDir "BackupLog.txt"

# === CREATE DATED BACKUP FOLDER ===
$DateStamp = Get-Date -Format "yyyy-MM-dd"
$BackupPath = Join-Path $BackupRoot $DateStamp
if (!(Test-Path -Path $BackupPath)) {
    New-Item -ItemType Directory -Path $BackupPath | Out-Null
}

# === COPY FILES ===
Copy-Item -Path $SourcePath -Destination $BackupPath -Recurse -Force -Container:$false

# === DELETE OLD BACKUPS ===
Get-ChildItem -Path $BackupRoot -Directory |
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays) } |
    Remove-Item -Recurse -Force

# === LOG ENTRY ===
"$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) - Backup completed to $BackupPath" | Out-File -Append -FilePath $LogFile