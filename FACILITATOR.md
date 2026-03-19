# Facilitator Runbook

Step-by-step checklist for getting the workshop up and running before a new session. Follow these in order.

## Before the Workshop

### 1. Rotate the Workshop Key

The key lives in two files and must match what Vercel expects. Run the rotation script from the repo root:

```powershell
.\scripts\rotate-workshop-key.ps1 -NewKey "your-new-key-here"
```

This updates:

- `workshop-config.json` (students read from here)
- `docs/_data/workshop.yml` (Jekyll site references)

### 2. Update the Vercel Environment Variable

The live feed API validates the workshop key server-side. After rotating locally, update Vercel to match:

1. Go to [Vercel](https://vercel.com/) → `workshops-live-feed` → Settings → Environment Variables
2. Set `WORKSHOP_KEY` to the exact same value you used in step 1
3. **Trigger a redeployment.** Vercel does NOT auto-deploy when you change env vars. Go to Deployments → click the three dots on the latest deployment → Redeploy.

If you skip the redeployment, the old key stays active and students get `Invalid or missing WorkshopKey` errors on Questions 4 and 5.

### 3. Push the Key Change

Commit and push so Codespaces pick up the new key:

```powershell
git add workshop-config.json docs/_data/workshop.yml
git commit -m "Rotate workshop key for [date] session"
git push
```

### 4. Test the Live Feed API

Load the `.env` file and run the integration tests from the `workshops-live-feed` repo:

```powershell
cd C:\Repos\workshops-live-feed\tools
.\test_all.ps1
```

The `test_all.ps1` script auto-loads `.env` from the repo root, so you don't need to set environment variables manually. It needs `ADMIN_KEY` in `.env` to run.

If tests fail with auth errors, the key mismatch between `workshop-config.json` and Vercel is the most likely cause.

### 5. Verify a Codespace Works

Open a fresh Codespace from the repo to confirm:

- Devcontainer builds
- Dracula theme loads
- No venv gets auto-created (disabled via `python.createEnvironment.trigger: off`)
- Tool auto-approval is on (no confirmation dialogs for terminal commands or file edits)
- Workshop Agent is available in the Copilot Chat agent picker

### 6. Clean the Airtable (Optional)

If you want a fresh live feed with no posts from the previous session, clear the `Posts` table in Airtable before students start Questions 4 and 5.

## Student Prerequisites

Students need:

- A GitHub account
- GitHub Copilot access (free via [GitHub Education](https://docs.github.com/en/education) or any Copilot subscription)
- That's it. Codespaces handles everything else.

If a student burns through their 300 monthly premium requests (Copilot Pro via Education), they can switch to free unlimited models from the model picker.

## During the Workshop

- Students launch a Codespace from the repo
- They select the **Workshop Agent** in the Copilot Chat panel
- They pick a model (Claude Sonnet 4.5 recommended if available)
- They open `QUESTION-X-START-HERE.md` for whichever question they're working on

## Key Architecture Notes

| Component | Location | Purpose |
|-----------|----------|---------|
| Workshop key (student side) | `workshop-config.json` at repo root | Students' Q4/Q5 code reads the key from here |
| Workshop key (server side) | Vercel env var `WORKSHOP_KEY` | API validates incoming requests against this |
| Workshop key (docs) | `docs/_data/workshop.yml` | Jekyll site references |
| Key rotation script | `scripts/rotate-workshop-key.ps1` | Updates both local files in one command |
| Live feed API | `workshops-live-feed` repo on Vercel | POST/GET/DELETE endpoints at `live.segunakinyemi.com` |
| Live feed .env | `workshops-live-feed/.env` | `ADMIN_KEY`, `AIRTABLE_API_KEY`, `AIRTABLE_BASE_ID`, `WORKSHOP_KEY` |
| API tests | `workshops-live-feed/tools/test_all.ps1` | Auto-loads `.env`, runs Python/JS/PowerShell tests |
| Devcontainer | `.devcontainer/devcontainer.json` | Python, Node, PowerShell, Copilot, Dracula theme, auto-approve tools, no venv |
| Agent instructions | `.github/instructions/*.instructions.md` | Per-question coaching context for the Workshop Agent |
| Workshop Agent | `.github/agents/workshop.agent.md` | Agent definition with teaching workflow |

## Common Issues

| Symptom | Cause | Fix |
|---------|-------|-----|
| `Invalid or missing WorkshopKey` on Q4/Q5 | Key mismatch between `workshop-config.json` and Vercel | Update Vercel env var + redeploy |
| Vercel env var updated but still failing | Vercel didn't redeploy | Manually trigger redeployment in Vercel dashboard |
| `test_all.ps1` says `ADMIN_KEY required` | `.env` not present or missing `ADMIN_KEY` | Confirm `.env` exists at `workshops-live-feed/` root with all four variables |
| Codespace creates a `.venv` | Old devcontainer without `python.createEnvironment.trigger: off` | Rebuild the Codespace after pushing the updated devcontainer |
| Students get tool approval popups | Old devcontainer without `chat.tools.global.autoApprove: true` | Rebuild the Codespace after pushing the updated devcontainer |
| Workshop Agent not available | Student didn't open the repo in a Codespace, or extension didn't load | Reload window, check Copilot extension is installed |
