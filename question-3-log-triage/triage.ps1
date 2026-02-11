<#
    Question 3: Log Triage

    Parse .log files in the logs/ directory, identify the root cause of the
    incident, and produce a triage report saved to reports/triage-report.txt.

    The first line of your report must be an executive summary: one sentence
    explaining what is wrong with the system and why.

    Full Instructions: https://segunakinyemi.com/ai-interview-workshop/question-3-log-triage/

    Run with: ./triage.ps1
    Test with: ./test_triage.ps1
#>

# Path to the logs directory (relative to this script)
$LogsDir = Join-Path $PSScriptRoot "logs"

# Path to write your report
$ReportsDir = Join-Path $PSScriptRoot "reports"
$ReportFile = Join-Path $ReportsDir "triage-report.txt"

# TODO: Implement your solution here
# Steps:
#   1. Read all .log files from $LogsDir using Get-ChildItem
#   2. Extract ERROR level entries (ignore WARN and INFO)
#   3. Extract error codes matching pattern E followed by 4 digits (e.g., E1002)
#   4. Count occurrences of each error code
#   5. Look at timestamps to figure out what went wrong FIRST (the root cause)
#   6. Write a triage report to $ReportFile with:
#      - Line 1: Executive summary (what is broken and why, one sentence)
#      - Error codes sorted by frequency
#      - Any other details that help someone at 2 AM fix the problem
