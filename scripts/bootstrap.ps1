<#
.SYNOPSIS
    Ultimate AI-DNA Setup Bot (Aggressive Mode).
    Enforces rules globally and locally.
#>

$AppRootDir = "$HOME\.gemini\antigravity"
$KnowledgeDir = "$AppRootDir\knowledge"
$ProtocolFile = "$PSScriptRoot\..\CORE_PROTOCOL.md"

# 1. Global AI Rules Path (for Cline/VSCode)
$GlobalRulesPaths = @(
    "$env:APPDATA\Code\User\globalStorage\saoudrizwan.claude-dev\settings\clinerules",
    "$env:APPDATA\Cursor\User\globalStorage\saoudrizwan.claude-dev\settings\clinerules"
)

Write-Host "`n[ ENFORCING GLOBAL PROTOCOL ]" -ForegroundColor Cyan

# Read the prefix rule from protocol
$PrefixRule = "CRITICAL: ALWAYS start every response with 'I remember.' Check $KnowledgeDir\CORE_PROTOCOL.md for full instructions."

foreach ($path in $GlobalRulesPaths) {
    $dir = Split-Path $path
    if (Test-Path $dir) {
        $PrefixRule | Out-File -FilePath $path -Encoding utf8 -Force
        Write-Host "[!] Global rules enforced at: $path" -ForegroundColor Green
    }
}

# 2. Sync Knowledge Files
Write-Host "`n[ SYNCING KNOWLEDGE BASE ]" -ForegroundColor Yellow
if (-not (Test-Path $KnowledgeDir)) { New-Item -ItemType Directory -Path $KnowledgeDir -Force | Out-Null }
Copy-Item "$PSScriptRoot\..\CORE_PROTOCOL.md" "$KnowledgeDir\CORE_PROTOCOL.md" -Force
Copy-Item "$PSScriptRoot\..\projects_registry.md" "$KnowledgeDir\projects_registry.md" -Force
Copy-Item "$PSScriptRoot\..\knowledge\*" "$KnowledgeDir\" -Force -Recurse

# 3. Create Local Rules for Every Project
$ConfigPath = "$PSScriptRoot\..\configs\setup_config.json"
$Config = Get-Content $ConfigPath | ConvertFrom-Json

Write-Host "`n[ INJECTING RULES INTO PROJECTS ]" -ForegroundColor Yellow
$Projects = Get-ChildItem $Config.workDir -Directory
foreach ($proj in $Projects) {
    $RulePath = Join-Path $proj.FullName ".clinerules"
    $PrefixRule | Out-File -FilePath $RulePath -Encoding utf8 -Force
    Write-Host "[+] Injected rules into: $($proj.Name)"
}

Write-Host "`n[ SUCCESS ] Rules are now GLOBALLY and LOCALLY enforced." -ForegroundColor Green
