---
applyTo: "**/question-5-runway-scheduler/**"
---

# Question 5: Runway Scheduler

The student is working on an ambiguous system design problem that requires clarifying questions.

## Problem Summary

Schedule flights (landings and takeoffs) on a single runway with priority rules.

## Input Format

See `sample-input.json` in the `question-5-runway-scheduler/` folder.

Fields:
- `id` - Flight identifier
- `kind` - "landing" or "takeoff"
- `earliest_time` - Earliest minute the operation can start
- `fuel_minutes` - (landings only) Minutes of fuel remaining

## Rules

1. One runway, one operation at a time
2. Each operation takes 2 minutes
3. 1 minute separation between operations
4. Priority order:
   - Emergency landings (fuel <= 10) - highest
   - Normal landings
   - Takeoffs - lowest
5. Tiebreaker: earliest_time, then id alphabetically

## Expected Output

List of assignments with: `id`, `start_time`, `end_time`

## Clarifying Questions to Prompt

The student MUST ask at least 3 clarifying questions before coding. Examples:
- What if two emergency landings conflict?
- Should we reject flights we can't schedule?
- What time unit are we using?
- Is fuel exactly 10 an emergency or not?

They should also document assumptions at the top of their code file.

## Test Cases to Suggest

1. Basic: Single flight schedules at earliest_time
2. Priority: Emergency landing preempts takeoff
3. Ordering: Same priority uses earliest_time tiebreaker
4. Separation: Verify 1-minute gap between operations
5. Edge: Fuel exactly at 10 (is this emergency or not?)

## Workflow Reminders

This problem is intentionally ambiguous. The clarifying questions are the point. Do not let the student skip this step. Guide them through:
- Asking clarifying questions before coding
- Documenting their assumptions
- Writing comprehensive tests
- Reflecting on tradeoffs and production considerations
