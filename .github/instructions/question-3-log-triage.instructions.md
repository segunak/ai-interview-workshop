---
applyTo: "**/question-3-log-triage/**"
---

# Question 3: Log Triage

The student is working on a real-world engineering problem: parsing log files to triage errors.

## Problem Summary

Parse `.log` files in the `logs/` subfolder and produce an executive summary suitable for pasting into Teams/Slack.

## Log Format

```
[YYYY-MM-DD HH:MM] LEVEL CODE: message
```

Example:
```
[2026-01-27 10:31] ERROR E1234: Payment failed user=42
```

## Sample Logs Location

The log files are at: `question-3-log-triage/logs/`
- app-server-1.log
- app-server-2.log  
- api-gateway.log

## Expected Output Format

The output should be immediately actionable for someone at 2 AM trying to figure out what's broken. Example:

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

The exact format can vary. The goal is to make it scannable and immediately useful.

## Clarifying Questions to Prompt

- Should I handle nested directories or just the top level?
- What if a log line has multiple error codes?
- Should I include the source file in my output?
- What if there are no error codes found?

## Test Cases to Suggest

1. Parsing: Correctly extract timestamp, level, code, message from a log line
2. Counting: Accurate count per error code across multiple files
3. Filtering: Only count ERROR level entries, not WARN or INFO
4. Sorting: Results ordered by frequency (highest first)

## Workflow Reminders

- Guide the student through clarifying questions before coding
- Help them break the problem into steps (find files, read lines, extract codes, aggregate, display)
- Encourage writing tests to verify the solution
- Encourage them to make the output visually clear and scannable
- Suggest Python or PowerShell based on student preference
- The logs folder has real sample data to test against
