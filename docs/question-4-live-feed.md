---
title: "Question 4: Live Feed"
nav_order: 6
---

# Question 4: Live Feed POST + Verify

{: .important }
**Before you start:** Open [`QUESTION-4-START-HERE.md`](../question-4-live-feed/QUESTION-4-START-HERE.md) in the [`question-4-live-feed/`](../question-4-live-feed/) folder and keep it open while you work. This loads the AI context GitHub Copilot needs to help you effectively.

## Why This Problem?

This is a practical API integration problem. It reflects a growing trend in technical interviews. Companies are letting candidates use AI tools, but they want to see you solve real-world problems, not just algorithm puzzles. Making API calls, handling authentication, and debugging HTTP requests are everyday engineering tasks.

Companies like Canva and Meta have started allowing AI in interviews because they recognize that AI is part of modern software development. What matters is whether you can actually build things and explain your work.

**Read more about AI-assisted interviews:**

- [Canva: Yes, You Can Use AI in Our Interviews](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/)
- [Wired: Meta AI Job Interview Coding](https://www.wired.com/story/meta-ai-job-interview-coding/)
- [Reddit: Canva's AI-Assisted Coding Interview](https://www.reddit.com/r/cscareerquestionsOCE/comments/1mjos7d/canvas_ai_assisted_coding_interview/)

## Goal

1. Make a POST request to create a new post on the live feed
2. **Programmatically verify** the post exists in the database using the returned ID

A [200 OK response](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) means nothing to stakeholders in the real world. Business users don't care about HTTP status codes. They care whether the data shows up. Your code must prove the post made it to the database, not just trust the API response. Welcome to real world software engineering!

## The Live Feed

Open this URL in your browser to see the live feed:

**<https://live.segunakinyemi.com>**

This page displays messages posted by workshop participants in real-time. Your goal is to make your message appear on this board AND verify it programmatically.

## API Endpoints

### POST `/api/post`

Creates a new post.

**URL:** <https://live.segunakinyemi.com/api/post>

**Method:** `POST`

**Content-Type:** `application/json`

**Required Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | Your name or alias |
| `Message` | string | What you want to say |
| `Workshop` | string | Workshop name (e.g., "AI Interview Workshop") |
| `WorkshopKey` | string | Secret key (see below) |

**Optional Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags for your post |

**Success Response (200):**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

{: .important }
Save the `id` from this response. You need it to verify your post exists.

**Error Response (401 - Invalid Key):**

```json
{
  "success": false,
  "error": "Invalid or missing WorkshopKey"
}
```

**Error Response (400 - Missing Fields):**

```json
{
  "success": false,
  "error": "Name is required"
}
```

Other missing field errors: `"Message is required"`, `"Workshop is required"`

### GET `/api/posts`

Retrieves posts for verification. Supports two query modes.

**Mode 1: Verify a specific post by ID**

Use the `id` returned from your POST request:

```txt
GET https://live.segunakinyemi.com/api/posts?id=recXXXXXXXXX&WorkshopKey=your-key
```

**Success Response (200):**

```json
{
  "success": true,
  "post": {
    "id": "recXXXXXXXXX",
    "name": "Qorin Halfhand",
    "message": "First programmer checking in!",
    "workshop": "AI Interview Workshop",
    "tags": ["python", "first-post"],
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
GET https://live.segunakinyemi.com/api/posts?workshop=AI%20Interview%20Workshop&WorkshopKey=your-key
```

**Success Response (200):**

```json
{
  "success": true,
  "count": 12,
  "workshop": "AI Interview Workshop",
  "posts": [
    {
      "id": "recXXXXXXXXX",
      "name": "Qorin Halfhand",
      "message": "First programmer checking in!",
      "workshop": "AI Interview Workshop",
      "tags": ["python"],
      "createdAt": "2026-02-09T22:30:00.000Z"
    }
  ]
}
```

**Mode 3: List recent posts by tag**

```txt
GET https://live.segunakinyemi.com/api/posts?tag=python&WorkshopKey=your-key
```

**Response:** `{ success: true, count: 5, tag: "python", posts: [...] }`

## WorkshopKey

<details>
<summary>Click to reveal the WorkshopKey</summary>

The WorkshopKey value is `cinnamon-rolls-are-the-best-pastry-hands-down`. Your code will need to pass this key for things to work!

</details>

## Example Request Flow

**Step 1: POST to create your message**

```json
{
  "Name": "Qorin Halfhand",
  "Message": "First programmer checking in!",
  "Workshop": "AI Interview Workshop",
  "WorkshopKey": "your-workshop-key-here"
}
```

**Step 2: Save the ID from the response**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recABC123XYZ"
}
```

**Step 3: GET to verify the post exists**

```txt
GET /api/posts?id=recABC123XYZ&WorkshopKey=your-workshop-key-here
```

**Step 4: Confirm the post data matches**

Only print success after verification returns your post.

## Your Task

1. Write a script that sends a POST request to create a post
2. Capture the `id` from the POST response
3. Send a GET request to verify the post exists using that `id`
4. Only print success confirmation after verification succeeds
5. Handle errors gracefully

## Choose Your Tool

This problem uses **JavaScript** with the `fetch` API (built into Node.js 18+, no install needed). Using JavaScript here sets you up for Question 5, where you'll build a frontend form that reuses the same `fetch` logic.

{: .note }
Read the full API documentation above. The answer to most questions is already here.

## Workshop Workflow

### 1. Clarifying Questions

- What does the POST response contain that I need for verification?
- How do I pass the WorkshopKey for GET requests vs POST requests?
- What HTTP status code indicates the post was not found?
- What happens if I verify before the post has propagated?

{: .note }
**Propagation Delay:** In real distributed systems, writes may not be immediately visible to reads. If your GET verification fails immediately after POST, consider adding a short delay or retry logic.

### 2. Plan Your Approach

1. Open [`post.js`](../question-4-live-feed/post.js) (starter file is pre-created with constants and a function skeleton)
2. Construct the POST request with JSON payload using `fetch`
3. Parse the response and extract the `id`
4. Construct the GET request with `id` and `WorkshopKey` as query params
5. Check the verification response
6. Print confirmed success or handle failure

### 3. Verify

Your script should only claim success after the GET request confirms the post exists.

## Deliverables

Write your solution in [`question-4-live-feed/post.js`](../question-4-live-feed/post.js). A starter file is already there with `BASE_URL` and `WORKSHOP_KEY` constants and a `postMessage()` function skeleton.

Run with: `node post.js`

Your script should print:

```txt
Posted OK: "<message>" (name=<name>, id=<id>)
Verified: post exists in database
```

**The GET verification step is your test.** If your script prints "Verified: post exists in database", you've proven it works.

## Extension Challenges

If you finish early:

1. **Add Tags** - Include the `Tags` field with your school name or something fun
2. **Make it interactive** - Prompt for name and message instead of hardcoding
3. **Add retry logic** - If verification fails, wait a moment and try again (real engineers think about propagation delays)
4. **Add error handling** - Handle network failures, timeouts, and unexpected API responses gracefully
