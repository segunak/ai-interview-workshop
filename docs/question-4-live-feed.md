---
title: "Question 4: Live Feed"
nav_order: 6
---

# Question 4: Live Feed POST

## Why This Problem?

This is a practical API integration problem. It reflects a growing trend in technical interviews: companies are letting candidates use AI tools, but they want to see you solve real-world problems, not just algorithm puzzles. Making API calls, handling authentication, and debugging HTTP requests are everyday engineering tasks.

Companies like Canva and Meta have started allowing AI in interviews because they recognize that AI is part of modern software development. What matters is whether you can actually build things and explain your work.

**Read more about AI-assisted interviews:**

- [Canva: Yes, You Can Use AI in Our Interviews](https://www.canva.dev/blog/engineering/yes-you-can-use-ai-in-our-interviews/)
- [Wired: Meta AI Job Interview Coding](https://www.wired.com/story/meta-ai-job-interview-coding/)

## Goal

Make a POST request to a live API endpoint and see your message appear on a real-time feed that everyone in the workshop can see.

## The Live Feed

Open this URL in your browser to see the live feed:

**[https://live.segunakinyemi.com](https://live.segunakinyemi.com)**

This page displays messages posted by workshop participants in real-time. Your goal is to make your message appear on this board.

## API Endpoint

**URL:** `https://live.segunakinyemi.com/api/post`

**Method:** `POST`

**Content-Type:** `application/json`

**Required Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | Your name or alias |
| `Message` | string | What you want to say |
| `Workshop` | string | Workshop name (e.g., "UNC Charlotte 2026") |
| `WorkshopKey` | string | Secret key (see below) |

**Optional Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags for your post |

## WorkshopKey

<details>
<summary>Click to reveal the WorkshopKey</summary>

The WorkshopKey value is `cinnamon-rolls-are-the-best-pastry-hands-down`

</details>

## Example Request

Here's what a valid request looks like:

```json
{
  "Name": "Ada Lovelace",
  "Message": "First programmer checking in!",
  "Workshop": "UNC Charlotte 2026",
  "WorkshopKey": "your-workshop-key-here"
}
```

## Your Task

1. Write a script or command that sends a POST request to the API
2. Include your name, a message, the workshop name, and the correct WorkshopKey
3. Check the live feed to see your message appear
4. Handle the response (success or error)

## Choose Your Tool

You can solve this using any tool you prefer:

- **Python** - Using `requests` library
- **JavaScript/Node.js** - Using `fetch`
- **PowerShell** - Using `Invoke-RestMethod`

{: .note }
The live feed website has complete code examples for each language.

## Workshop Workflow

### 1. Clarifying Questions

- What format should the response be?
- What happens if I send an invalid WorkshopKey?
- What HTTP status codes should I expect?
- Can I use any HTTP client?

### 2. Plan Your Approach

1. Choose your tool (Python, JavaScript, or PowerShell)
2. Construct the JSON payload
3. Make the POST request
4. Handle the response

### 3. Verify

Check the live feed to confirm your message appeared!

## Deliverables

Create a file in `question-4-live-feed/` with your solution:

- `post.py` - Python solution
- `post.js` - JavaScript solution
- `post.ps1` - PowerShell solution

Your script should print:

```
Posted OK: "<message>" (name=<name>)
Verified: visible on live feed
```

## Expected API Responses

**Success (200):**
```json
{
  "success": true,
  "message": "Posted successfully!",
  "id": "recXXXXXXXXX"
}
```

**Error - Invalid WorkshopKey (401):**
```json
{
  "success": false,
  "error": "Invalid or missing WorkshopKey"
}
```

**Error - Missing required field (400):**
```json
{
  "success": false,
  "error": "Name is required"
}
```

## Extension Challenges

If you finish early:

1. **Add Tags** - Include the `Tags` field with your school name or something fun
2. **Make it interactive** - Prompt for name and message instead of hardcoding
3. **Add error handling** - Handle network errors and non-200 responses gracefully
4. **Try multiple tools** - Solve it in more than one language
