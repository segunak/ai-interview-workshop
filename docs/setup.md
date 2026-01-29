---
title: Setup
nav_order: 2
---

# Environment Setup

Everything is pre-configured. Just launch your Codespace and you're ready to go.

## Launch Your Codespace

Click this button to create your environment:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/segunak/ai-interview-workshop?quickstart=1)

The Codespace takes about 2-3 minutes to fully build. When it's ready, you'll see:

1. VS Code in your browser with the file explorer on the left
2. A terminal that automatically runs a validation script
3. Green checkmarks confirming all tools are installed

{: .note }
If you see any red X marks in the terminal output, ask a workshop volunteer for help.

## What's Pre-Installed

Your Codespace comes ready with:

- **Python** - For algorithm solutions
- **Node.js** - For JavaScript solutions
- **PowerShell** - Cross-platform scripting
- **GitHub CLI** - For GitHub operations
- **GitHub Copilot CLI** - AI coding agent in your terminal (like Claude Code)
- **GitHub Copilot** - Chat and code completion enabled
- **Cyberpunk theme** - Because why not

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

Each question folder contains a README with the problem statement. Create your solution files inside the appropriate folder.

## Ready to Practice

Pick a problem and start:

- [Question 1: Two Sum](question-1-two-sum) - Classic algorithm warmup
- [Question 2: Minimum Window Substring](question-2-minimum-window) - Sliding window challenge
- [Question 3: Log Triage](question-3-log-triage) - Real-world file parsing
- [Question 4: Live Feed POST](question-4-live-feed) - API integration
- [Question 5: Live Feed Form UI](question-5-live-feed-form) - Frontend form building

{: .important }
Do the questions in order.
