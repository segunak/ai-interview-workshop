# Validation script for AI Interview Workshop Codespace
# This runs automatically when the Codespace starts

Write-Host ""
Write-Host "Validating your environment..."
Write-Host ""

$Failed = 0

# Check Python
if (Get-Command python -ErrorAction SilentlyContinue) {
    $PythonVersion = python --version 2>&1
    Write-Host "$PythonVersion" -ForegroundColor Green
} else {
    Write-Host "Python not found" -ForegroundColor Red
    $Failed = 1
}

# Check Node
if (Get-Command node -ErrorAction SilentlyContinue) {
    $NodeVersion = node --version 2>&1
    Write-Host "Node.js $NodeVersion" -ForegroundColor Green
} else {
    Write-Host "Node.js not found" -ForegroundColor Red
    $Failed = 1
}

# Check PowerShell
if (Get-Command pwsh -ErrorAction SilentlyContinue) {
    $PwshVersion = pwsh --version 2>&1
    Write-Host "$PwshVersion" -ForegroundColor Green
} else {
    Write-Host "PowerShell not found" -ForegroundColor Red
    $Failed = 1
}

# Check GitHub CLI
if (Get-Command gh -ErrorAction SilentlyContinue) {
    $GhVersion = (gh --version 2>&1) | Select-Object -First 1
    Write-Host "$GhVersion" -ForegroundColor Green
} else {
    Write-Host "GitHub CLI not found" -ForegroundColor Red
    $Failed = 1
}

# Check GitHub Copilot CLI
if (Get-Command copilot -ErrorAction SilentlyContinue) {
    Write-Host "GitHub Copilot CLI installed" -ForegroundColor Green
} else {
    Write-Host "GitHub Copilot CLI not found. Install with: npm install -g @github/copilot" -ForegroundColor Yellow
}

Write-Host ""
if ($Failed -eq 0) {
    Write-Host "All tools are ready! Open a question folder to get started." -ForegroundColor Green
} else {
    Write-Host "Some tools are missing. Check the errors above." -ForegroundColor Yellow
}
Write-Host ""
