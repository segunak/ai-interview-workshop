#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Sets up the AI Interview Workshop development environment on Windows.

.DESCRIPTION
    This script installs all required tools for the AI Interview Workshop:
    - Git
    - Python
    - Node.js
    - VS Code with GitHub Copilot extensions
    - GitHub CLI
    - GitHub Copilot CLI
    - Python requests package

    Must be run as Administrator.

.EXAMPLE
    .\setup-windows.ps1

.NOTES
    Requires Windows 11 with winget installed.
    Run PowerShell as Administrator before executing this script.
#>

# Exit immediately if not running as Administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host ""
    Write-Host "ERROR: This script must be run as Administrator." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "  1. Right-click on PowerShell" -ForegroundColor Yellow
    Write-Host "  2. Select 'Run as Administrator'" -ForegroundColor Yellow
    Write-Host "  3. Navigate to this folder and run the script again" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AI Interview Workshop Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to refresh PATH from registry
function Update-Path {
    $machinePath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    $userPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
    $env:Path = "$machinePath;$userPath"
    Write-Host "  PATH refreshed" -ForegroundColor Gray
}

# Function to check if a command exists
function Test-CommandExists {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# ============================================
# STEP 1: Install Git
# ============================================
Write-Host "[1/11] Installing Git..." -ForegroundColor Yellow
winget install Git.Git --accept-package-agreements --accept-source-agreements --silent
Update-Path

# ============================================
# STEP 2: Install Python
# ============================================
Write-Host "[2/11] Installing Python..." -ForegroundColor Yellow
winget install Python.Python.3.12 --accept-package-agreements --accept-source-agreements --silent
Update-Path

# ============================================
# STEP 3: Install Node.js
# ============================================
Write-Host "[3/11] Installing Node.js..." -ForegroundColor Yellow
winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements --silent
Update-Path

# ============================================
# STEP 4: Install VS Code
# ============================================
Write-Host "[4/11] Installing Visual Studio Code..." -ForegroundColor Yellow
winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements --silent
Update-Path

# ============================================
# STEP 5: Install GitHub CLI
# ============================================
Write-Host "[5/11] Installing GitHub CLI..." -ForegroundColor Yellow
winget install GitHub.cli --accept-package-agreements --accept-source-agreements --silent
Update-Path

# ============================================
# STEP 6: Install VS Code Extensions
# ============================================
Write-Host "[6/11] Installing VS Code extensions..." -ForegroundColor Yellow

# Find VS Code executable
$vscodePath = $null
$possiblePaths = @(
    "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd",
    "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd",
    "${env:ProgramFiles(x86)}\Microsoft VS Code\bin\code.cmd"
)

foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $vscodePath = $path
        break
    }
}

$extensions = @(
    "GitHub.copilot",
    "GitHub.copilot-chat",
    "ms-python.python",
    "ms-vscode.powershell",
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "ms-vsliveshare.vsliveshare"
)

if ($vscodePath) {
    foreach ($ext in $extensions) {
        & $vscodePath --install-extension $ext --force 2>$null
    }
    Write-Host "  VS Code extensions installed" -ForegroundColor Gray
} elseif (Test-CommandExists "code") {
    foreach ($ext in $extensions) {
        code --install-extension $ext --force 2>$null
    }
    Write-Host "  VS Code extensions installed" -ForegroundColor Gray
} else {
    Write-Host "  WARNING: Could not find VS Code. Please install extensions manually." -ForegroundColor Yellow
    foreach ($ext in $extensions) {
        Write-Host "    Run: code --install-extension $ext" -ForegroundColor Yellow
    }
}

# ============================================
# STEP 7: Install GitHub Copilot CLI
# ============================================
Write-Host "[7/11] Installing GitHub Copilot CLI..." -ForegroundColor Yellow

# Find npm
$npmPath = $null
$possibleNpmPaths = @(
    "$env:ProgramFiles\nodejs\npm.cmd",
    "$env:APPDATA\npm\npm.cmd"
)

foreach ($path in $possibleNpmPaths) {
    if (Test-Path $path) {
        $npmPath = $path
        break
    }
}

if ($npmPath) {
    & $npmPath install -g @github/copilot 2>$null
    Write-Host "  GitHub Copilot CLI installed" -ForegroundColor Gray
} elseif (Test-CommandExists "npm") {
    npm install -g @github/copilot 2>$null
    Write-Host "  GitHub Copilot CLI installed" -ForegroundColor Gray
} else {
    Write-Host "  WARNING: npm not found. Please restart PowerShell and run:" -ForegroundColor Yellow
    Write-Host "    npm install -g @github/copilot" -ForegroundColor Yellow
}

# ============================================
# STEP 8: Install Python requests package
# ============================================
Write-Host "[8/11] Installing Python requests package..." -ForegroundColor Yellow

# Find pip
$pipPath = $null
$possiblePipPaths = @(
    "$env:LOCALAPPDATA\Programs\Python\Python312\Scripts\pip.exe",
    "$env:ProgramFiles\Python312\Scripts\pip.exe"
)

foreach ($path in $possiblePipPaths) {
    if (Test-Path $path) {
        $pipPath = $path
        break
    }
}

