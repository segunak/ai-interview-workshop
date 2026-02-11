<#
    Test Script for Question 3: Log Triage

    Runs triage.ps1, then validates the report file.

    Run with: ./test_triage.ps1
#>

$ErrorCount = 0
$PassCount = 0

function Test-Check {
    param([string]$Name, [bool]$Condition)
    if ($Condition) {
        Write-Host "  PASS: $Name" -ForegroundColor Green
        $script:PassCount++
    }
    else {
        Write-Host "  FAIL: $Name" -ForegroundColor Red
        $script:ErrorCount++
    }
}

Write-Host ""
Write-Host "Running triage.ps1..." -ForegroundColor Cyan
Write-Host ""

# Run the student's script
$TriageScript = Join-Path $PSScriptRoot "triage.ps1"
& $TriageScript

Write-Host ""
Write-Host "Validating report..." -ForegroundColor Cyan
Write-Host ""

# Check 1: Report file exists
$ReportFile = Join-Path $PSScriptRoot "reports" "triage-report.txt"
$ReportExists = Test-Path $ReportFile
Test-Check "Report file exists at reports/triage-report.txt" $ReportExists

if (-not $ReportExists) {
    Write-Host ""
    Write-Host "  Cannot continue: report file not found." -ForegroundColor Red
    Write-Host "  Make sure triage.ps1 writes output to reports/triage-report.txt" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

$Content = Get-Content $ReportFile -Raw
$Lines = Get-Content $ReportFile

# Check 2: Report is not empty
$NotEmpty = $Content.Trim().Length -gt 0
Test-Check "Report is not empty" $NotEmpty

# Check 3: Executive summary (first non-blank line exists and has substance)
$FirstLine = ($Lines | Where-Object { $_.Trim().Length -gt 0 } | Select-Object -First 1)
$HasSummary = $null -ne $FirstLine -and $FirstLine.Trim().Length -gt 20
Test-Check "Executive summary present (first line has substance)" $HasSummary

# Check 4: Report mentions at least 3 distinct error codes
$ErrorCodes = [regex]::Matches($Content, "E\d{4}") | ForEach-Object { $_.Value } | Sort-Object -Unique
$HasMultipleCodes = $ErrorCodes.Count -ge 3
Test-Check "Report references 3+ distinct error codes (found: $($ErrorCodes.Count))" $HasMultipleCodes

# Check 5: Root cause identification - mentions E1002 or connection pool
$MentionsRootCause = $Content -match "E1002" -or $Content -match "connection pool" -or $Content -match "pool exhaust"
Test-Check "Root cause identified (E1002 / connection pool)" $MentionsRootCause

# Summary
Write-Host ""
$Total = $PassCount + $ErrorCount
Write-Host "Results: $PassCount/$Total checks passed" -ForegroundColor $(if ($ErrorCount -eq 0) { "Green" } else { "Red" })
Write-Host ""

if ($ErrorCount -gt 0) {
    Write-Host "Some checks failed. Review your triage report and try again." -ForegroundColor Yellow
    Write-Host ""
    exit 1
}
else {
    Write-Host "All checks passed!" -ForegroundColor Green
    Write-Host ""
    exit 0
}
