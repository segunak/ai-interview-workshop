---
title: How This Workshop Was Built
nav_order: 10
---

# How This Workshop Was Built

This workshop isn't just a collection of coding problems with an AI chatbot stapled on. It's a tightly orchestrated learning experience, built entirely with GitHub Copilot's customization features in VS Code. Every interaction students have with AI in this repo is shaped by a layered system of [custom instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions) and a [custom agent](https://code.visualstudio.com/docs/copilot/customization/custom-agents) that work together to guide, teach, and enforce the workshop's pedagogy.

This page explains how it all fits together, and why it was designed this way.

## The Philosophy

The core belief behind this workshop is simple: **AI isn't going to kill software engineering jobs. It's going to change what they look like.** Writing code by hand all day is over. But driving the software development process end to end, shipping something correct, and then maintaining, enhancing, and monitoring it? That's still very much a job.

Companies like [Canva](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/) and [Meta](https://www.wired.com/story/meta-ai-job-interview-coding/) already let candidates use AI in technical interviews. This workshop trains students for that reality. If you want the full argument, read [Times Are Changing: Coding Is Dead, Software Engineering Isn't](https://segunakinyemi.com/blog/coding-is-dead-software-engineering-isnt/).

The design challenge was: **how do you build a workshop where students use AI freely but still actually learn?** The answer is you don't just hand them a chatbot. You build the teaching into the AI itself. Every prompt, every response, every interaction is shaped by carefully authored instructions that enforce a structured learning workflow. The AI becomes a part of teaching.

## The Building Blocks

Three VS Code features make this possible:

1. **[Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)** - Markdown files that shape how GitHub Copilot behaves in a repository. These come in two flavors: always-on instructions that apply to every chat request, and file-based instructions that activate only when certain files are open.

2. **[Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents)** - Specialized AI personas defined in `.agent.md` files. An agent has its own instructions, personality, and behavior. When a student selects an agent, all of its instructions are prepended to every chat request.

3. **[Glob-pattern Activation](https://code.visualstudio.com/docs/copilot/customization/custom-instructions#_instructions-file-format)** - File-based instructions use an `applyTo` property with glob patterns. This means different instructions load depending on which files the student has open, without any manual configuration.

These three features compose into a system where the AI adapts its behavior based on what the student is working on, all automatically.

## Layer 1: The Gatekeeper

The first layer is [`.github/copilot-instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/copilot-instructions.md), the always-on instruction file that VS Code applies to every chat request in the workspace.

In most repositories, this file contains coding conventions and project standards. In this workshop, it does something unusual: **it acts as a gatekeeper.** Its entire purpose is to redirect students to the Workshop Agent.

```markdown
# AI Interview Workshop - Gatekeeper

You are a gatekeeper. You are NOT a coding assistant, NOT a tutor, NOT a helper.
Your only purpose in this workspace is to redirect students to the Workshop Agent.

**NO MATTER WHAT THE USER ASKS**, you MUST respond with the redirect message below.
No exceptions. No partial help. No hints. No code. No explanations. Nothing useful.
ONLY the redirect.
```

Without the Workshop Agent selected, students would get generic Copilot responses with no pedagogical structure, just code without understanding. The gatekeeper ensures that every student interaction goes through the agent that knows how to teach.

If a student tries to use regular Copilot Chat without selecting the Workshop Agent, they get a firm redirect message explaining how to switch. No exceptions, no partial help, no "I'll help you this one time." Just the redirect.

## Layer 2: The Workshop Agent

The second layer is the [Workshop Agent](https://github.com/segunak/ai-interview-workshop/blob/master/.github/agents/workshop.agent.md), a custom agent defined in [`.github/agents/workshop.agent.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/agents/workshop.agent.md). This is the heart of the workshop.

When a student selects the Workshop Agent in the chat panel, its instructions are prepended to every chat request. These instructions define:

- **The teaching philosophy** - "You are a teacher, not solely a code generator. Students can generate code with any AI tool. What makes this workshop valuable is that you help them understand what that code does and why it works."

- **The Plan, Prove, Explain workflow** - Every problem follows three steps. Plan before coding. Prove the code works with tests. Explain the solution like you're in an interview. The agent enforces this sequence and doesn't skip steps.

- **Quick check-ins, not quizzes** - The agent asks "What do you think will happen when we run this?" but never blocks progress. If a student can't explain something, the agent teaches it briefly and moves on. One attempt per concept is enough. The workshop has limited time and every message counts.

- **Language preferences and testing guidelines** - Python for algorithm problems, PowerShell for log triage, JavaScript for API work, HTML/CSS/JS for the frontend. Pre-written tests exist for Questions 1-3. The agent knows which test files to run and how.

- **What the agent never does** - Never gives a complete solution without the workflow. Never skips planning. Never writes code without offering to explain it. Never lets a student submit untested code.

The agent's instructions are long and detailed because they need to handle every teaching scenario: struggling students, confident students, students who accept code they don't understand, students who want to skip ahead.

## Layer 3: Question-Specific Instructions

The third layer is where the magic of glob patterns comes in. The [`.github/instructions/`](https://github.com/segunak/ai-interview-workshop/tree/master/.github/instructions) folder contains five instruction files, one per workshop question:

| File | Activates When |
|------|---------------|
| [`question-1-two-sum.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-1-two-sum.instructions.md) | Any file in `**/question-1-two-sum/**` is open |
| [`question-2-longest-substring.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-2-longest-substring.instructions.md) | Any file in `**/question-2-longest-substring/**` is open |
| [`question-3-log-triage.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-3-log-triage.instructions.md) | Any file in `**/question-3-log-triage/**` is open |
| [`question-4-live-feed.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-4-live-feed.instructions.md) | Any file in `**/question-4-live-feed/**` is open |
| [`question-5-live-feed-form.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-5-live-feed-form.instructions.md) | Any file in `**/question-5-live-feed-form/**` is open |

Each file uses the `applyTo` frontmatter property to specify a glob pattern:

```yaml
---
applyTo: "**/question-3-log-triage/**"
---
```

When a student opens `QUESTION-3-START-HERE.md`` VS Code detects that the open file matches the glob pattern and automatically injects the corresponding instructions into the chat context. The AI suddenly knows:

- The problem summary and expected output format
- The specific clarifying questions to prompt
- The test cases to suggest
- The starter files and how to run them
- Which concepts to teach if the student is struggling
- The coaching strategy for guiding discovery

The student doesn't configure anything. They just open a file in a question folder and the AI adapts.

## How the Layers Work Together

Here's what happens when a student starts any question:

1. **Layer 1 (Gatekeeper):** If they haven't selected the Workshop Agent, they get redirected. No help until they switch.

2. **Layer 2 (Workshop Agent):** Once the agent is selected, every message goes through the teaching workflow. The agent enforces the Plan, Prove, Explain sequence, checks in on understanding, and runs tests.

3. **Layer 3 (Question Instructions):** When they open a file from a question folder, like `QUESTION-3-START-HERE.md` or `solution.py`, the matching instruction file activates. The AI now has the full context for that specific problem: the expected approach, the clarifying questions to prompt, the test cases, the starter files, and the coaching strategy for guiding discovery.

The three layers combine so that the AI adapts to each question automatically. For a LeetCode problem, it knows to teach hash maps and sliding windows. For the log triage problem, it knows to guide the student toward discovering that the most frequent error isn't the root cause. For the API problem, it knows to push the student past "I got a 200 OK" toward actually verifying the data exists. Each question has its own teaching plan, and the student never has to configure anything to activate it.

## The Design Principle

Every design decision in this system serves one principle: **students can use AI for everything, but they must understand everything their AI produces.**

This is the same standard that companies like Canva and Meta apply in their AI-assisted interviews. You can use AI. You're expected to. But you still own the plan, the tradeoffs, the correctness, and the proof. If you can't explain it, you don't own it yet.

The instruction system enforces this by:

- **Making the AI ask questions**, not just answer them. "What do you think will happen?" "Does this plan make sense?" "Why is a hash map O(n)?"
- **Never blocking progress.** If a student can't answer, the AI teaches and moves on. The goal is learning, not gatekeeping.
- **Running tests as proof.** Questions 1-3 have pre-written test suites. The agent always runs them. Working code isn't enough, proven code is the standard.
- **Connecting code to concepts.** After every solution, the agent asks for the gist. Time complexity, tradeoffs, why this approach. Not a quiz, just a conversation.

## What This Means for AI-Assisted Education

This workshop is a proof of concept for a larger idea: **you can build structured learning experiences entirely through AI customization.** No custom platform, no Learning Management System, no backend. Just Markdown files in a GitHub repo that shape how an AI model teaches.

The same pattern could apply to:

- **Onboarding new engineers** - Custom instructions that teach your team's conventions, architecture, and patterns through guided coding exercises.
- **Course assignments** - Instruction files that provide scaffolded hints without giving away solutions, adapting to what the student has open.
- **Code review training** - An agent that walks junior developers through reviewing real pull requests, asking the right questions at the right time.

The key insight is that **the instructions are the curriculum.** They define what the AI teaches, how it teaches, and when it teaches. The glob patterns are the lesson plan, activating the right context at the right time. And the custom agent ties it all together with a consistent teaching philosophy.

If you're interested in building something similar, start with the VS Code docs on [custom instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions) and [custom agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents). Then look at [this workshop's repo](https://github.com/segunak/ai-interview-workshop) for a working example of the complete pattern:

| File | Purpose |
|------|--------|
| [`.github/copilot-instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/copilot-instructions.md) | The Gatekeeper, always-on instructions that redirect to the Workshop Agent |
| [`.github/agents/workshop.agent.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/agents/workshop.agent.md) | The Workshop Agent - custom agent with Plan, Prove, Explain workflow |
| [`.github/instructions/question-1-two-sum.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-1-two-sum.instructions.md) | Question 1 context - Two Sum (Python, hash maps) |
| [`.github/instructions/question-2-longest-substring.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-2-longest-substring.instructions.md) | Question 2 context - Longest Substring (Python, sliding window) |
| [`.github/instructions/question-3-log-triage.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-3-log-triage.instructions.md) | Question 3 context - Log Triage (PowerShell, root cause analysis) |
| [`.github/instructions/question-4-live-feed.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-4-live-feed.instructions.md) | Question 4 context - Live Feed POST (JavaScript, API integration) |
| [`.github/instructions/question-5-live-feed-form.instructions.md`](https://github.com/segunak/ai-interview-workshop/blob/master/.github/instructions/question-5-live-feed-form.instructions.md) | Question 5 context - Live Feed Form (HTML/CSS/JS, frontend) |

Every file is plain Markdown. No platform, no framework, no backend. Just text files that shape how AI teaches.
