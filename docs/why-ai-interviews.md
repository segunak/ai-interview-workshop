---
title: Why AI Interviews?
nav_order: 9
---

# Why AI Interviews?

Everything that follows is optional reading. But if you're curious why I'm teaching students to interview with AI tools, or if you've encountered skeptics who think this is "cheating," read on.

{: .blank-note }
**Written by Segun Akinyemi:** [LinkedIn](https://linkedin.com/in/segunakinyemi) • [GitHub](https://github.com/segunak) • [Website](https://segunakinyemi.com) • [Email](mailto:segun@segunakinyemi.com)

## The Game Has Changed

AI has fundamentally shifted what it means to be a productive software engineer. The question we're all asking right now across the industry is "if AI can write all the code (it can), then what's left for software engineers to do?" There has to be something of value, something that justifies the high salaries software engineers make, that's beyond "can you type the solution from memory."

Well, it's the same as it's always been in the [many attempts to get rid of programmers in the past](https://www.caimito.net/en/blog/2025/12/07/the-recurring-dream-of-replacing-developers.html). "Can you drive the software development process ([SDLC](https://en.wikipedia.org/wiki/Systems_development_life_cycle)) end to end and ship something correct and then **maintain, enhance, and monitor it**."

That's what this workshop trains.

I work at [a company you've likely heard of](https://en.wikipedia.org/wiki/Microsoft) and use [GitHub Copilot](https://github.com/features/copilot) in its [various forms](https://docs.github.com/en/copilot/get-started/features) every day. I've done so since 2022 when it first hit the scene as a mediocre AI-coding assistant that amounted to little more than fancy auto complete. Since then, my goodness has it had a glow up. It's far from mediocre, it's incredible, and I wouldn't want to go back to a world working without it.

What I do most of the time now amounts to [natural language programming](https://segunakinyemi.com/blog/natural-language-programming/). I describe what I want in plain English, refine what AI generates, verify correctness, and integrate it into larger systems. That might make you think, "Well then, what value is your technical expertise? Couldn't a random business person just describe what they want and have that be the swan song of software development as an industry?"

No, and let me explain why (although, [it's explained better here](https://terriblesoftware.org/2025/12/11/ai-can-write-your-code-it-cant-do-your-job/)). Technical expertise is still essential across the entire [Software Development Life Cycle](https://www.atlassian.com/agile/software-development/sdlc), not just the code itself. Understanding systems architecture, debugging weird edge cases, knowing when AI is confidently wrong, designing systems that scale, reviewing and validating AI-generated code, navigating organizational politics, aligning stakeholders, making build-vs-buy decisions with incomplete information, owning accountability when things fail in production, planning, testing, integration, DevOps, FinOps, security, judgment borne of technical expertise. That's where the real skill lives.

The Pragmatic Engineer frames it well in the article: [When AI writes almost all code, what happens to software engineering?](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what)

The answer is that there's still plenty to do!

## Your Value Lies Beyond the Code

[Nicholas Zakas](https://www.linkedin.com/in/nzakas), the creator of ESLint and author of several influential JavaScript books, wrote a piece called [From Coder to Orchestrator: The Future of Software Engineering](https://humanwhocodes.com/blog/2025/07/coder-orchestrator-future-software-engineering/) that captures where things are heading. He argues that the role is shifting from writing code to orchestrating systems. The skills that matter most now are problem decomposition, validation and verification, context management, and knowing when AI suggestions are wrong.

This isn't speculation. Engineers at companies like OpenAI and Anthropic, the people leading the charge with AI coding, are spending more time reviewing AI output than writing code from scratch, as evidenced by [this Tweet from Boris Cherny](https://x.com/bcherny/status/2004897269674639461), the lead developer of [Claude Code](https://code.claude.com/docs/en/overview) at Anthropic.

That shouldn't scare you. Check out the OpenAI and Anthropic careers pages.

* [OpenAI Careers](https://openai.com/careers/search/)
* [Anthropic Careers](https://www.anthropic.com/careers/jobs)

Anything with the word "Engineer" in it is a technical role. If AI is so capable, why are these companies still hiring software engineers? What would those engineers be doing that [OpenAI Codex](https://openai.com/codex/) or [Claude Code](https://code.claude.com/docs/en/overview) can't handle with just [Sam Altman](https://en.wikipedia.org/wiki/Sam_Altman) or [Dario Amodei](https://en.wikipedia.org/wiki/Dario_Amodei) vaguely describing what they want?

Well, this is a tale as old as time. Three years ago, there was this [Reddit thread](https://www.reddit.com/r/cscareerquestions/comments/zopmwf/why_do_software_engineers_code_less_as_the_move/) where a frustrated new grad Software Engineer expressed concerns about coding less as they advance in their career. The top comment sums it up. "The real value in this profession isn't writing code. It's determining what code to write."

This pattern existed before AI coding was so big. AI just accelerated it.

## Software Engineering Has Always Been More Than Writing Code

Here's a non-exhaustive list of what software engineers actually do beyond typing code. AI can help with all of these. But the day AI can handle this entire list with a vague "hey just make things work" prompt from a non-technical business person is the day we're actually in trouble.

* Requirements clarification, turning vague asks into crisp acceptance criteria
* Scoping and estimation, breaking work into milestones, sequencing dependencies
* System design and architecture decisions, tradeoffs, capacity planning
* Reading and understanding existing codebases, reverse engineering behavior
* Debugging production issues, root cause analysis, incident reports and postmortems
* Observability work like logging, metrics, tracing, dashboards, and alert tuning
* Performance profiling and optimization, latency and throughput analysis
* Reliability engineering with service level agreements, error budgets, load testing, chaos testing, resilience patterns
* Test strategy design for unit, integration, contract, and end-to-end tests
* Release engineering with rollout plans, canaries, feature flags, and rollback strategies
* CI/CD pipeline design and maintenance, build speed improvements, flaky test elimination
* Dependency management including upgrades, vulnerability patching, compatibility testing
* Security engineering with threat modeling, secure defaults, secrets management, least privilege IAM
* Compliance and privacy including data classification, retention policies, audit readiness
* Data engineering like schema design, migrations, backfills, and data quality checks
* API design with versioning, backward compatibility, contracts, and documentation
* Documentation that removes ambiguity like runbooks, design docs, and onboarding guides
* Code review and design review, mentoring, setting engineering standards
* Vendor and platform evaluation for build vs buy decisions, tool selection, cost and risk analysis
* FinOps cost control with usage monitoring, right-sizing, budgeting, and cost anomaly detection
* Cross-team coordination for integrations, migration plans, and deprecations

This is the job. Writing code is just one piece. AI makes you faster at the code part, but someone still needs to own the whole process.

## Why LLMs Can't Replace You (Yet)

I want to be clear about the limitations here. LLMs are powerful tools, but they have fundamental constraints that matter for real engineering work.

There's a very thoughtful piece on this topic, [Why LLMs Can't Build Software](https://zed.dev/blog/why-llms-cant-build-software), that explains how LLMs cannot maintain the mental models required for complex software development. They can generate code that looks right, but they can't verify their own reasoning or truly understand the system they're building into. You still need humans who can hold context across the many codebases of an enterprise level company, reason about edge cases the AI never considered, and make judgment calls about architecture.

[Simon Willison](https://en.wikipedia.org/wiki/Simon_Willison), a respected voice in the developer community, makes a related point in [Your Job is to Deliver Code You Have Proven to Work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/).

> Almost anyone can prompt an LLM to generate a thousand-line patch and submit it for code review. That's no longer valuable. What's valuable is contributing code that is proven to work.

The proof is where the skill lives. Manual testing, automated tests, understanding edge cases. This is what separates a developer from someone who just prompts AI and hopes for the best.

## Vibe Coding vs. Vibe Engineering

There's been a lot of buzz around "[vibe coding](https://en.wikipedia.org/wiki/Vibe_coding)," a term coined by [Andrej Karpathy](https://en.wikipedia.org/wiki/Andrej_Karpathy), who helped found OpenAI and worked on the foundation models that became GPT. Vibe coding refers to the fast and loose approach where you prompt AI and accept whatever comes out if it seems to work. Ironically, the term was coined by someone as technical as it gets. [Simon Willison](https://en.wikipedia.org/wiki/Simon_Willison) coined a different term in [Vibe Engineering](https://simonwillison.net/2025/Oct/7/vibe-engineering/), working with AI tools while staying "proudly and confidently accountable for the software you produce."

The distinction matters. Vibe coding is fine for a lot of things. I mean, even [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), creator of [Linux](https://en.wikipedia.org/wiki/Linux_kernel) and [Git](https://en.wikipedia.org/wiki/Git), an all time software engineering great, [is vibe coding these days](https://www.zdnet.com/article/linus-torvalds-vibe-coding-ai/). But for anything sufficiently serious, you shouldn't even try it. Willison's concept of _vibe engineering_ is more appropriate for production software or anything where you actually care about it working and being maintainable. That means writing automated tests and having AI write them too, planning before implementing, maintaining good version control habits, developing strong code review skills, and building the ability to recognize when AI is wrong.

As [Willison puts it](https://simonwillison.net/2025/Oct/7/vibe-engineering/):

> AI tools amplify existing expertise. The more skills and experience you have as a software engineer the faster and better the results you can get from working with LLMs and coding agents.

## The Illusion of Vibe Coding

This section's title is a direct pull from a great article I think you should read by [Frantisek Lucivjansky](https://www.linkedin.com/in/frantiseklucivjansky/).

[The Illusion of Vibe Coding: There Are No Shortcuts to Mastery](https://shiftmag.dev/the-illusion-of-vibe-coding-5297/)

I'll summarize. If you skip the hard work of actually understanding how code works, you will hit a wall. AI can generate code, but you need a technical foundation to debug it, extend it, and fix it when things break. And things always break. **Always**.

This isn't just opinion. Anthropic, the company behind Claude, published research confirming this. In [How AI Assistance Impacts the Formation of Coding Skills](https://www.anthropic.com/research/AI-assistance-coding-skills), they found that developers using AI assistance scored 17% lower on comprehension tests than those who coded by hand. The largest gap was in debugging skills, the very skill you need most when AI-generated code breaks. This [Reddit discussion](https://www.reddit.com/r/programming/comments/1qqxvlw/anthropic_ai_assisted_coding_doesnt_show/) about the research is worth reading too.

Here's some insightful comments from that thread:

> I'm not gonna lie, using AI is like a performance-enhancing drug for the brain. But it also helps me realize when I should independently spike and research, because it's constantly making up sh*t that SHOULD work but just ain't so. Human + AI is best, but juniors probably shouldn't be using it, in much the same way that teenagers should not be drinking alcohol. Many will still be using occasionally, but not having good boundaries around it means you're one big AWS outage away from having half your brain ripped out.
>
> — [u/Boxy310 on Reddit](https://www.reddit.com/r/programming/comments/1qqxvlw/comment/o2lbipm/)

---

> There's an important caveat here: "However, some in the AI group still scored highly [on the comprehension test] while using AI assistance. When we looked at the ways they completed the task, we saw they asked conceptual and clarifying questions to understand the code they were working with—rather than delegating or relying on AI." As usual, it all depends on you. Use AI if you wish, but be mindful about it.
>
> — [u/ZenDragon on Reddit](https://www.reddit.com/r/programming/comments/1qqxvlw/comment/o2kig4j/)

---

> The article is weird. It seems to say that in general across all professions, there are significant productivity gains. But for software development specifically, the gains don't really materialize because developers who rely entirely on AI don't actually learn the concepts - and as a result, productivity gains in the actual writing of the code are all lost by reduced productivity in debugging, code reading, and understanding the actual code. Which, honestly, aligns perfectly with my own real life perception. There are definitely times where AI saves me hours of work. There are also times where it definitely costs me hours in other aspects of the project.
>
> — [u/\_BreakingGood\_ on Reddit](https://www.reddit.com/r/programming/comments/1qqxvlw/comment/o2k6pub/)

So, **you still need to learn how to code alongside computer science fundamentals**. Pick a language (I'd suggest [Python](https://www.tiobe.com/tiobe-index/)) and invest time in understanding how computers, code, and software actually work.

If you want a great resource for building that foundation, check out [From Nand to Tetris](https://www.nand2tetris.org/), which is [also on Coursera](https://www.coursera.org/learn/build-a-computer). It's a project that teaches you how a general-purpose computer system and its software function from the ground up. AI can't accelerate you in real-world software engineering if you're useless without it. Build the foundation first.

## A Historical Perspective

Here's a historical perspective that I find grounding. [Stephan Schwab](https://linkedin.com/in/stephanschwab) wrote [Why We've Tried to Replace Developers Every Decade Since 1969](https://caimito.net/2025/02/09/the-recurring-dream-of-replacing-developers.html), which does an excellent job showing how long before AI coding became hot in 2022, people have been trying to get rid of developers.

Did you know that [COBOL](https://en.wikipedia.org/wiki/COBOL) was thought of by business people as a tool that'd allow them to fire all their software developers? COBOL! It stands for Common Business-Oriented Language. They thought it would let business people vaguely describe what they want and thus maintain production-grade software in a for-profit company. How'd that turn out?

We've been here before. Every few decades, someone claims that a new technology will eliminate the need for developers. None of these predictions came true because the fundamental complexity of software development cannot be abstracted away. The complexity just moves.

This doesn't mean AI isn't transformative. It is. But it's transformative in the way that power tools are transformative for carpenters, or calculators for accountants. You still need to know what you're doing.

## The Junior Developer Question

One of the hottest topics in tech circles these days is "will AI kill entry-level programming jobs?" It's a fair concern given headlines about job market struggles and declining internship opportunities.

I personally think there's still plenty of work to do and that we won't see all junior roles disappear. But this is a raging debate. Thoughtful people with deep technical expertise are on both sides of it. We have job trend data, but it's not clear how much of the decline is from companies redirecting spending to build more data centers and AI infrastructure versus the jobs themselves actually being done by AI.

For a balanced overview of where things stand, start with [Addy Osmani's](https://www.linkedin.com/in/addyosmani) (Software Engineer at Google working on [Google Cloud](https://cloud.google.com/) and [Gemini](https://gemini.google.com/app)) piece:

[Addy Osmani  - The Next Two Years of Software Engineering](https://addyosmani.com/blog/next-two-years/)

From there, here's a collection of articles from people who have thought deeply about this. Read them and form your own opinion.

**The case that juniors can thrive:**

* [Kent Beck - The Bet On Juniors Just Got Better](https://tidyfirst.substack.com/p/the-bet-on-juniors-just-got-better)
* [Andrew Ng - Why You Should Learn to Code and not Fear AI.](https://www.linkedin.com/feed/update/urn:li:activity:7305984835708141570/)
* [Andrew Ng - An 18 Year Old's Dilemma: Too Late to Contribute to AI?](https://www.linkedin.com/feed/update/urn:li:activity:7394769800234766336/)
* [GitHub's Blog (Gwen Davis) - Junior Developers Aren't Obsolete: Here's How To Thrive in the Age of AI](https://github.blog/ai-and-ml/generative-ai/junior-developers-arent-obsolete-heres-how-to-thrive-in-the-age-of-ai/)
* [Time Magazine (Marcus Fontoura) - You Should Still Study Tech — Even if AI Replaces Entry Tech Jobs](https://time.com/7335048/study-tech-ai-replace-jobs)
* [Thomas Dohmke - Developers, Reinvented](https://ashtom.github.io/developers-reinvented)
* [Nicholas C. Zakas - From Coder to Orchestrator: The Future of Software Engineering With AI](https://humanwhocodes.com/blog/2026/01/coder-orchestrator-future-software-engineering)
* [Latent Space - The Rise of the AI Engineer](https://www.latent.space/p/ai-engineer)

**The case that things are getting harder (or...it's over) for juniors:**

* [Stack Overflow Blog (Phoebe Sajor) - AI vs Gen Z: How AI Has Changed the Career Pathway for Junior Developers](https://stackoverflow.blog/2025/12/26/ai-vs-gen-z/)
* [Kaustubh Saini - 9 Entry-Level Jobs Are Disappearing Fast Because of AI](https://www.finalroundai.com/blog/entry-level-jobs-disappearing-fast-because-of-ai)
* [Time Magazine (Luke Drago and Rudolf Laine) - What Happens When AI Replaces Workers?](https://time.com/7289692/when-ai-replaces-workers)
* [Namanyay Goel - New Junior Developers Can't Actually Code](https://nmn.gl/blog/ai-and-learning)
* [Fortune (Chris Morris) - Anthropic CEO Warns AI Could Eliminate Half of All Entry-Level White-Collar Jobs](https://fortune.com/2025/05/28/anthropic-ceo-warning-ai-job-loss)

## Should I Still Grind LeetCode?

Yes. The answer is yes. Not because it makes sense, not because you'll ever use LeetCode style clean and contained problem solving skills at work, but because companies are still asking these questions right now. Are you trying to get hired or complain about the state of the world? If you're trying to get a job in tech, unfortunately yes, you still need to grind LeetCode.

Even though AI can solve most all LeetCode problems instantly, companies still use these questions as a baseline filter. Can you think algorithmically at all? Do you understand time and space complexity? Can you reason about tradeoffs? LeetCode is an imperfect proxy for these things, but it's the proxy most companies still use. Until the industry catches up to the reality of AI-assisted development and interviews (like [Canva](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/) and [Meta](https://www.wired.com/story/meta-ai-job-interview-coding/)), you have to play the game.

Here are the best resources for grinding effectively.

* [Tech Interview Handbook](https://www.techinterviewhandbook.org/) The best "hand hold me through this" guide online. All you need is on the pages here.
* [Grind 75](https://www.techinterviewhandbook.org/grind75/) For a structured "what problems should I focus on" plan that's been curated over years by the tech community.
* [System Design Primer](https://github.com/donnemartin/system-design-primer) For everything you need to pass system design interview rounds.

## Some Companies Are Letting Candidates Use AI In Technical Interviews

While LeetCode is still a thing that anyone interviewing for tech roles has to deal with, there are some companies catching on to the fact that with AI, it no longer makes sense to ask those questions. It doesn't reflect what this person would be doing at work should you hire Them. Check these out.

* [Canva - Yes, You Can Use AI in Our Interviews. In Fact, We Insist](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/)
* [Wired - Meta Is Going to Let Job Candidates Use AI During Coding Tests](https://www.wired.com/story/meta-ai-job-interview-coding/)
* [Reddit Testimonial - Canva's AI Assisted Coding Interview](https://www.reddit.com/r/cscareerquestionsOCE/comments/1mjos7d/canvas_ai_assisted_coding_interview/)

The common theme across all of these new AI-assisted interviews is:

* They fully expect you to use AI. Copy/paste the problem into the chat window. They want to see what you'd actually do at work.
* You're still expected to sit in the driver's seat. AI is a copilot.
* You still own the plan, the tradeoffs, the correctness, and the proof.
* You will need to explain your thinking out loud. The solution AI built, the time and space complexity, what prompts you're writing next and why. If you type "hey do all this work I have no idea what I'm doing" that's a clear no hire signal. If you're writing intelligent technical prompts that provide guidance, direction, and pushback, that's a pilot using a copilot effectively.

## In Conclusion

The industry is still figuring things out, but the direction is clear. Coding as a task is getting automated. It's gone fam. If you want to just write code by hand all day as a career, it's over. But software engineering as a discipline, the judgment, the systems thinking, the verification, that's becoming more valuable, not less.

Finally, I really think students should read [Latent Space's AI Engineer article](https://www.latent.space/p/ai-engineer). If you're even a little bit technical and know how to tinker and put things together, you cna do amazing things quickly with AI, even if you're no good at LeetCode.

Don't fight AI. You won't win. Adapt or die.
