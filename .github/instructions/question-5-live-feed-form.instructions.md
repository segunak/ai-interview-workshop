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

The student already has a working POST script from Question 4 at [`question-4-live-feed/post.js`](../../question-4-live-feed/post.js). That file contains the `fetch` logic for calling the live feed API, including the `BASE_URL`, `WORKSHOP_KEY`, JSON payload structure, and the POST + GET verification flow.

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
- WorkshopKey: `cinnamon-rolls-are-the-best-pastry-hands-down`

**Success response:** `{ success: true, id: "recXXX" }`

## Stretch Goals (For Fast Students)

1. **Rich text editor** for Message field that converts to Markdown before sending
2. **Tag autocomplete** showing suggested tags as user types
3. **Character counter** showing remaining characters for Name and Message
4. **Dark mode** toggle
5. **Form persistence** - save draft to localStorage so users don't lose work on refresh

## Verification

The student knows their solution works when:
1. They submit via the form
2. The post appears in the **UI Submissions** section of the live feed
3. The post has the `ui-submission` tag

If the post only appears in Script Submissions, they forgot the required tag.

## Workflow Reminders

- **This is a frontend problem.** There is no language choice. The solution must be HTML, CSS, and JavaScript.
- The requirements on the website provide all the technical specs, but there's room for student creativity in styling and UX.
- Encourage students to make it their own while meeting the requirements.
- **Output verification is the test.** The form works if the post appears in UI Submissions view.
- File names: [`index.html`](../../question-5-live-feed-form/index.html), [`styles.css`](../../question-5-live-feed-form/styles.css), [`script.js`](../../question-5-live-feed-form/script.js)
