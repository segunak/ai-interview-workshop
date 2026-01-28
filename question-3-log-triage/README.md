# Question 3: Log Triage

This folder is for your log triage solution.

## Scenario

You're the on-call engineer. A folder of `.log` files has been dumped on your desk. Build a script to read them and discover what's wrong.

## Log Format

```txt
[YYYY-MM-DD HH:MM] LEVEL CODE: message
```

Example entries:

```txt
[2026-01-27 10:31] ERROR E1234: Payment failed user=42
[2026-01-27 10:32] ERROR E1234: Payment failed user=99
[2026-01-27 10:33] WARN W0001: Retry scheduled user=42
[2026-01-27 10:34] ERROR E5678: DB timeout
```

## Sample Logs

The `logs/` subfolder contains sample log files for you to parse:

- `app-server-1.log`
- `app-server-2.log`
- `api-gateway.log`

## Deliverables

Write a script (Python or PowerShell) that outputs a clear, scannable report. The output should be immediately useful for someone at 2 AM trying to figure out what's broken.

Example output:

```txt
================================================================================
                              LOG TRIAGE REPORT
================================================================================
Scanned: 3 files | Found: 12 errors | Time range: 10:15 - 11:02

TOP ISSUE (5 hits, 42% of errors)
   E1234: Payment failed
   Last seen: 10:39 in app-server-1.log

ALL ERRORS BY FREQUENCY
--------------------------------------------------------------------------------
   E1234  ############  5 hits  (42%)
   E5678  ########      4 hits  (33%)
   E9012  ###           2 hits  (17%)

MOST RECENT ERRORS
--------------------------------------------------------------------------------
   10:39  E1234  Payment failed user=201
   10:32  E5678  DB timeout query=update_session
```

The exact format can vary. Use your creativity to make it useful.

## Tests Required

At least 3 tests:

1. Parsing: Correctly extract fields from log lines
2. Counting: Accurate count per error code
3. Last seen: Correct most recent timestamp per code

## AI Rule

> **Plan first. Then code and prove it with tests.**

## Getting Started

Look at the sample logs first. Understand the format. Then ask your AI tool to help you plan a parsing approach.
