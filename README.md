# AI-Assisted Technical Interview Workshop

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/segunak/ai-interview-workshop?quickstart=1)

Practice technical interviews the way they actually happen in the age of AI, with coding assistants as your partner.

**Quick Links:**

- **Workshop Website:** <https://aka.ms/aiw>
- **Workshop Live Feed:** <https://aka.ms/aiw/live-feed>
- **Workshop PowerPoint Deck:** [The Link](https://1drv.ms/p/c/750d396c5cadcebd/IQBsRMeY3HSzRIBxRgHkaxD1AWZG14z_B3al7wfnPaezf4g?e=CjHD76)

## What Is This?

This workshop teaches you how to use AI tools effectively in technical interviews. You'll work through 5 progressively challenging problems, learning to:

- Plan before you code
- Write tests to prove your solutions work
- Communicate clearly with AI assistants
- Explain your approach to interviewers

## Why AI-Assisted Interviews?

If AI can write code, then the [real skill isn't typing solutions from memory](https://terriblesoftware.org/2025/12/11/ai-can-write-your-code-it-cant-do-your-job/). It's driving the software development process end to end and shipping something correct. Companies like [Meta](https://www.wired.com/story/meta-ai-job-interview-coding/) and [Canva](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/) are adapting interviews to this reality. This workshop trains that skill set.

If you think this approach is cheating, or that students should focus solely on LeetCode, [here's why I built the workshop this way](https://segunakinyemi.com/ai-interview-workshop/why-ai-interviews/). For the full philosophy, [read the accompanying article](https://segunakinyemi.com/blog/coding-is-dead-software-engineering-isnt/).

## Quick Start

### Option 1: GitHub Codespaces (Recommended)

1. Click the **Open in GitHub Codespaces** button above
2. Wait for the environment to load (about 2 minutes)
3. Open the [Workshop Website](https://segunakinyemi.com/ai-interview-workshop/) in a new tab
4. Open `QUESTION-1-START-HERE.md` in the `question-1-two-sum/` folder and keep it open while you work

### Option 2: Local Setup (Windows)

1. Clone this repo: `git clone https://github.com/segunak/ai-interview-workshop`
2. Open PowerShell **as Administrator**
3. Run: `.\scripts\setup-windows.ps1`
4. Open the folder in VS Code and sign in with your GitHub account

**Students:** Get [GitHub Copilot Pro for free](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-free-access-to-copilot-pro) by [verifying your student status](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student)!

**Important:** When working on a question, keep the `QUESTION-X-START-HERE.md` file open in your editor. This loads the AI context GitHub Copilot needs to help you effectively.

## The 5 Questions

| # | Type | Challenge | Folder |
|---|------|-----------|--------|
| 1 | Data Structures and Algorithms (Easy) | [Two Sum](https://segunakinyemi.com/ai-interview-workshop/question-1-two-sum/) | [question-1-two-sum/](question-1-two-sum/) |
| 2 | Data Structures and Algorithms (Hard) | [Minimum Window Substring](https://segunakinyemi.com/ai-interview-workshop/question-2-minimum-window/) | [question-2-minimum-window/](question-2-minimum-window/) |
| 3 | Practical Software Engineering | [Log File Triage](https://segunakinyemi.com/ai-interview-workshop/question-3-log-triage/) | [question-3-log-triage/](question-3-log-triage/) |
| 4 | Practical Software Engineering | [Post to Live Feed](https://segunakinyemi.com/ai-interview-workshop/question-4-live-feed/) | [question-4-live-feed/](question-4-live-feed/) |
| 5 | Frontend Development | [Live Feed Form UI](https://segunakinyemi.com/ai-interview-workshop/question-5-live-feed-form/) | [question-5-live-feed-form/](question-5-live-feed-form/) |

## The AI Rule

You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

This rule appears on every question. It's the core workflow for AI-assisted development:

1. Ask clarifying questions
2. Generate a plan with your AI tool
3. Review and approve the plan before coding
4. Write tests to verify the solution
5. Be ready to explain how it works

## Tools You Can Use

- [VS Code with GitHub Copilot](https://code.visualstudio.com/docs/copilot/overview) (recommended)
- [Cursor](https://cursor.com/home)
- [Claude Code](https://code.claude.com/docs/en/overview)
- [GitHub Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)

**Not allowed for this workshop:** Browser-based chat tools (ChatGPT web, Claude web, etc.). Practice using AI inside your development environment.
