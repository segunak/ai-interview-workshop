# Question 5: Live Feed Form UI

> **Keep this file open while working on Question 5.** It loads the AI context GitHub Copilot needs to help you effectively.

> **Select the Workshop Agent** in the Copilot Chat panel for guided coaching through the question.

> These instructions are also available at <https://segunakinyemi.com/ai-interview-workshop/question-5-live-feed-form/>.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

## Why This Problem?

This problem teaches a critical real-world lesson: **Developers build scripts. Real value comes from making those scripts accessible to everyone.**

Your script from Question 4 works great. But business users don't run scripts. They use forms. Your job is to turn your developer tool into a product anyone can use.

## The Scenario

The marketing team loved your demo from Question 4. They want to post workshop highlights themselves, without asking you to run a script every time.

Build them a web form.

## Technology

> This is a **frontend problem**. Your solution must use **HTML**, **CSS**, and **JavaScript**. Don't over engineer things, no need for frontend frameworks (React, Angular, NextJS, Remix.js, etc.).

## Building on Question 4

Your `fetch` logic from [`question-4-live-feed/post.js`](../question-4-live-feed/post.js) is the foundation for this problem. Reuse that API call code in `script.js` instead of writing it from scratch.

## Requirements

Build a form that:

- Collects their name, message, and tags
- Submits to the live feed API
- Shows success/error feedback
- Links to the live feed so they can see their post

### Field Specifications

| Field | Required | Constraints |
|-------|----------|-------------|
| Name | Yes | Max 100 characters |
| Message | Yes | Max 1000 characters |
| Workshop | Yes | Pre-fill with "AI Interview Workshop" |
| Tags | Yes | See tag requirements below |

### Tag Requirements

Tags have specific rules:

- **No spaces allowed** in tag names. Use dashes instead (e.g., `workshop-fun`, not `workshop fun`)
- The tag `ui-submission` **must always be included** and cannot be removed by the user
- Show tags as clickable chips/badges, not a comma-separated text field
- Users can click suggested tags to add them, or type custom tags
- Selected tags should be removable (except `ui-submission`)

**Suggested tags to offer:** charlotte, hornets, panthers, naruto, attack-on-titan, legend-of-the-galactic-heroes, steinsgate, treasure-planet, computer-science, software-engineering, unc-charlotte, workshop-fun

> **Important:** The `ui-submission` tag is how form submissions are identified. Posts with this tag appear in the **UI Submissions** section of the live feed. Posts without it appear in **Script Submissions**. Your form MUST always include this tag.

### UX Requirements

- **Loading state:** Show "Submitting..." and disable the submit button while waiting
- **Success state:** Show a success message with a link to the live feed (opens in new tab)
- **Error messages:** Be specific: "Name is required", "Message is too long (max 1000 characters)", "Tags cannot contain spaces"
- **Validation:** Validate client-side before submitting

### Creativity Welcome

> These requirements provide the technical specifications, but there's room for your own creativity in styling, layout, colors, and UX details. Make it your own while meeting the requirements!

## API Reference

You're using the same API from Question 4.

**POST endpoint:** `https://live.segunakinyemi.com/api/post`

**Fields:**

| Field | Type | Notes |
|-------|------|-------|
| `Name` | string | Required |
| `Message` | string | Required |
| `Workshop` | string | Required, suggest pre-filling |
| `Tags` | string | Comma-separated list |
| `WorkshopKey` | string | Same key from Question 4 (found in [`workshop-config.json`](../workshop-config.json)) |

**Success response:**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

## Workshop Workflow

### 1. Plan

Read through the requirements above carefully. All technical specifications are provided. Then think through:

- Form layout and fields
- Validation rules
- Error message display
- Success state and next steps

### 2. Prove

Direct AI to build your solution in the starter files below. Before testing, predict what should happen when you submit the form. Then submit a post and verify:

1. The form validates correctly
2. The POST succeeds
3. Your post appears in the **UI Submissions** section of the live feed (not Script Submissions)

If your post only appears in Script Submissions, you forgot the required `ui-submission` tag.

### 3. Explain

Walk through your code: how the form collects and validates input, how the fetch call works, and why the business team needs a form instead of running your script.

## Where to Write Your Code

Your code goes in three files in this folder:

- **`index.html`** — Build your form structure here
- **`styles.css`** — Add your styling here
- **`script.js`** — Add your JavaScript and API call logic here

Open these files and write your code in them.

**Visual verification is the test for this problem.** Your form works if you can submit a post and see it appear on the live feed.

## Extension Challenges

If you finish early:

1. **Rich text editing** — Give users a Word-like editor for the message
2. **Tag suggestions** — Autocomplete as users type tags
3. **Character counter** — Show remaining characters
4. **Dark mode** — Add a theme toggle
5. **Draft saving** — Persist form state so users don't lose work on refresh

## The Real-World Connection

This is exactly what happens in software companies every day:

1. Developer builds a script/tool for internal use
2. Business team says "we want to use it too"
3. Developer wraps it in a UI
4. Now it's a product, not just a tool

The ability to turn developer tools into user-facing products is a valuable skill.
