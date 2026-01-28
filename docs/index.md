---
title: Home
layout: home
nav_order: 1
---

# AI Interview Workshop

Practice technical interviews using AI coding assistants as your pair programming partner.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/segunak/ai-interview-workshop?quickstart=1)

## What You'll Learn

This workshop teaches you how to effectively use AI coding assistants during technical interviews. You'll practice a structured workflow that demonstrates thoughtful problem-solving rather than just generating code.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

## The Workflow

Every problem should follow this sequence:

1. **Ask Clarifying Questions** - Understand the problem before jumping to code
2. **Plan First** - Create a strategy before implementation
3. **Code with Understanding** - Write code (which includes AI generated code, you're responsible for it) you can explain
4. **Write Tests** - Verify your solution works
5. **Explain** - Articulate time complexity, space complexity, and tradeoffs

## Workshop Problems

| # | Problem | Type | Skills Tested |
|---|---------|------|---------------|
| 1 | [Two Sum](https://leetcode.com/problems/two-sum) | Algorithm | Hash maps, array traversal |
| 2 | [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring) | Algorithm | Sliding window, string manipulation |
| 3 | Log Triage | Practical | File I/O, parsing, aggregation |
| 4 | Live Feed POST | Practical | HTTP requests, API integration |
| 5 | Runway Scheduler | System Design | Ambiguity handling, prioritization |

## Getting Started

1. Click the **Open in GitHub Codespaces** button above
2. Wait for your environment to build (about 2-3 minutes)
3. Open the **Setup** page to verify your tools are ready
4. Pick a problem and start practicing!

## Tools at Your Disposal

- **GitHub Copilot Chat** - Your AI pair programmer (Agent Mode enabled)
- **Python 3** - Primary language for algorithm problems
- **Node.js 22** - For JavaScript solutions
- **PowerShell** - For scripting and API calls
- **[GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli)** - AI in your terminal (Microsoft's answer to Claude Code)

{: .note }
GitHub Copilot in this repo has been configured to guide you through the workflow. It will prompt you to ask clarifying questions, plan before coding, and write tests. Pay attention to its suggestions!
