<#
.SYNOPSIS
    Ultimate AI-DNA Setup Bot.
    One-click environment deployment for TeacherUA-pixel.
#>

$RepoUrl = "https://github.com/TeacherUA-pixel/ai-universal-protocol.git"
$AppRootDir = "$HOME\.gemini\antigravity"
$KnowledgeDir = "$AppRootDir\knowledge"

# Load config
$ConfigPath = "$PSScriptRoot\..\configs\setup_config.json"
$Config = Get-Content $ConfigPath | ConvertFrom-Json

Write-Host "`n[ STARTING ABSOLUTE AUTOMATION SETUP ]" -ForegroundColor Cyan

# 1. Create Workspace
if (-not (Test-Path $Config.workDir)) {
    New-Item -ItemType Directory -Path $Config.workDir -Force | Out-Null
    Write-Host "[+] Created Workspace: $($Config.workDir)"
}

# 2. Install VS Code Extensions
Write-Host "`n[ INSTALLING VS CODE EXTENSIONS ]" -ForegroundColor Yellow
foreach ($ext in $Config.vscodeExtensions) {
    Write-Host "[*] Installing $ext..."
    code --install-extension $ext --force | Out-Null
}

# 3. Synchronize Knowledge & Protocols
Write-Host "`n[ SYNCING AI-DNA PROTOCOLS ]" -ForegroundColor Yellow
if (-not (Test-Path $KnowledgeDir)) { New-Item -ItemType Directory -Path $KnowledgeDir -Force | Out-Null }
Copy-Item "$PSScriptRoot\..\CORE_PROTOCOL.md" "$KnowledgeDir\CORE_PROTOCOL.md" -Force
Copy-Item "$PSScriptRoot\..\projects_registry.md" "$KnowledgeDir\projects_registry.md" -Force
Copy-Item "$PSScriptRoot\..\knowledge\*" "$KnowledgeDir\" -Force -Recurse

# 4. Clone Projects from Registry
Write-Host "`n[ CLONING PROJECTS FROM REGISTRY ]" -ForegroundColor Yellow
cd $Config.workDir
# Simple parser for the projects_registry.md (looking for https links)
$Projects = Get-Content "$PSScriptRoot\..\projects_registry.md" | Select-String "https://github.com"
foreach ($p in $Projects) {
    $Url = $p.ToString().Split(" ")[-1].Trim()
    $Name = $Url.Split("/")[-1].Replace(".git", "")
    if (-not (Test-Path $Name)) {
        Write-Host "[+] Cloning $Name..."
        git clone $Url
    } else {
        Write-Host "[ok] $Name already exists, pulling updates..."
        cd $Name; git pull; cd ..
    }
}

Write-Host "`n[ SUCCESS ] THE ENVIRONMENT IS FULLY AUTOMATED AND READY." -ForegroundColor Green
Write-Host "Total projects synced: $($Projects.Count)" -ForegroundColor Gray
Write-Host "Final step: Copy MCP templates from configs/mcp_templates.md to your settings." -ForegroundColor Yellow
