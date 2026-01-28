---
title: "Question 5: Runway Scheduler"
nav_order: 7
---

# Question 5: Runway Scheduler

## Why This Problem?

This is a system design problem that tests how you handle ambiguity. Most technical interviews present well-defined problems. Real-world engineering often doesn't. This problem is intentionally ambiguous to test how you handle unclear requirements.

**Your ability to ask the right questions is as important as your code.**

This reflects a growing trend in technical interviews: companies are letting candidates use AI tools, but they want to see you solve real problems that require judgment, not just generate code. If you know nothing about software engineering, AI won't save you. You need to understand the problem space well enough to ask clarifying questions, make reasonable assumptions, and design a solution that actually works.

**Read more about AI-assisted interviews:**

- [Canva: Yes, You Can Use AI in Our Interviews](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/)
- [Wired: Meta AI Job Interview Coding](https://www.wired.com/story/meta-ai-job-interview-coding/)
- [Reddit: Canva AI-Assisted Coding Interview Experience](https://www.reddit.com/r/cscareerquestionsOCE/comments/1l5dlpf/canva_ai_assisted_coding_interview_experience/)
- [Reddit: Canva's AI-Assisted Coding Interview](https://www.reddit.com/r/cscareerquestionsOCE/comments/1mjos7d/canvas_ai_assisted_coding_interview/)

## Scenario

You're building a flight scheduling system for a regional airport with a single runway. Given a list of pending flights, determine the order in which they should use the runway.

## Input

You'll receive a JSON file (`sample-input.json`) containing an array of flight objects:

```json
[
  {
    "flightId": "UA123",
    "type": "departure",
    "requestedTime": "2025-01-15T08:30:00Z",
    "priority": "normal",
    "passengerCount": 142
  }
]
```

## The Rules (What You're Given)

1. **Emergencies first** - Flights with `priority: "emergency"` always go before normal flights
2. **Respect requested times** - Earlier requested times should generally go first
3. **Single runway** - Only one flight can use the runway at a time

## The Ambiguity (What You Must Figure Out)

These questions are NOT answered for you. You must ask them:

- Do arrivals have priority over departures, or vice versa?
- What if two emergency flights have the same requested time?
- Does passenger count matter? How?
- What's the minimum time between flights?
- Should the scheduler optimize for anything specific (throughput, passenger satisfaction, fuel efficiency)?
- What happens if the requested time has already passed?
- Are there capacity limits to consider?

{: .important }
In a real interview, your interviewer would answer these questions. In this workshop, use the problem constraints in the instruction file or make reasonable assumptions and document them clearly in your code.

## Workshop Workflow

### 1. Ask Clarifying Questions (Critical!)

Before writing any code, open Copilot Chat and ask clarifying questions. For example:

> "I'm working on the runway scheduler. Before I start coding, I have some questions about the requirements..."

Document the answers (or your assumptions) in comments at the top of your solution.

### 2. Plan Your Approach

Once you understand the requirements, plan your solution:

- How will you sort the flights?
- What tiebreakers will you use?
- How will you handle edge cases?

### 3. Implement

Create your solution in `question-5-runway-scheduler/`. Your solution should:

- Read `sample-input.json`
- Sort flights according to your understood rules
- Output the ordered list with reasoning

### 4. Explain Your Decisions

Be ready to explain:

- Why you chose your priority rules
- What assumptions you made
- How you would handle requirements changes

## Sample Input File

The `question-5-runway-scheduler/sample-input.json` file contains 8 flights with various combinations of:

- Emergency and normal priorities
- Arrivals and departures
- Same and different requested times
- Varying passenger counts

## Expected Output

Your program should output the scheduled order with explanations:

```
Runway Schedule
===============
1. [EMERGENCY] FL999 - Arrival at 08:35 (Medical emergency)
2. [EMERGENCY] AA789 - Departure at 08:30 (Declared emergency)
3. UA123 - Departure at 08:30 (142 passengers)
4. DL456 - Arrival at 08:32 (189 passengers)
...
```

## Deliverables

Create these files in `question-5-runway-scheduler/`:

1. **scheduler.py** - Your implementation
2. **assumptions.md** - Document the clarifying questions you asked and the assumptions you made

## Evaluation Criteria

In a real interview, you'd be evaluated on:

1. **Clarifying questions** - Did you identify the ambiguities?
2. **Reasonable assumptions** - When you couldn't get answers, did you make sensible choices?
3. **Working code** - Does your solution actually run and produce correct output?
4. **Clear documentation** - Can someone else understand your decisions?
5. **Flexibility** - How easily could your solution adapt to requirement changes?

## Extension Challenges

If you finish early:

1. **Add a CLI** - Accept input file as command-line argument
2. **Time slots** - Calculate actual scheduled times with minimum gaps
3. **Visualization** - Output a timeline view of the schedule
4. **What-if analysis** - Show how the schedule changes under different priority rules
