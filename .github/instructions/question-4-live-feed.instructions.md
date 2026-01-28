---
applyTo: "**/question-4-live-feed/**"
---

# Question 4: Post to Live Feed

The student is working on an API integration problem: posting to a live feed website using code.

## Problem Summary

Write a program or command that submits a post to the live feed and verifies it appears. The feed is powered by Airtable via a Vercel serverless function.

## Endpoint Details

**API URL:** `https://live.segunakinyemi.com/api/post`

**Live Feed Website:** https://live.segunakinyemi.com

**Method:** POST with JSON body

**Content-Type:** `application/json`

## Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | The student's name (required) |
| `Message` | string | Their message content (required) |
| `Workshop` | string | Workshop name, e.g. "UNC Charlotte 2026" (required) |
| `WorkshopKey` | string | Password: `cinnamon-rolls-are-the-best-pastry-hands-down` |

## Optional Field (Extra Challenge)

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags like school name, date, or fun labels |

After the student has a working solution, ask if they want to add Tags to personalize their post. Suggest ideas like their school name, the current date, or something fun.

## Complete Code Examples

### Python (requests library)

```python
import requests

url = "https://live.segunakinyemi.com/api/post"

data = {
    "Name": "Your Name Here",
    "Message": "Hello from Python!",
    "Workshop": "UNC Charlotte 2026",
    "Tags": "python, workshop",  # optional
    "WorkshopKey": "cinnamon-rolls-are-the-best-pastry-hands-down"
}

response = requests.post(url, json=data)

if response.status_code == 200:
    print("Post submitted successfully!")
    print(response.json())
else:
    print(f"Error: {response.status_code}")
    print(response.json())
```

### JavaScript (fetch API)

```javascript
// Works in Node.js 18+ or browser

const url = "https://live.segunakinyemi.com/api/post";

const data = {
    Name: "Your Name Here",
    Message: "Hello from JavaScript!",
    Workshop: "UNC Charlotte 2026",
    Tags: "javascript, workshop",  // optional
    WorkshopKey: "cinnamon-rolls-are-the-best-pastry-hands-down"
};

fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
})
.then(res => res.json())
.then(result => {
    if (result.success) {
        console.log("Post submitted successfully!");
    } else {
        console.log("Error:", result.error);
    }
})
.catch(err => console.error("Request failed:", err));
```

### PowerShell (Invoke-RestMethod)

```powershell
$url = "https://live.segunakinyemi.com/api/post"

$body = @{
    Name        = "Your Name Here"
    Message     = "Hello from PowerShell!"
    Workshop    = "UNC Charlotte 2026"
    Tags        = "powershell, workshop"  # optional
    WorkshopKey = "cinnamon-rolls-are-the-best-pastry-hands-down"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType "application/json"
    Write-Host "Post submitted successfully!" -ForegroundColor Green
    $response
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
```

## Expected Output

```
Posted OK: "<message>" (name=<name>)
Verified: visible on live feed
```

## API Responses

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

**Error - Missing field (400):**
```json
{
  "success": false,
  "error": "Name is required"
}
```

## How to Verify Success

1. A 200 status code with `"success": true` means it worked
2. The student should open https://live.segunakinyemi.com and look for their post
3. Posts appear within a few seconds (the page auto-refreshes if Live Mode is on)

## Test Cases to Suggest

1. Success: Valid post with Name, Message, Workshop, and WorkshopKey
2. Failure: Missing WorkshopKey (should get 401)
3. Failure: Wrong WorkshopKey value (should get 401)
4. Failure: Missing Name or Message (should get 400)
5. Optional: Add Tags field after basic solution works

## Clarifying Questions to Prompt

- What HTTP method should I use? (POST)
- What format should the request body be in? (JSON, not form data)
- What Content-Type header is needed? (application/json)
- How do I handle errors from the API?
- How can I verify the post was successful?

## Workflow Reminders

- Ask which language the student prefers before showing code
- Use the code examples above directly
- Students should actually verify their post appears on the live feed website
- After success, offer the Tags extra challenge to personalize their post
- This is about API integration and HTTP fundamentals, not algorithm design
