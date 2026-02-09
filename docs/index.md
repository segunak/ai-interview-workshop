---
title: Home
nav_order: 1
---

# AI Interview Workshop

Practice technical interviews using AI coding assistants as your pair programming partner. You may find the accompanying slide deck to this workshop at: [PowerPoint Deck - Times Are Changing: The Rise of AI-Assisted Coding Interviews](https://1drv.ms/p/c/750d396c5cadcebd/IQBsRMeY3HSzRIBxRgHkaxD1AWZG14z_B3al7wfnPaezf4g?e=CjHD76).

{: .blank-note }
**Created by Segun Akinyemi:** [LinkedIn](https://linkedin.com/in/segunakinyemi) • [GitHub](https://github.com/segunak) • [Website](https://segunakinyemi.com) • [Email](mailto:segun@segunakinyemi.com)

## Table of Contents

- [Setup](setup)
- [Question 1: Two Sum](question-1-two-sum)
- [Question 2: Minimum Window Substring](question-2-minimum-window)
- [Question 3: Log Triage](question-3-log-triage)
- [Question 4: Live Feed POST + Verify](question-4-live-feed)
- [Question 5: Live Feed Form UI](question-5-live-feed-form)
- [Resources](resources)
- [Why AI Interviews?](why-ai-interviews)

## Why AI-Assisted Interviews?

If AI can write code, then the [real skill isn't typing solutions from memory](https://terriblesoftware.org/2025/12/11/ai-can-write-your-code-it-cant-do-your-job/). It's driving the software development process end to end and shipping something correct. Companies like [Meta](https://www.wired.com/story/meta-ai-job-interview-coding/) and [Canva](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/) are adapting interviews to this reality. This workshop trains that modern skill set.

If you think using AI in coding or interviews (where explicitly allowed) is cheating, or that students should focus solely on LeetCode, [read why I disagree](why-ai-interviews).

## What You'll Learn

This workshop teaches you how to effectively use AI coding assistants during technical interviews. You'll practice a structured workflow that demonstrates thoughtful problem-solving rather than just generating code.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

## The Workflow: Plan, Prove, Explain

Every problem follows three steps:

1. **Plan** — Understand the problem before touching code. Ask clarifying questions about edge cases and assumptions. Design your approach: what data structures, what algorithm, what's the strategy? Don't generate a single line until you have a plan you can articulate.
2. **Prove** — Direct AI to write code, then prove it works. The code AI produces is yours, which means you're responsible for it. Before running anything, predict what the output will be. If you can't predict it, you don't understand it yet. Run the tests or check the output and confirm your solution works.
3. **Explain** — Walk through your solution like you're in an interview. Articulate what it does, why it works, and the tradeoffs you made. Cover time complexity, space complexity, and why you chose this approach. If you can't explain it, you don't own it yet.

## Workshop Problems

| Question Number | Problem | Type |
|---|---------|------|
| 1 | [Two Sum](question-1-two-sum) | Data Structures and Algorithms |
| 2 | [Minimum Window Substring](question-2-minimum-window) | Data Structures and Algorithms |
| 3 | [Log Triage](question-3-log-triage) | Practical Software Engineering |
| 4 | [Live Feed POST + Verify](question-4-live-feed) | Practical Software Engineering |
| 5 | [Live Feed Form UI](question-5-live-feed-form) | Practical Software Engineering |

## Getting Started

Head to the **[Setup](setup)** page to configure your environment, then go to [Question 1](question-1-two-sum) and start practicing!

{: .note }
**Students:** Get [GitHub Copilot Pro for free](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-free-access-to-copilot-pro) by [verifying your student status](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student)!

## Tools Used in This Workshop

- **GitHub Copilot Chat** - Your AI pair programmer (Agent Mode enabled)
- **Workshop Agent** - A custom Copilot agent that guides you through each question. Select it in the chat panel before starting a question.
- **Python** - For algorithm solutions (Questions 1-2)
- **PowerShell** - For log triage scripting (Question 3)
- **HTML/CSS/JS** - For API and frontend solutions (Questions 4-5)
- **[GitHub Copilot CLI](https://github.com/github/copilot-cli)** - AI in your terminal (Microsoft's answer to Claude Code)

{: .note }
GitHub Copilot in this repo has been configured to guide you through the workflow. Select the **Workshop Agent** in the chat panel for the best experience. It will walk you through each step: Plan, Prove, Explain.
