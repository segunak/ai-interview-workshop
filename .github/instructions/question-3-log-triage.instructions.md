---
applyTo: "**/question-3-log-triage/**"
---

# Question 3: Log Triage

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-3-log-triage/>

**Docs Source:** [docs/question-3-log-triage.md](../../docs/question-3-log-triage.md)

The student is working on a real-world engineering problem: parsing log files to triage errors.

## Problem Summary

Parse `.log` files in the [`logs/`](../../question-3-log-triage/logs/) subfolder and produce an executive summary suitable for pasting into Teams/Slack.

## Log Format

```
[YYYY-MM-DD HH:MM] LEVEL CODE: message
```

Example:
```
[2026-01-27 10:31] ERROR E1234: Payment failed user=42
```

## Sample Logs Location

The log files are at: [`question-3-log-triage/logs/`](../../question-3-log-triage/logs/)
- [`app-server-1.log`](../../question-3-log-triage/logs/app-server-1.log)
- [`app-server-2.log`](../../question-3-log-triage/logs/app-server-2.log)
- [`api-gateway.log`](../../question-3-log-triage/logs/api-gateway.log)

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

- Question 3 uses **PowerShell**. Log triage is a natural scripting use case and PowerShell is built for it.
- Guide the student through clarifying questions before coding
- Help them break the problem into steps (find files, read lines, extract codes, aggregate, display)
- Encourage them to make the output visually clear and scannable
- The logs folder has real sample data to test against
- **Output verification is the test.** Run against sample logs, verify output is correct. Unit tests are optional extra credit.
- A starter file is pre-created: [`triage.ps1`](../../question-3-log-triage/triage.ps1) (already has `$LogsDir` pointing to the `logs/` folder)
- Run with `./triage.ps1`
- After the script produces output, ask: "Why did we structure the output this way? What makes a triage report useful at 2 AM?" Help the student connect their code to the real-world scenario.
- If the student doesn't understand a PowerShell concept (like pipelines, hashtables, or regex), take a moment to teach it rather than just using it.
