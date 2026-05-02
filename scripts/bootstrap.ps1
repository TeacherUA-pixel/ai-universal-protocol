<#
.SYNOPSIS
    Advanced Bootstrap script for AI Engineering Environment.
#>

$RepoUrl = "https://github.com/TeacherUA-pixel/ai-universal-protocol.git"
$AppRootDir = "$HOME\.gemini\antigravity"
$KnowledgeDir = "$AppRootDir\knowledge"

Write-Host "`n[ INITIALIZING AI-DNA ENVIRONMENT ]" -ForegroundColor Cyan
Write-Host "Device: $env:COMPUTERNAME" -ForegroundColor Gray

# 1. Directory Setup
if (-not (Test-Path $KnowledgeDir)) {
    New-Item -ItemType Directory -Path $KnowledgeDir -Force | Out-Null
    Write-Host "[+] Created knowledge directory"
}

# 2. Sync Protocol Files
$SourceDir = "$PSScriptRoot\.."
$FilesToSync = @("CORE_PROTOCOL.md", "README.md")

foreach ($file in $FilesToSync) {
    if (Test-Path "$SourceDir\$file") {
        Copy-Item "$SourceDir\$file" "$KnowledgeDir\$file" -Force
        Write-Host "[*] Synced Protocol: $file"
    }
}

# 3. Sync Knowledge Library
$KnowledgeSource = "$PSScriptRoot\..\knowledge"
if (Test-Path $KnowledgeSource) {
    Get-ChildItem -Path $KnowledgeSource -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName "$KnowledgeDir\$($_.Name)" -Force
        Write-Host "[*] Synced Knowledge: $($_.Name)"
    }
}

Write-Host "`n[SUCCESS] AI-DNA Protocol is now ACTIVE on this machine." -ForegroundColor Green
Write-Host "Action required: Ensure your AI Agent reads CORE_PROTOCOL.md before starting work." -ForegroundColor Yellow
