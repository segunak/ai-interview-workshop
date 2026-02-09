---
title: Resources
nav_order: 8
---

# Resources

Curated resources for continuing your learning after the workshop.

{: .highlight }
**What to Read:** Check out [AI Insights for Students](https://readwise.io/reader/view/2a197170-e112-4033-83b2-288bfbf75194), a curated collection of articles on AI engineering, AI's impact of software development and entry level roles, and industry trends. This is a great resource for staying current!

{: .important }
**Who to Follow:** The most respected technical voices rarely post on TikTok, Instagram, or Snapchat. They're found on blogs, LinkedIn, Hacker News, Reddit, and Tech Twitter (still active despite the platform's drama). Stop listening to influencers. Follow the experts! Check out [Who to Follow](https://segunakinyemi.com/blog/seo-techdevcon-2025/#who-to-follow) from a related workshop for a curated list of people and platforms worth your attention.

{: .note }
**UNC Charlotte Workshop (February 9, 2026):** If you attended the technical interview workshop at UNC Charlotte, connect with the Microsoft employee volunteers on LinkedIn: [Alexandra Jones](https://www.linkedin.com/in/alexandra-jones-ncsu/), [Rosey Anim](https://www.linkedin.com/in/rose-anim/), [Jill Dozier](https://www.linkedin.com/in/jill-do/), [Sachin Kumar](https://www.linkedin.com/in/sachin-kumar-/), [Bhavesh Rana](https://www.linkedin.com/in/imbhaveshrana/), [Kelechi Nwosu](https://www.linkedin.com/in/kc-nwosu/), [Dinesh Kalla](https://www.linkedin.com/in/dinesh-kalla-ph-d-4a644525/), [Nathan Beyero](https://www.linkedin.com/in/nathan-beyero/), [Segun Akinyemi](https://www.linkedin.com/in/segunakinyemi/).

## AI Coding Tools

These are AI-powered tools built specifically for developers to write, edit, and understand code. Many of these tools are becoming fully agentic, meaning developers "write code" by describing what they want in natural language prompts and then reviewing the generated output, rather than writing code by hand.

- [GitHub Copilot](https://docs.github.com/en/copilot/get-started/what-is-github-copilot) - Microsoft's AI coding assistant, integrated into VS Code and other editors
- [GitHub Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli) - AI assistance in the terminal for shell commands and git operations
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Anthropic's agentic coding tool for the terminal
- [Cursor](https://cursor.sh/) - AI-first code editor built on VS Code
- [OpenAI Codex CLI](https://github.com/openai/codex) - OpenAI's terminal-based coding agent
- [Gemini CLI](https://github.com/google-gemini/gemini-cli) - Google's AI coding assistant for the terminal
- [Google Antigravity](https://antigravity.google/) - Google's AI-powered IDE
- [OpenCode](https://opencode.ai/) - Open source terminal-based AI coding agent

{: .note }
Cursor and Google Antigravity are both forks of Microsoft's open source [VS Code](https://code.visualstudio.com/). Given that VS Code is the most popular IDE and under constant AI-related development, I recommend students focus on learning AI-assisted coding with VS Code and GitHub Copilot. Explore the alternatives if you're curious, but VS Code is the foundation.

## Vibe Coding Tools

These tools let you build apps by describing what you want in natural language, with minimal or no manual coding.

- [Lovable](https://lovable.dev/) - Build full-stack web apps from prompts
- [Replit](https://replit.com/) - Cloud IDE with AI-powered app generation
- [GitHub Spark](https://githubnext.com/projects/github-spark) - Create micro apps using natural language

## Concepts to Explore

As AI coding tools evolve, these are concepts worth understanding:

- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) - Open standard for connecting AI to external tools and data sources
- [Custom Instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot) - Repository-level prompts that shape AI behavior
- [AGENTS.md](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot#about-coding-agent-instructions) - Convention for giving AI agents context about your codebase
- [Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents) - Build your own specialized AI agents in VS Code
- [Agent Skills](https://code.visualstudio.com/docs/copilot/customization/agent-skills) - Extend Copilot with custom capabilities via MCP

## AI Model Benchmarks

Not all AI models are equal at coding. These benchmarks track which models perform best at real software engineering tasks. Check them regularly to stay current.

- [SWE-bench](https://www.swebench.com/) - The industry standard for AI coding. Tests whether models can solve real GitHub issues from open source projects by generating patches and running test suites. Originally Python-only, now has multilingual extensions covering C, C++, Go, Java, JavaScript, TypeScript, and more.
- [Terminal Bench](https://www.tbench.ai/) - Tests AI agents on real-world terminal tasks including coding, system administration, debugging, and data processing. Measures how well models operate autonomously in CLI environments.

## Interview Preparation

- [Tech Interview Handbook](https://www.techinterviewhandbook.org/) - Comprehensive guide to technical interviews
- [Grind 75](https://www.techinterviewhandbook.org/grind75/) - Curated list of 75 essential LeetCode problems
- [LeetCode](https://leetcode.com/) - Classic algorithm problems
- [NeetCode 150](https://leetcode.com/problem-list/rab78cw1/) - Curated problem list for interview prep
- [AlgoExpert](https://www.algoexpert.io/) - Video explanations
- [System Design Primer](https://github.com/donnemartin/system-design-primer) - Comprehensive guide that everyone uses to prep for System Design questions in tech interivews
- [ByteByteGo](https://bytebytego.com/) - Visual system design guides

## AI-Assisted Interviews

Some companies are starting to allow AI tools in technical interviews. Here are some examples.

- [Canva: Yes, You Can Use AI in Our Interviews](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/) - Canva's official blog post
- [Wired: Meta AI Job Interview Coding](https://www.wired.com/story/meta-ai-job-interview-coding/) - How Meta is adapting
- [How to Use AI in Meta's AI-Assisted Coding Interview](https://interviewing.io/blog/how-to-use-ai-in-meta-s-ai-assisted-coding-interview-with-real-prompts-and-examples) - Real prompts and examples

And here are experiences from people who've specifically been through Canva's AI-Assisted coding interview.

- [Reddit: Canva's AI-Assisted Coding Interview](https://www.reddit.com/r/cscareerquestionsOCE/comments/1mjos7d/canvas_ai_assisted_coding_interview/) - Discussion thread
- [Reddit: Canva AI Interview Tips](https://www.reddit.com/r/cscareerquestionsOCE/comments/1lkt2ft/canva_ai_interview_what_to_expect_any_tips/) - What to expect

## AI Engineering Resources

- [The AI Engineer](https://www.latent.space/p/ai-engineer) - The essay that defined the emerging role of AI Engineer
- [Coding Is Dead, Software Engineering Isn't](https://segunakinyemi.com/blog/coding-is-dead-software-engineering-isnt/) - Deep dive into why AI changes what developers do but doesn't replace the need for engineering judgment
- [We're Not Cooked: Your Tech Career Survival Guide in the Age of AI Engineering](https://segunakinyemi.com/blog/seo-techdevcon-2025/) - Blog post on how AI is changing software development and why there's still work to do
- [AI Insights for Students](https://readwise.io/reader/view/2a197170-e112-4033-83b2-288bfbf75194) - Curated collection of articles on AI engineering, prompt techniques, and industry trends
- [Who to Follow](https://segunakinyemi.com/blog/seo-techdevcon-2025/#who-to-follow) - People and organizations to follow for the latest in AI and software development

## Free Resources for Students

Take advantage of these programs while you have a .edu email address.

- [GitHub Student Developer Pack](https://education.github.com/pack) - Free access to developer tools, cloud credits, domains, and professional resources from 100+ partners including GitHub Copilot Pro, JetBrains, Azure credits, and more
- [GitHub Education for Students](https://github.com/education/students) - Free GitHub Pro account, Codespaces hours, and Actions minutes for verified students
- [GitHub Copilot Pro for Students](https://docs.github.com/en/copilot/how-tos/manage-your-account/get-free-access-to-copilot-pro) - Free Copilot Pro access for verified students, teachers, and open source maintainers
- [Apply for GitHub Education](https://docs.github.com/en/education/about-github-education/github-education-for-students/apply-to-github-education-as-a-student) - How to verify your student status and unlock free benefits
- [Microsoft Student Certifications](https://learn.microsoft.com/en-us/training/student-hub/certifications) - Discounted certification exams for Azure, AI, Security, Power Platform, and more. Includes free C# certification through freeCodeCamp partnership
- [Microsoft Learn](https://learn.microsoft.com/en-us/training/) - Free courses on Azure, AI, data, security, and Microsoft technologies
- [Google Skills](https://skills.google/) - Free courses on AI, cloud, and Google technologies with skill badges and certificates
- [Grow with Google](https://grow.google/) - Free career certificates in data analytics, cybersecurity, IT support, project management, and more

## Stay Connected

Workshop created by **Segun Akinyemi:** [LinkedIn](https://linkedin.com/in/segunakinyemi) • [GitHub](https://github.com/segunak) • [Website](https://segunakinyemi.com) • [Email](mailto:segun@segunakinyemi.com)

{: .highlight }
Remember: AI is a tool that amplifies your abilities. The goal is to become a better engineer, not to outsource your thinking. Use AI to learn faster, explore more options, and handle tedious tasks, but always make sure you understand what you're building.
