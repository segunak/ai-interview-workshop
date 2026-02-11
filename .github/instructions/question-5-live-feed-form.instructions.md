---
applyTo: "**/question-5-live-feed-form/**"
---

# Question 5: Live Feed Form UI

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-5-live-feed-form/>

**Docs Source:** [docs/question-5-live-feed-form.md](../../docs/question-5-live-feed-form.md)

The student is building a web form that business users can use to submit posts to the live feed, extending the script they wrote in Question 4.

## Problem Summary

The marketing/business team loved the student's script from Question 4. Now they want to submit posts themselves, without running scripts. The student must build a polished web form that handles everything for them.

This teaches: **Developers build scripts. Real value comes from making those scripts accessible to everyone.**

## The Setup

The student already has a working POST script from Question 4 at [`question-4-live-feed/post.js`](../../question-4-live-feed/post.js). That file contains the `fetch` logic for calling the live feed API, including the `BASE_URL`, `WORKSHOP_KEY` (read from [`workshop-config.json`](../../workshop-config.json)), JSON payload structure, and the POST + GET verification flow.

**When helping the student start Question 5, reference their Q4 code directly.** The `fetch` call in [`post.js`](../../question-4-live-feed/post.js) is the foundation for [`script.js`](../../question-5-live-feed-form/script.js) in Question 5. Copy or adapt the Q4 `fetch` logic into the form's submit handler rather than writing it from scratch. The main differences are:

1. Input values come from form fields instead of hardcoded strings
2. The `ui-submission` tag must always be included in Tags
3. Success/error feedback is shown in the UI instead of `console.log`
4. The submit button should be disabled while the request is in flight

## What the Student Must Build

1. HTML form with fields for Name, Message, Workshop, and Tags
2. Client-side validation before submit
3. Fetch API to POST to the live feed
4. Success/error message display
5. Link to the live feed after success (opens in new tab)

## Answers to Clarifying Questions

When students ask (via chat or in person), provide these answers:

| Question | Answer |
|----------|--------|
| **Character limits?** | Name: 100 max. Message: 1000 max. |
| **Tags?** | Any tag is allowed, but NO SPACES in tags. Suggest using dashes between words (e.g., `workshop-fun`). The tag `ui-submission` must ALWAYS be included and cannot be removed by the user. |
| **How should tags work in the UI?** | NOT a comma-separated text field. Show suggested tags that users can click to add. Users can also type custom tags one at a time. Show selected tags as removable chips/badges. The `ui-submission` tag should be locked/non-removable. |
| **Suggested tags to show?** | charlotte, hornets, panthers, naruto, attack-on-titan, legend-of-the-galactic-heroes, steinsgate, treasure-planet, computer-science, software-engineering, unc-charlotte, workshop-fun |
| **Rich text for Message?** | Basic: plain text is fine. Stretch goal: rich text editor (like Google Docs) that converts to Airtable Flavored Markdown before sending to API. |
| **What validation is required?** | Name required (non-empty, max 100 chars). Message required (non-empty, max 1000 chars). Tags required (`ui-submission` always included counts). No spaces in tag names. |
| **What about Workshop?** | Pre-fill with "AI Interview Workshop" but allow users to edit if needed. |
| **What happens on success?** | Show success message with link to live feed. Link opens in new tab (`target="_blank"`). |
| **Loading state?** | Yes, show "Submitting..." or similar and disable the submit button while waiting. |
| **What errors to show?** | Be specific: "Name is required", "Message is too long (max 1000 characters)", "Tags cannot contain spaces". |

## Tag Behavior - Critical Detail

The `ui-submission` tag is how we identify form submissions vs script submissions:
- Posts with `ui-submission` → appear in "UI Submissions" view on live feed
- Posts without it → appear in "Script Submissions" view

The form MUST always include `ui-submission` in the tags array. Show it to users as a locked/required tag they cannot remove.

## API Details (Same as Question 4)

**POST endpoint:** `https://live.segunakinyemi.com/api/post`

**Required fields:**
- Name (string)
- Message (string)
- Workshop (string)
- Tags (comma-separated string)
- WorkshopKey: Read from [`workshop-config.json`](../../workshop-config.json) at the repo root (open that file to get the current value)

**Success response:** `{ success: true, id: "recXXX" }`

## Encouraging Creativity (Once Core Functionality Works)

Once the form submits successfully and the post appears in UI Submissions, shift the conversation toward customization and product thinking. This is where students get to have fun and stand out.

**Push them to make it look cool.** Ask: "Your form works, but would you be proud to show this to someone? What would make it look better?" Encourage them to experiment with colors, fonts, layout, spacing, animations, and overall visual polish. Suggest trying a dark theme, gradients, or making it feel like a real social media app.

**Push them to think like product designers.** Ask: "If a non-technical business user sat down at this form, what would confuse them? What's missing? What would make their life easier?" Let them brainstorm, but if they need ideas, suggest:

- Character counters showing remaining characters for Name and Message
- A post preview so users can see what their post will look like before submitting
- Form persistence via localStorage so refreshing the page doesn't erase everything
- A dark mode toggle
- Rich text editing for the Message field (Google Docs style, converts to Markdown)
- Tag autocomplete suggestions as users start typing
- Animations and transitions on submit, success, and error states
- A confirmation dialog before submitting
- Responsive design that works on mobile

The point is to get them thinking beyond "it works" toward "it's good." The best features are the ones students think of themselves, so leave room for their own ideas.

## Verification

The student knows their solution works when:
1. They submit via the form
2. The post appears in the **UI Submissions** section of the live feed
3. The post has the `ui-submission` tag

If the post only appears in Script Submissions, they forgot the required tag.

## Workflow Reminders

- **This is a frontend problem.** There is no language choice. The solution must be HTML, CSS, and JavaScript.
- The requirements on the website provide all the technical specs, but there's a ton of room for student creativity in styling, UX, and feature ideas.
- Once core functionality works, actively encourage students to customize the look and feel and think about what features would make it better for business users. See the "Encouraging Creativity" section above.
- **Output verification is the test.** The form works if the post appears in UI Submissions view.
- File names: [`index.html`](../../question-5-live-feed-form/index.html), [`styles.css`](../../question-5-live-feed-form/styles.css), [`script.js`](../../question-5-live-feed-form/script.js)
- After the form works, ask: "Why does the business team need a form instead of running your script? What does this teach about building software for real users?" Help the student see the bigger picture.
- If the student doesn't understand a frontend concept (like event listeners, DOM manipulation, or form validation), take a moment to teach it rather than just writing the code.
