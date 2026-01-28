# Question 5: Runway Scheduler

This folder is for your runway scheduler solution.

## Scenario

You're building a simplified runway scheduling system for an airport with a single runway.

## Input

See `sample-input.json` for example flight data.

Each flight has:

- `id` - Flight identifier (e.g., "UA123")
- `kind` - Either "landing" or "takeoff"
- `earliest_time` - Earliest minute the operation can begin
- `fuel_minutes` - (landings only) Minutes of fuel remaining

## Rules

1. **One runway** - Only one operation at a time
2. **Duration** - Each operation takes 2 minutes
3. **Separation** - 1 minute gap required between operations
4. **Priority** (highest to lowest):
   - Emergency landings (fuel <= 10)
   - Normal landings
   - Takeoffs
5. **Tiebreaker** - If same priority: earliest_time, then id alphabetically

## Before You Code

**Ask at least 3 clarifying questions.** This problem is intentionally ambiguous.

Write your assumptions at the top of your code file.

## Output Format

List of scheduled operations:

```json
[
  {"id": "UA123", "start_time": 0, "end_time": 2},
  {"id": "DL456", "start_time": 3, "end_time": 5}
]
```

## Deliverables

1. Working implementation
2. At least 4 tests
3. 5 bullet points on tradeoffs and what you'd do differently in production

## AI Rule

> **Plan first. Then code and prove it with tests.**

## Getting Started

Read the sample input. Ask clarifying questions. Document your assumptions. Then plan your approach.
