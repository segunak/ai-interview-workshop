<#
.SYNOPSIS
    Validates the AI Interview Workshop development environment on Windows.

.DESCRIPTION
    Checks that all required tools are installed and accessible:
    - Git
    - Python
    - Node.js
    - VS Code
    - GitHub CLI
    - GitHub Copilot CLI

.EXAMPLE
    .\validate-windows.ps1

.NOTES
    Can be run anytime to verify your environment is properly configured.
#>

Write-Host ""
Write-Host "Validating your environment..." -ForegroundColor Cyan
Write-Host ""

$failed = 0
$warnings = 0

# Function to check if a command exists
function Test-CommandExists {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# ============================================
# Check Git
# ============================================
if (Test-CommandExists "git") {
    $version = git --version 2>$null
    Write-Host "  [OK] $version" -ForegroundColor Green
} else {
    Write-Host "  [X] Git not found" -ForegroundColor Red
    $failed++
}

# ============================================
# Check Python
# ============================================
if (Test-CommandExists "python") {
    $version = python --version 2>$null
    Write-Host "  [OK] $version" -ForegroundColor Green
} else {
    Write-Host "  [X] Python not found" -ForegroundColor Red
    $failed++
}

# ============================================
# Check Node.js
# ============================================
if (Test-CommandExists "node") {
    $version = node --version 2>$null
    Write-Host "  [OK] Node.js $version" -ForegroundColor Green
} else {
    Write-Host "  [X] Node.js not found" -ForegroundColor Red
    $failed++
}

# ============================================
# Check VS Code
# ============================================
$vscodeFound = $false

if (Test-CommandExists "code") {
    $vscodeFound = $true
} elseif (Test-Path "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd") {
    $vscodeFound = $true
} elseif (Test-Path "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd") {
    $vscodeFound = $true
}

if ($vscodeFound) {
    Write-Host "  [OK] Visual Studio Code" -ForegroundColor Green
} else {
    Write-Host "  [X] VS Code not found" -ForegroundColor Red
    $failed++
}

# ============================================
# Check GitHub CLI
# ============================================
if (Test-CommandExists "gh") {
    $version = gh --version 2>$null | Select-Object -First 1
    Write-Host "  [OK] $version" -ForegroundColor Green
} else {
    Write-Host "  [X] GitHub CLI not found" -ForegroundColor Red
    $failed++
}

# ============================================
# Check GitHub Copilot CLI
# ============================================
if (Test-CommandExists "copilot") {
    Write-Host "  [OK] GitHub Copilot CLI" -ForegroundColor Green
} else {
    Write-Host "  [!] GitHub Copilot CLI not found" -ForegroundColor Yellow
    Write-Host "      Install with: npm install -g @github/copilot" -ForegroundColor Gray
    $warnings++
}

# ============================================
# Check GitHub Authentication
# ============================================
if (Test-CommandExists "gh") {
    $authStatus = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  [OK] GitHub authenticated" -ForegroundColor Green
    } else {
        Write-Host "  [!] Not authenticated with GitHub" -ForegroundColor Yellow
        Write-Host "      Run: gh auth login --web" -ForegroundColor Gray
        $warnings++
    }
}

# ============================================
# Summary
# ============================================
Write-Host ""

if ($failed -eq 0 -and $warnings -eq 0) {
    Write-Host "All tools are ready! Open a question folder to get started." -ForegroundColor Green
} elseif ($failed -eq 0) {
    Write-Host "Core tools ready. $warnings optional item(s) need attention." -ForegroundColor Yellow
} else {
    Write-Host "$failed required tool(s) missing. Run setup-windows.ps1 as Administrator." -ForegroundColor Red
}

Write-Host ""
