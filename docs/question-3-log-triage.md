---
title: "Question 3: Log Triage"
nav_order: 5
---

# Question 3: Log Triage

{: .important }
**Before you start:** In your VS Code window, Open `QUESTION-3-START-HERE.md` in the `question-3-log-triage` folder and keep it open while you work. This loads the AI context GitHub Copilot needs to help you effectively.

## Scenario

This is a practical file processing problem. You're an on-call engineer at 2 AM. The alerting system shows elevated error rates. Your task is to quickly parse the logs and identify which error codes are occurring most frequently so you can prioritize your investigation.

## Problem Statement

Write a script that:

1. Reads all `.log` files from the [`question-3-log-triage/logs/`](../question-3-log-triage/logs/) directory
2. Extracts all error codes matching the pattern `E` followed by 4 digits (e.g., `E1234`, `E5678`)
3. **Only counts ERROR level entries** (not WARN or INFO)
4. Counts occurrences of each error code across all files
5. Prints a summary sorted by frequency (highest first)

## Log Format

Each log file contains entries in this format:

```txt
[YYYY-MM-DD HH:MM] LEVEL CODE: message text
```

Example lines:

```txt
[2025-01-15 02:34] ERROR E1234: Database connection failed
[2025-01-15 02:34] WARN W0001: Retry attempt 1 of 3
[2025-01-15 02:35] ERROR E5678: Authentication timeout, user=42
[2025-01-15 02:36] INFO: Health check passed
```

{: .important }
Only count entries with level **ERROR**. Ignore WARN and INFO entries even if they contain error codes.

## Expected Output Format

Your script should output something immediately useful for someone at 2 AM trying to figure out what's broken. Example:

```txt
================================================================================
                              LOG TRIAGE REPORT
================================================================================
Scanned: 3 files | Found: 12 errors | Time range: 10:15 - 11:02

TOP ISSUE (5 hits, 42% of errors)
   E1234: Payment failed
   Last seen: 10:39 in app-server-1.log
   Likely cause: Payment processor issues

ALL ERRORS BY FREQUENCY
--------------------------------------------------------------------------------
   E1234  ############  5 hits  (42%)
   E5678  ########      4 hits  (33%)
   E9012  ###           2 hits  (17%)
   E4040  #             1 hit   (8%)

MOST RECENT ERRORS
--------------------------------------------------------------------------------
   10:39  E1234  Payment failed user=201 reason=expired_card
   10:32  E5678  DB timeout query=update_session duration=31s

ERRORS BY SOURCE
--------------------------------------------------------------------------------
   app-server-1.log: 6 errors
   app-server-2.log: 4 errors
   api-gateway.log:  2 errors
================================================================================
```

The exact format can vary. Use your creativity and ask AI to help you make it scannable and clear. The sections shown above (**TOP ISSUE**, **ALL ERRORS BY FREQUENCY**, **MOST RECENT ERRORS**, **ERRORS BY SOURCE**) are recommendations, not requirements.

## Sample Files

The [`question-3-log-triage/logs/`](../question-3-log-triage/logs/) directory contains sample log files:

- [`app-server-1.log`](../question-3-log-triage/logs/app-server-1.log) - Application server logs
- [`app-server-2.log`](../question-3-log-triage/logs/app-server-2.log) - Second application server
- [`api-gateway.log`](../question-3-log-triage/logs/api-gateway.log) - API gateway logs

These files simulate a real incident with overlapping error codes across services.

## Workshop Workflow

### 1. Clarifying Questions

Before diving in, consider:

- Should I handle nested directories or just the top level?
- What if a log line has multiple error codes?
- Should I include the source file in my output?
- What if there are no error codes found?

### 2. Plan Your Approach

Break this into steps:

1. Find all .log files in the directory
2. Read each file line by line
3. Use regex to extract error codes
4. Aggregate counts in a dictionary
5. Sort and display results

### 3. Test Your Solution

Run your script and verify:

- It finds all error codes across all files
- Counts are accurate (you can manually spot-check a few)
- Output is sorted correctly

## Deliverables

Your solution goes in **[`triage.ps1`](../question-3-log-triage/triage.ps1)** in the [`question-3-log-triage/`](../question-3-log-triage/) folder. Open that file and write your code there. The variable `$LogsDir` is already set to point at the logs folder.

Run with:

```
./triage.ps1
```

Run your script and verify the output makes sense. **Output verification is the test for this problem.** Unit tests are optional.

## Extension Challenges

If you finish early:

1. **Add timestamps** - Show when each error code first and last appeared
2. **Add file source** - Show which files contained each error code
3. **Make it a CLI** - Accept the directory path as a command-line argument

## Hints

{: .note }
Only look at hints if you're stuck!

<details>
<summary>Hint 1: Regex Pattern</summary>

In PowerShell, use the `-match` operator with the pattern `E\d{4}` to match E followed by exactly 4 digits. The `$Matches` automatic variable captures the result.

</details>

<details>
<summary>Hint 2: Reading Files</summary>

```powershell
$LogsDir = Join-Path $PSScriptRoot "logs"
Get-ChildItem -Path $LogsDir -Filter "*.log" | ForEach-Object {
    Get-Content $_.FullName | ForEach-Object {
        # process each line
    }
}
```

</details>

<details>
<summary>Hint 3: Counting</summary>

Use a hashtable to count occurrences, then sort:

```powershell
$counts = @{}
$counts["E1234"] += 1
# Sort: $counts.GetEnumerator() | Sort-Object Value -Descending
```

</details>
