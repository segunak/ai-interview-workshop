# Question 4: Post to Live Feed

This folder is for your live feed solution.

## Goal

Write a program or command that submits a post to a live feed website and confirms it appears.

## Live Feed Website

**[https://live.segunakinyemi.com](https://live.segunakinyemi.com)**

Visit the website to see posts appear in real-time.

## API Endpoint

**URL:** `https://live.segunakinyemi.com/api/post`

**Method:** POST with JSON body

**Content-Type:** `application/json`

## Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `Name` | string | Your name |
| `Message` | string | Your message |
| `Workshop` | string | Workshop name (e.g., "UNC Charlotte 2026") |
| `WorkshopKey` | string | Secret key (ask your instructor) |

## Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `Tags` | string | Comma-separated tags (e.g., "python, first-post") |

## Supported Languages

- Python (requests library)
- JavaScript (fetch API)
- PowerShell (Invoke-RestMethod)

## Deliverables

1. Your post appears on the live feed website
2. Your script prints confirmation:

   ```txt
   Posted OK: "<message>" (name=<name>)
   Verified: visible on live feed
   ```

3. At least 2 tests (success case + failure case with wrong WorkshopKey)

## Optional Bonus

- Add `Tags` field to personalize your post
- Add retry logic: up to 3 attempts with a short delay between failures

## AI Rule

> **Plan first. Then code and prove it with tests.**

## Getting Started

Visit the live feed website first. It has code examples for all supported languages.
