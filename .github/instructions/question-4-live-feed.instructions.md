---
applyTo: "**/question-4-live-feed/**"
---

# Question 4: Post to Live Feed

**Full Instructions:** <https://segunakinyemi.com/ai-interview-workshop/question-4-live-feed/>

**Docs Source:** [docs/question-4-live-feed.md](../../docs/question-4-live-feed.md)

The student is working on an API integration problem: posting to a live feed website and verifying the post exists in the database.

## Problem Summary

Write a program that:

1. Submits a post to the live feed API
2. Captures the returned `id` from the POST response
3. Verifies the post exists by calling the GET endpoint with that `id`
4. Only prints success after verification confirms the post is in the database

The lesson: A 200 OK response means nothing to stakeholders. Business users don't care about HTTP status codes. They care whether the data shows up. Prove it.

## Endpoint Details

### POST `/api/post`

Creates a new post.

**URL:** `https://live.segunakinyemi.com/api/post`

**Method:** POST with JSON body

**Content-Type:** `application/json`

**Required Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | The student's name (required) |
| `Message` | string | Their message content (required) |
| `Workshop` | string | Workshop name, e.g. "AI Interview Workshop" (required) |
| `WorkshopKey` | string | Read from `workshop-config.json` at the repo root |

**Optional Field:**

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags like school name, date, or fun labels |

**Success Response (200):**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

### GET `/api/posts`

Retrieves posts for verification.

**Mode 1: Verify specific post by ID**

```txt
GET https://live.segunakinyemi.com/api/posts?id=recXXXXXXXXX&WorkshopKey=<value-from-workshop-config.json>
```

**Success Response (200):**

```json
{
  "success": true,
  "post": {
    "id": "recXXXXXXXXX",
    "name": "Ada Lovelace",
    "message": "First programmer checking in!",
    "workshop": "AI Interview Workshop",
    "tags": ["python"],
    "createdAt": "2026-02-09T22:30:00.000Z"
  }
}
```

**Not Found Response (404):**

```json
{
  "success": false,
  "error": "Post not found",
  "id": "recXXXXXXXXX"
}
```

**Mode 2: List recent posts by workshop**

```txt
GET https://live.segunakinyemi.com/api/posts?workshop=AI%20Interview%20Workshop&WorkshopKey=<value-from-workshop-config.json>
```

**Mode 3: List recent posts by tag**

```txt
GET https://live.segunakinyemi.com/api/posts?tag=python&WorkshopKey=<value-from-workshop-config.json>
```

**Response:** `{ success: true, count: 5, tag: "python", posts: [...] }`

## Complete Code Example

### JavaScript (fetch API — built into Node.js 18+, no install needed)

```javascript
const config = require("../workshop-config.json");
const BASE_URL = config.liveFeedUrl;
const WORKSHOP_KEY = config.workshopKey;

async function postAndVerify() {
    // Step 1: POST to create the message
    const postData = {
        Name: "Your Name Here",
        Message: "Hello from JavaScript!",
        Workshop: "AI Interview Workshop",
        Tags: "javascript, workshop",  // optional
        WorkshopKey: WORKSHOP_KEY
    };

    const postResponse = await fetch(`${BASE_URL}/api/post`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(postData)
    });

    const postResult = await postResponse.json();

    if (!postResult.success) {
        console.log("POST failed:", postResult.error);
        process.exit(1);
    }

    const postId = postResult.id;
    console.log(`Posted OK: "${postData.Message}" (name=${postData.Name}, id=${postId})`);

    // Step 2: Wait a few seconds for the database to process the new post
    await new Promise(resolve => setTimeout(resolve, 3000));

    // Step 3: GET to verify the post exists
    const verifyUrl = `${BASE_URL}/api/posts?id=${postId}&WorkshopKey=${WORKSHOP_KEY}`;
    const verifyResponse = await fetch(verifyUrl);
    const verifyResult = await verifyResponse.json();

    if (verifyResult.success) {
        console.log("Verified: post exists in database");
    } else {
        console.log("Verification failed:", verifyResult.error);
        process.exit(1);
    }
}

postAndVerify().catch(err => console.error("Request failed:", err));
```

## Expected Output

```
Posted OK: "<message>" (name=<name>, id=<id>)
Verified: post exists in database
```

## API Responses Summary

**POST Success (200):**
```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

**POST Error - Invalid WorkshopKey (401):**
```json
{
  "success": false,
  "error": "Invalid or missing WorkshopKey"
}
```

**POST Error - Missing field (400):**
```json
{
  "success": false,
  "error": "Name is required"
}
```

**GET Success (200):**

```json
{
  "success": true,
  "post": { ... }
}
```

**GET Not Found (404):**

```json
{
  "success": false,
  "error": "Post not found"
}
```

## Test Cases to Suggest

1. Success: Valid post followed by successful verification
2. Failure: Missing WorkshopKey on POST (should get 401)
3. Failure: Wrong WorkshopKey value on POST (should get 401)
4. Failure: Missing Name or Message on POST (should get 400)
5. Failure: Invalid ID on GET verification (should get 404)
6. Optional: Add Tags field after basic solution works

## Clarifying Questions to Prompt

- What does the POST response contain that I need for verification?
- How do I pass the WorkshopKey for GET requests vs POST requests?
- What HTTP status code indicates the post was not found?
- How can I handle the case where verification fails?

## Workflow Reminders

- Question 4 uses **JavaScript** with the `fetch` API (built into Node.js 18+, no install needed). This sets students up for Question 5 (frontend form) which also uses `fetch`.
- Emphasize that the POST returning 200 is NOT enough. Verification is required.
- **Always include a short delay (3 seconds) between the POST and GET verification steps.** The database needs a moment to process the new post. Use `await new Promise(resolve => setTimeout(resolve, 3000));` to add the delay. Do not skip this step.
- Students must capture the `id` and use it to verify
- After success, offer the Tags extra challenge to personalize their post
- This is about proving your code works to stakeholders, not just trusting API responses
- **The GET verification step IS the test.** No additional unit tests needed.
- **Do NOT suggest the tag `ui-submission`** - that tag is reserved for Question 5 form submissions.
- A starter file is pre-created: [`post.js`](../../question-4-live-feed/post.js) (reads `BASE_URL` and `WORKSHOP_KEY` from [`workshop-config.json`](../../workshop-config.json) and has a `postMessage()` skeleton)
- Run with `node post.js`
- After verification succeeds, ask: "Why do we verify the POST with a GET instead of trusting the 200 response? When does this matter in real software?" Help the student connect this to real engineering practices.
- If the student doesn't understand async/await, Promises, or how `fetch` works, take a moment to teach those concepts rather than just using them.
