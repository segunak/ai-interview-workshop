<#
    Question 3: Log Triage

    Parse .log files in the logs/ directory and produce a triage report
    showing error codes sorted by frequency.

    Full Instructions: https://segunakinyemi.com/ai-interview-workshop/question-3-log-triage/

    Run with: ./triage.ps1
#>

# Path to the logs directory (relative to this script)
$LogsDir = Join-Path $PSScriptRoot "logs"

# TODO: Implement your solution here
# Steps:
#   1. Read all .log files from $LogsDir using Get-ChildItem
#   2. Extract ERROR level entries (ignore WARN and INFO)
#   3. Extract error codes matching pattern E followed by 4 digits (e.g., E1234)
#   4. Count occurrences of each error code
#   5. Print a summary sorted by frequency (highest first)
