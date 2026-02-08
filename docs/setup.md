---
title: Setup
nav_order: 2
---

# Environment Setup

Choose your setup method. Both options give you the same tools and experience.

## Option 1: GitHub Codespaces (Recommended)

Codespaces gives you a complete development environment in your browser. No installation required.

### Launch Your Codespace

Click this button to create your environment:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/segunak/ai-interview-workshop?quickstart=1)

The Codespace takes about 2-3 minutes to fully build. When it's ready, you'll see VS Code in your browser with the file explorer on the left.

{: .note }
If you see any red X marks in the terminal output, ask a workshop volunteer for help.

## Option 2: Local Setup (Windows)

Prefer to work on your own machine? Run the setup script to install everything you need.

### Prerequisites

- Windows 11
- Administrator access
- A GitHub account with [Copilot access](#github-copilot-for-students)

### Step 1: Clone the Repository

```powershell
git clone https://github.com/segunak/ai-interview-workshop
cd ai-interview-workshop
```

### Step 2: Run the Setup Script

1. Open PowerShell **as Administrator** (right-click -> Run as Administrator)
2. Navigate to the repo folder
3. Run the setup script: `.\scripts\setup-windows.ps1`
4. Follow the prompts (a browser window will open for GitHub login)

### Step 3: Open in VS Code

1. Close and reopen PowerShell (to refresh PATH)
2. Open VS Code
3. Sign in with your GitHub account (click the person icon in the bottom left)
4. Open the `ai-interview-workshop` folder
5. You're ready to start!

## GitHub Copilot for Students

{: .highlight }
**Students get GitHub Copilot Pro for FREE!** If you're a student, verify your status to unlock unlimited Copilot access with premium models.

1. **[Apply for GitHub Education](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student)** - Verify your student status
2. **[Get free Copilot Pro](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-free-access-to-copilot-pro)** - Claim your free access

This gives you unlimited completions, premium AI models, and all the features you need for this workshop and beyond.

## What's Included

Your environment (Codespace or local) comes ready with:

- **Python** - For algorithm solutions (Questions 1-2)
- **PowerShell** - For log triage scripting (Question 3)
- **Node.js** - For JavaScript solutions (Questions 4-5)
- **GitHub CLI** - For GitHub authentication
- **GitHub Copilot** - Chat and code completion in VS Code
- **GitHub Copilot CLI** - AI coding agent in your terminal

## Folder Structure

Your workspace looks like this:

```txt
ai-interview-workshop/
├── question-1-two-sum/           # Two Sum problem
├── question-2-minimum-window/    # Minimum Window Substring
├── question-3-log-triage/        # Log parsing (includes sample logs)
│   └── logs/                     # Sample log files
├── question-4-live-feed/         # HTTP POST to live feed
├── question-5-live-feed-form/    # Form UI for live feed
└── docs/                         # This documentation site
```

Each question folder contains a `QUESTION-X-START-HERE.md` file plus starter code files. Open the start file and write your solution in the pre-created code files.

## Ready to Practice

Before starting, select the **Workshop Agent** in GitHub Copilot Chat. Click the agent picker and choose **Workshop Agent**. This activates the guided workflow that will coach you through each problem.

Click on Question 1 below to get started. Remember, you're encouraged to use GitHub Copilot the whole way through!

- [Question 1: Two Sum](question-1-two-sum) - Classic algorithm warmup
- [Question 2: Minimum Window Substring](question-2-minimum-window) - Sliding window challenge
- [Question 3: Log Triage](question-3-log-triage) - Real-world file parsing
- [Question 4: Live Feed POST](question-4-live-feed) - API integration
- [Question 5: Live Feed Form UI](question-5-live-feed-form) - Frontend form building

{: .important }
Do the questions in order.
