<#
.SYNOPSIS
    Universal AI-DNA Bootstrap Script.
    Initializes the environment and checks for prerequisites.
#>

$AppRootDir = "$HOME\.gemini\antigravity"
$KnowledgeDir = "$AppRootDir\knowledge"

Write-Host "`n[ INITIALIZING UNIVERSAL AI-DNA ]" -ForegroundColor Cyan

# 1. System Requirements Check
function Check-Requirement ($Command, $Name) {
    if (Get-Command $Command -ErrorAction SilentlyContinue) {
        Write-Host "[OK] $Name is installed" -ForegroundColor Green
    } else {
        Write-Host "[!] $Name NOT FOUND. Please install it." -ForegroundColor Red
    }
}

Check-Requirement "node" "Node.js"
Check-Requirement "git" "Git"
Check-Requirement "docker" "Docker"

# 2. Sync Core Assets
$SourceDir = "$PSScriptRoot\.."
$KnowledgeSource = "$SourceDir\knowledge"

if (-not (Test-Path $KnowledgeDir)) { New-Item -ItemType Directory -Path $KnowledgeDir -Force | Out-Null }

Write-Host "`n[ SYNCING PROTOCOLS ]" -ForegroundColor Cyan
Copy-Item "$SourceDir\CORE_PROTOCOL.md" "$KnowledgeDir\CORE_PROTOCOL.md" -Force
Copy-Item "$SourceDir\projects_registry.md" "$KnowledgeDir\projects_registry.md" -Force

if (Test-Path $KnowledgeSource) {
    Get-ChildItem $KnowledgeSource -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName "$KnowledgeDir\$($_.Name)" -Force
        Write-Host "[*] Synced: $($_.Name)"
    }
}

Write-Host "`n[SUCCESS] Environment Standardized." -ForegroundColor Green
Write-Host "Action: Read CORE_PROTOCOL.md before starting any project." -ForegroundColor Yellow