if ($pipPath) {
    & $pipPath install requests 2>$null
    Write-Host "  requests package installed" -ForegroundColor Gray
} elseif (Test-CommandExists "pip") {
    pip install requests 2>$null
    Write-Host "  requests package installed" -ForegroundColor Gray
} elseif (Test-CommandExists "python") {
    python -m pip install requests 2>$null
    Write-Host "  requests package installed" -ForegroundColor Gray
} else {
    Write-Host "  WARNING: pip not found. Please restart PowerShell and run:" -ForegroundColor Yellow
    Write-Host "    pip install requests" -ForegroundColor Yellow
}

# ============================================
# STEP 9: GitHub Authentication
# ============================================
Write-Host "[9/11] Checking GitHub authentication..." -ForegroundColor Yellow

$ghAuthenticated = $false

# Find gh
$ghPath = $null
$possibleGhPaths = @(
    "$env:ProgramFiles\GitHub CLI\gh.exe",
    "$env:LOCALAPPDATA\Programs\GitHub CLI\gh.exe"
)

foreach ($path in $possibleGhPaths) {
    if (Test-Path $path) {
        $ghPath = $path
        break
    }
}

if ($ghPath) {
    $authStatus = & $ghPath auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Already authenticated with GitHub" -ForegroundColor Gray
        $ghAuthenticated = $true
    }
} elseif (Test-CommandExists "gh") {
    $authStatus = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Already authenticated with GitHub" -ForegroundColor Gray
        $ghAuthenticated = $true
    }
}

if (-not $ghAuthenticated) {
    Write-Host ""
    Write-Host "  Opening browser for GitHub login..." -ForegroundColor Cyan
    Write-Host "  Please complete the authentication in your browser." -ForegroundColor Cyan
    Write-Host ""
    
    if ($ghPath) {
        & $ghPath auth login --web
    } elseif (Test-CommandExists "gh") {
        gh auth login --web
    } else {
        Write-Host "  WARNING: GitHub CLI not found in PATH. Please restart PowerShell and run:" -ForegroundColor Yellow
        Write-Host "    gh auth login --web" -ForegroundColor Yellow
    }
}

# ============================================
# STEP 10: Refresh PATH one more time
# ============================================
Write-Host "[10/11] Refreshing environment..." -ForegroundColor Yellow
Update-Path

# ============================================
# STEP 11: Run Validation
# ============================================
Write-Host "[11/11] Validating installation..." -ForegroundColor Yellow
Write-Host ""

Write-Host "Validating your environment..." -ForegroundColor Cyan
Write-Host ""

$failed = 0
    
    # Check Git
    if (Test-CommandExists "git") {
        $version = git --version 2>$null
        Write-Host "  [OK] $version" -ForegroundColor Green
    } else {
        Write-Host "  [X] Git not found" -ForegroundColor Red
        $failed++
    }
    
    # Check Python
    if (Test-CommandExists "python") {
        $version = python --version 2>$null
        Write-Host "  [OK] $version" -ForegroundColor Green
    } else {
        Write-Host "  [X] Python not found" -ForegroundColor Red
        $failed++
    }
    
    # Check Node.js
    if (Test-CommandExists "node") {
        $version = node --version 2>$null
        Write-Host "  [OK] Node.js $version" -ForegroundColor Green
    } else {
        Write-Host "  [X] Node.js not found" -ForegroundColor Red
        $failed++
    }
    
    # Check VS Code
    if ((Test-CommandExists "code") -or (Test-Path "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd")) {
        Write-Host "  [OK] Visual Studio Code" -ForegroundColor Green
    } else {
        Write-Host "  [X] VS Code not found" -ForegroundColor Red
        $failed++
    }
    
    # Check GitHub CLI
    if (Test-CommandExists "gh") {
        $version = gh --version 2>$null | Select-Object -First 1
        Write-Host "  [OK] $version" -ForegroundColor Green
    } else {
        Write-Host "  [X] GitHub CLI not found" -ForegroundColor Red
        $failed++
    }
    
    # Check GitHub Copilot CLI
    if (Test-CommandExists "copilot") {
        Write-Host "  [OK] GitHub Copilot CLI" -ForegroundColor Green
    } else {
        Write-Host "  [!] GitHub Copilot CLI not found (may need PowerShell restart)" -ForegroundColor Yellow
    }
    
    Write-Host ""
    if ($failed -eq 0) {
        Write-Host "All core tools installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "$failed tool(s) may need attention. Try restarting PowerShell." -ForegroundColor Yellow
    }

# ============================================
# SUCCESS MESSAGE
# ============================================
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Close and reopen PowerShell (to refresh PATH)" -ForegroundColor White
Write-Host "  2. Open VS Code" -ForegroundColor White
Write-Host "  3. Sign in with your GitHub account (bottom left corner)" -ForegroundColor White
Write-Host "  4. Open the ai-interview-workshop folder" -ForegroundColor White
Write-Host "  5. In Copilot Chat, select the Workshop Agent from the agent picker" -ForegroundColor White
Write-Host "  6. Open QUESTION-1-START-HERE.md and start practicing!" -ForegroundColor White
Write-Host ""
Write-Host "Students: Get GitHub Copilot Pro FREE!" -ForegroundColor Yellow
Write-Host "  https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student" -ForegroundColor Gray
Write-Host ""
