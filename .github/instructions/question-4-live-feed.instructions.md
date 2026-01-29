---
applyTo: "**/question-4-live-feed/**"
---

# Question 4: Post to Live Feed

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
| `WorkshopKey` | string | Password: `cinnamon-rolls-are-the-best-pastry-hands-down` |

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
GET https://live.segunakinyemi.com/api/posts?id=recXXXXXXXXX&WorkshopKey=cinnamon-rolls-are-the-best-pastry-hands-down
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
GET https://live.segunakinyemi.com/api/posts?workshop=AI%20Interview%20Workshop&WorkshopKey=cinnamon-rolls-are-the-best-pastry-hands-down
```

**Mode 3: List recent posts by tag**

```txt
GET https://live.segunakinyemi.com/api/posts?tag=python&WorkshopKey=cinnamon-rolls-are-the-best-pastry-hands-down
```

**Response:** `{ success: true, count: 5, tag: "python", posts: [...] }`

## Complete Code Examples

### Python (requests library)

```python
import requests

BASE_URL = "https://live.segunakinyemi.com"
WORKSHOP_KEY = "cinnamon-rolls-are-the-best-pastry-hands-down"

# Step 1: POST to create the message
post_data = {
    "Name": "Your Name Here",
    "Message": "Hello from Python!",
    "Workshop": "AI Interview Workshop",
    "Tags": "python, workshop",  # optional
    "WorkshopKey": WORKSHOP_KEY
}

response = requests.post(f"{BASE_URL}/api/post", json=post_data)

if response.status_code != 200 or not response.json().get("success"):
    print(f"POST failed: {response.json()}")
    exit(1)

post_id = response.json()["id"]
print(f"Posted OK: \"{post_data['Message']}\" (name={post_data['Name']}, id={post_id})")

# Step 2: GET to verify the post exists
verify_url = f"{BASE_URL}/api/posts?id={post_id}&WorkshopKey={WORKSHOP_KEY}"
verify_response = requests.get(verify_url)

if verify_response.status_code == 200 and verify_response.json().get("success"):
    print("Verified: post exists in database")
else:
    print(f"Verification failed: {verify_response.json()}")
    exit(1)
```

### JavaScript (fetch API)

```javascript
// Works in Node.js 18+ or browser

const BASE_URL = "https://live.segunakinyemi.com";
const WORKSHOP_KEY = "cinnamon-rolls-are-the-best-pastry-hands-down";

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

    // Step 2: GET to verify the post exists
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

### PowerShell (Invoke-RestMethod)

```powershell
$BaseUrl = "https://live.segunakinyemi.com"
$WorkshopKey = "cinnamon-rolls-are-the-best-pastry-hands-down"

# Step 1: POST to create the message
$postData = @{
    Name        = "Your Name Here"
    Message     = "Hello from PowerShell!"
    Workshop    = "AI Interview Workshop"
    Tags        = "powershell, workshop"  # optional
    WorkshopKey = $WorkshopKey
} | ConvertTo-Json

try {
    $postResponse = Invoke-RestMethod -Uri "$BaseUrl/api/post" -Method Post -Body $postData -ContentType "application/json"
    
    if ($postResponse.success) {
        $postId = $postResponse.id
        Write-Host "Posted OK: `"$($postData | ConvertFrom-Json | Select -ExpandProperty Message)`" (name=$($postData | ConvertFrom-Json | Select -ExpandProperty Name), id=$postId)" -ForegroundColor Green
    } else {
        Write-Host "POST failed: $($postResponse.error)" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "POST error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 2: GET to verify the post exists
try {
    $verifyUrl = "$BaseUrl/api/posts?id=$postId&WorkshopKey=$WorkshopKey"
    $verifyResponse = Invoke-RestMethod -Uri $verifyUrl -Method Get
    
    if ($verifyResponse.success) {
        Write-Host "Verified: post exists in database" -ForegroundColor Green
    } else {
        Write-Host "Verification failed: $($verifyResponse.error)" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "Verification error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
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

## Advanced Consideration (Nudge, Not Required)

A good software engineer would think about this: what if the database has a slight propagation delay? In real production systems, writes might not be immediately visible to reads. A robust solution might include a short wait or retry logic before verification. This isn't required for the exercise, but it's the kind of thinking that separates junior from senior engineers.

## Workflow Reminders

- Ask which language the student prefers before showing code
  - **Python** (default), **JavaScript**, or **PowerShell**
- Emphasize that the POST returning 200 is NOT enough. Verification is required.
- Students must capture the `id` and use it to verify
- After success, offer the Tags extra challenge to personalize their post
- This is about proving your code works to stakeholders, not just trusting API responses
- **The GET verification step IS the test.** No additional unit tests needed.
- **Do NOT suggest the tag `ui-submission`** - that tag is reserved for Question 5 form submissions.
- File names: `post.py`, `post.js`, or `post.ps1`
