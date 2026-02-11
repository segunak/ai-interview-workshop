---
applyTo: "**/question-3-log-triage/**"
---

# Question 3: Log Triage

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-3-log-triage/>

**Docs Source:** [docs/question-3-log-triage.md](../../docs/question-3-log-triage.md)

The student is working on a real-world engineering problem: parsing log files to triage an incident and identify the root cause beneath the noise.

## Problem Summary

Parse `.log` files in the [`logs/`](../../question-3-log-triage/logs/) subfolder, identify the root cause of a cascading failure, and write a triage report to [`reports/triage-report.txt`](../../question-3-log-triage/reports/).

The report must start with an **executive summary** on the first line: one professional sentence explaining what is wrong with the system and why. The rest of the report should include error codes sorted by frequency, source files, timeline details, and root cause identification.

## Log Format

```
[YYYY-MM-DD HH:MM] LEVEL CODE: message
```

Example:
```
[2026-02-06 02:09] ERROR E1002: Database connection pool exhausted on db-primary, cannot acquire connection (0 of 20 available)
[2026-02-06 02:07] WARN W1001: Database connection pool running low on db-primary, 3 of 20 connections available
```

## The Cascade Story (DO NOT REVEAL TO STUDENT)

The logs tell a specific story. The root cause is **E1002: Database connection pool exhaustion**. Here's the cascade:

1. **W1001** (WARN level) — Database connection pool running low (early warning, starts ~02:07)
2. **E1002** (ERROR) — Database connection pool fully exhausted, 0 of 20 connections (root cause, starts 02:09)
3. **E2001** (ERROR) — Database query timeouts because no database connection is available (direct symptom)
4. **E2002** (ERROR) — Payment processing fails because database connection is unavailable (most frequent error, 12 hits)
5. **E2003** (ERROR) — Order processing fails because database connection is unavailable
6. **E3001** (ERROR) — API gateway sees upstream server timeouts from app servers
7. **E3002** (ERROR) — API gateway trips circuit breakers for unresponsive app servers
8. **E3003** (ERROR) — No healthy upstream servers available, returning HTTP 503 to all clients (total outage)

**E2002 is the most frequent error (12 hits) but it is NOT the root cause.** It's a symptom. The root cause is E1002 (8 hits), which started first and caused everything else. Guide the student to discover this by looking at timestamps, not just frequency.

## Sample Logs Location

The log files are at: [`question-3-log-triage/logs/`](../../question-3-log-triage/logs/)
- [`app-server-1.log`](../../question-3-log-triage/logs/app-server-1.log) — 18 ERROR entries
- [`app-server-2.log`](../../question-3-log-triage/logs/app-server-2.log) — 12 ERROR entries
- [`api-gateway.log`](../../question-3-log-triage/logs/api-gateway.log) — 11 ERROR entries
- **Total: 41 ERROR entries across 7 unique error codes**

## Expected Output Format

The report file (`reports/triage-report.txt`) should look something like this:

```txt
Database connection pool exhaustion on db-primary caused cascading failures across all services, resulting in payment processing errors, order failures, and complete gateway outage.

================================================================================
                              LOG TRIAGE REPORT
================================================================================
Scanned: 3 files | Found: 41 errors | Time range: 02:09 - 02:24

ROOT CAUSE
   E1002: Database connection pool exhausted (8 hits, first seen 02:09)

ALL ERRORS BY FREQUENCY
--------------------------------------------------------------------------------
   E2002  ############  12 hits  (29%)  Payment processing failed
   E1002  ########       8 hits  (20%)  Database connection pool exhausted
   E2001  ######         6 hits  (15%)  Query timeout
   E3001  ######         6 hits  (15%)  Upstream timeout
   E2003  ####           4 hits  (10%)  Order processing failed
   E3003  ###            3 hits  ( 7%)  No healthy upstream servers available
   E3002  ##             2 hits  ( 5%)  Circuit breaker tripped

ERRORS BY SOURCE
--------------------------------------------------------------------------------
   app-server-1.log: 18 errors
   app-server-2.log: 12 errors
   api-gateway.log:  11 errors
================================================================================
```

The exact format can vary. The key requirements are: executive summary on line 1, root cause identified, and error codes with counts.

## Clarifying Questions to Prompt

- Should I handle nested directories or just the top level?
- What if a log line has multiple error codes?
- Should I include the source file in my output?
- What if there are no error codes found?
- How can I tell the difference between symptoms and root cause?

## Test Cases to Suggest

1. Parsing: Correctly extract timestamp, level, code, message from a log line
2. Counting: Accurate count per error code across multiple files
3. Filtering: Only count ERROR level entries, not WARN or INFO
4. Sorting: Results ordered by frequency (highest first)
5. Root cause: Report identifies E1002 as root cause, not just E2002 (most frequent)
6. Report file: Written to `reports/triage-report.txt` with executive summary on first line

## Coaching the Root Cause Discovery

If the student's report just shows E2002 as the "top issue" without digging deeper:
- Ask: "E2002 is the most frequent error. But _why_ are payments failing? What do the error messages say?"
- They'll notice `reason=database_connection_unavailable`
- Ask: "So the database is unavailable. Is there an error code for that? What happened to the database?"
- They'll find E1002: connection pool exhausted
- Ask: "Look at the timestamps. Which error appeared first, E2002 or E1002?"
- E1002 starts at 02:09, before the E2002 flood. That's the root cause.

If the student gets it right away, great. Don't force the Socratic method if they already understand.

## Workflow Reminders

- Question 3 uses **PowerShell**. Log triage is a natural scripting use case and PowerShell is built for it.
- Guide the student through clarifying questions before coding
- Help them break the problem into steps (find files, read lines, extract codes, aggregate, display, write file)
- Encourage them to make the output visually clear and scannable
- The logs folder has real sample data to test against
- A starter file is pre-created: [`triage.ps1`](../../question-3-log-triage/triage.ps1) (already has `$LogsDir` and `$ReportFile` pointing to the right places)
- A test file validates the report: [`test_triage.ps1`](../../question-3-log-triage/test_triage.ps1)
- Run with `./triage.ps1`, test with `./test_triage.ps1`
- After the script produces output, ask: "The most frequent error is E2002, but is that really the root cause? What happened _before_ the payments started failing?" Help the student connect frequency with causation.
- If the student doesn't understand a PowerShell concept (like pipelines, hashtables, or regex), take a moment to teach it rather than just using it.
