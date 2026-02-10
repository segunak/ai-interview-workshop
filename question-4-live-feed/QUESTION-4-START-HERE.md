# Question 4: Post to Live Feed

> **Keep this file open while working on Question 4.** It loads the AI context GitHub Copilot needs to help you effectively.

> **Select the Workshop Agent** in the Copilot Chat panel for guided coaching through the question.

> These instructions are also available at <https://segunakinyemi.com/ai-interview-workshop/question-4-live-feed/>.

**The AI Rule:** You can use AI for everything, but you must be able to explain everything your AI produces. Plan first, then prove it with tests. **[Your job is to deliver code you have proven to work](https://simonwillison.net/2025/Dec/18/code-proven-to-work/)**.

## Goal

1. Make a POST request to create a new post on the live feed
2. **Programmatically verify** the post exists in the database using the returned ID

A [200 OK response](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) means nothing to stakeholders in the real world. Business users don't care about HTTP status codes. They care whether the data shows up. Your code must prove the post made it to the database, not just trust the API response. Welcome to real world software engineering!

## The Live Feed

Open this URL in your browser to see the live feed:

**<https://live.segunakinyemi.com>**

This page displays messages posted by workshop participants in real-time. Your goal is to make your message appear on this board AND verify it programmatically.

## Workshop Key

The API requires a password called the `WorkshopKey` to authenticate your requests. Without it, your POST and GET requests will be rejected with a 401 error.

The workshop key is stored in [`workshop-config.json`](../workshop-config.json) at the root of the repository. Your starter file (`post.js`) already reads from this config file, so you don't need to copy/paste the key anywhere.

Your code will need to include this value in every request. For POST requests, it goes in the JSON body. For GET requests, it goes as a query parameter in the URL.

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
| `WorkshopKey` | string | The password listed above |

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

> **Important:** Save the `id` from this response. You need it to verify your post exists.

**Error Response (401, Invalid Key):**

```json
{
  "success": false,
  "error": "Invalid or missing WorkshopKey"
}
```

**Error Response (400, Missing Fields):**

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

**Mode 3: List recent posts by tag**

```txt
GET https://live.segunakinyemi.com/api/posts?tag=python&WorkshopKey=your-key
```

**Response:** `{ success: true, count: 5, tag: "python", posts: [...] }`

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

> Read the full API documentation above. The answer to most questions is already here.

## Workshop Workflow

### 1. Plan

Understand the problem before touching code. Think about:

- What does the POST response contain that I need for verification?
- How do I pass the WorkshopKey for GET requests vs POST requests?
- What HTTP status code indicates the post was not found?

Then design your approach:

1. Open `post.js` (starter file is pre-created with constants and a function skeleton)
2. Construct the POST request with JSON payload using `fetch`
3. Parse the response and extract the `id`
4. Construct the GET request with `id` and `WorkshopKey` as query params
5. Check the verification response
6. Print confirmed success or handle failure

### 2. Prove

Direct AI to write your solution in the starter file below. Before running anything, predict what the output will be. Then run the script and verify: your script should only claim success after the GET request confirms the post exists.

### 3. Explain

Walk through your code: how the POST and GET requests work, why verification matters more than trusting a 200 response, and how async/await handles the flow.

## Where to Write Your Code

Your solution goes in **`post.js`** in this folder. Open that file and write your code there. It already reads `BASE_URL` and `WORKSHOP_KEY` from [`workshop-config.json`](../workshop-config.json) and has a `postMessage()` function skeleton to get you started.

Run with:

```
node post.js
```

Your script should print:

```txt
Posted OK: "<message>" (name=<name>, id=<id>)
Verified: post exists in database
```

**The GET verification step is your test.** If your script prints "Verified: post exists in database", you've proven it works.

## Extension Challenges

If you finish early:

1. **Add Tags** — Include the `Tags` field with your school name or something fun
2. **Make it interactive** — Prompt for name and message instead of hardcoding
3. **Add error handling** — Handle network failures, timeouts, and unexpected API responses gracefully
