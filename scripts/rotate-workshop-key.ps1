<#
.SYNOPSIS
    Rotates the workshop key across all config files in the repository.

.DESCRIPTION
    Updates the workshop key in workshop-config.json and docs/_data/workshop.yml.
    These are the only two files that contain the literal key value. All other files
    (starter code, instruction files, docs pages) reference these config files.

.PARAMETER NewKey
    The new workshop key value.

.EXAMPLE
    .\rotate-workshop-key.ps1 -NewKey "my-new-workshop-key"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$NewKey
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot

# --- Update workshop-config.json ---
$configPath = Join-Path $repoRoot "workshop-config.json"
$config = Get-Content $configPath -Raw | ConvertFrom-Json
$oldKey = $config.workshopKey
$config.workshopKey = $NewKey
$config | ConvertTo-Json -Depth 10 | Set-Content $configPath -NoNewline
Write-Host "Updated workshop-config.json" -ForegroundColor Green

# --- Update docs/_data/workshop.yml ---
$yamlPath = Join-Path $repoRoot "docs" "_data" "workshop.yml"
$yamlContent = Get-Content $yamlPath -Raw
$yamlContent = $yamlContent -replace [regex]::Escape($oldKey), $NewKey
Set-Content $yamlPath $yamlContent -NoNewline
Write-Host "Updated docs/_data/workshop.yml" -ForegroundColor Green

# --- Summary ---
Write-Host ""
Write-Host "Workshop key rotated successfully." -ForegroundColor Cyan
Write-Host "  Old: $oldKey" -ForegroundColor DarkGray
Write-Host "  New: $NewKey" -ForegroundColor Cyan
Write-Host ""
Write-Host "Reminder: Update the WORKSHOP_KEY environment variable in Vercel for the live feed server." -ForegroundColor Yellow
Write-Host "  https://vercel.com/ -> workshops-live-feed -> Settings -> Environment Variables" -ForegroundColor Yellow
