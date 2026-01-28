# Question 4: Post to Live Feed

This folder is for your live feed solution.

## Goal

Write a script in PowerShell, Python, or JavaScript that:

1. Submits a post to a live feed API
2. **Programmatically verifies** the post exists in the database using the returned ID

A 200 OK response means nothing to stakeholders. Business users don't care about HTTP status codes. They care whether the data shows up. Your code must prove the post made it to the database, not just trust the API response.

## Live Feed Website

**[https://live.segunakinyemi.com](https://live.segunakinyemi.com)**

Visit the website to see posts appear in real-time.

## API Endpoints

### POST `/api/post`

Creates a new post.

**URL:** `https://live.segunakinyemi.com/api/post`

**Method:** POST

**Content-Type:** `application/json`

**Required Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | Your name |
| `Message` | string | Your message |
| `Workshop` | string | Workshop name (e.g., "UNC Charlotte 2026") |
| `WorkshopKey` | string | Secret key (ask your instructor) |

**Optional Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags (e.g., "python, first-post") |

**Success Response (200):**

```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

Save the `id` from this response. You need it for verification.

**Error Response (401):**

```json
{
  "success": false,
  "error": "Invalid or missing WorkshopKey"
}
```

### GET `/api/posts`

Retrieves posts for verification. Supports two modes.

**Mode 1: Verify a specific post by ID**

```txt
GET https://live.segunakinyemi.com/api/posts?id=recXXXXXXXXX&WorkshopKey=your-key
```

**Success Response (200):**

```json
{
  "success": true,
  "post": {
    "id": "recXXXXXXXXX",
    "name": "Ada Lovelace",
    "message": "First programmer checking in!",
    "workshop": "UNC Charlotte 2026",
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
GET https://live.segunakinyemi.com/api/posts?workshop=UNC%20Charlotte%202026&WorkshopKey=your-key
```

**Success Response (200):**

```json
{
  "success": true,
  "count": 12,
  "workshop": "UNC Charlotte 2026",
  "posts": [
    {
      "id": "recXXXXXXXXX",
      "name": "Ada Lovelace",
      "message": "First programmer checking in!",
      "workshop": "UNC Charlotte 2026",
      "tags": ["python"],
      "createdAt": "2026-02-09T22:30:00.000Z"
    }
  ]
}
```

## Supported Languages

- Python (requests library)
- JavaScript (fetch API)
- PowerShell (Invoke-RestMethod)

## Deliverables

1. POST to create a new post
2. Capture the `id` from the POST response
3. GET to verify the post exists in the database using that `id`
4. Print confirmation only after verification succeeds:

   ```txt
   Posted OK: "<message>" (name=<name>, id=<id>)
   Verified: post exists in database
   ```

5. At least 2 tests (success case + failure case with wrong WorkshopKey)

## Optional Bonus

- Add `Tags` field to personalize your post
- Add retry logic for the verification step in case of propagation delay

## AI Rule

> **Plan first. Then code and prove it with tests.**

## Getting Started

Read this entire README first. The answer to most questions is in the documentation above.
