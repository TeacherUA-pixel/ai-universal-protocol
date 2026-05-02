<#
.SYNOPSIS
    One-click Update for AI-DNA Environment.
    Pulls latest changes from GitHub and re-runs bootstrap.
#>

Write-Host "`n[ CHECKING FOR UPDATES ON GITHUB ]" -ForegroundColor Cyan

# 1. Pull changes
git pull

if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] Updates downloaded successfully." -ForegroundColor Green
} else {
    Write-Host "[!] Error during git pull. Check your internet connection or git status." -ForegroundColor Red
    exit
}

# 2. Re-run bootstrap to apply changes
Write-Host "`n[ APPLYING UPDATES TO ENVIRONMENT ]" -ForegroundColor Yellow
powershell -ExecutionPolicy Bypass -File "$PSScriptRoot\bootstrap.ps1"

Write-Host "`n[ FINISHED ] Your AI environment is up to date." -ForegroundColor Green
