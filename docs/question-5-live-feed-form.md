---
title: "Question 5: Live Feed Form UI"
nav_order: 7
---

# Question 5: Live Feed Form UI

## Why This Problem?

This problem teaches a critical real-world lesson: **Developers build scripts. Real value comes from making those scripts accessible to everyone.**

Your script from Question 4 works great. But business users don't run scripts. They use forms. Your job is to turn your developer tool into a product anyone can use.

## The Scenario

The marketing team loved your demo from Question 4. They want to post workshop highlights themselves, without asking you to run a script every time.

Build them a web form.

## Technology

{: .note }
This is a **frontend problem**. Unlike previous questions, there is no language choice. Your solution must use **HTML**, **CSS**, and **JavaScript**. Don't over engineer things, no need for front end frameworks (React, Angular, NextJS, Remix.js, etc.).

## Requirements

Build a form that:

- Collects their name, message, and tags
- Submits to the live feed API
- Shows success/error feedback
- Links to the live feed so they can see their post

**Additional requirements:**

- Business users shouldn't be able to break anything
- Invalid submissions should be rejected with helpful messages
- The form should be intuitive for non-technical users

{: .important }
Requirements are intentionally vague. Ask your workshop facilitator clarifying questions, **just like you would ask an interviewer or product manager**.

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
| `WorkshopKey` | string | Same key from Question 4 |

**Success response:**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

## Workshop Workflow

### 1. Clarify Requirements

Before building anything, ask your facilitator:

- What are the character limits?
- How should tags work?
- What validation is required?
- What should happen after a successful submission?

### 2. Plan Your Approach

Think through:

- Form layout and fields
- Validation rules
- Error message display
- Success state and next steps

### 3. Build

Create your solution in `question-5-live-feed-form/`. The form should:

- Look professional (doesn't need to be fancy, just clean)
- Validate input before submitting
- Handle loading, success, and error states
- Guide users through the process

### 4. Test

Submit a post using your form and verify:

1. The form validates correctly
2. The POST succeeds
3. Your post appears on the live feed

## Deliverables

Create solution files in `question-5-live-feed-form/`:

- `index.html` - The form structure
- `styles.css` - Styling
- `script.js` - Form logic and API calls

**Visual verification is the test for this problem.** Your form works if you can submit a post and see it appear on the live feed.

## Extension Challenges

If you finish early:

1. **Rich text editing** - Give users a Word-like editor for the message
2. **Tag suggestions** - Autocomplete as users type tags
3. **Character counter** - Show remaining characters
4. **Dark mode** - Add a theme toggle
5. **Draft saving** - Persist form state so users don't lose work on refresh

## The Real-World Connection

This is exactly what happens in software companies every day:

1. Developer builds a script/tool for internal use
2. Business team says "we want to use it too"
3. Developer wraps it in a UI
4. Now it's a product, not just a tool

The ability to turn developer tools into user-facing products is a valuable skill.
