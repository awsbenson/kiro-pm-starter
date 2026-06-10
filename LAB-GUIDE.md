# Kiro PM Workshop — Lab Guide

## Table of Contents

1. [Copy & Paste in DCV](#-important-copy--paste-in-dcv)
2. [Your Lab Environment](#your-lab-environment)
3. [Lab Overview](#lab-overview)
4. [Troubleshooting](#troubleshooting-environment-setup)
   - DCV Connection
   - Kiro IDE
   - Terminal
   - Dev Server
   - Browser
5. [Setup (9:10–9:20)](#setup-910920)
6. [Module 1: Requirements (9:20–10:20)](#module-1-customer-ask--requirements-920-1020)
7. [Module 2: Steering + Skills (10:35–10:45)](#module-2-steering--skills-1035-1045)
8. [Module 3: Prototype (10:45–12:00)](#module-3-prototype-1045-1200)
9. [Module 3 cont'd: Polish (13:00–14:15)](#module-3-contd-iterate--polish-1300-1415)
10. [Module 4: Capstone (14:30–15:30)](#module-4-capstone--full-pipeline-1430-1530)
11. [Show & Tell (15:30–16:00)](#show--tell-1530-1600)
12. [Quick Reference](#quick-reference)

---

## ⚠️ Important: Copy & Paste in DCV

Your lab runs in a remote desktop (DCV). Copy/paste works differently than normal:

### Pasting text FROM your laptop INTO the remote desktop

1. **Copy** the text on your laptop as usual (Ctrl+C / Cmd+C)
2. **Click inside the DCV window** (the remote desktop)
3. Use **Ctrl+Shift+V** to paste (NOT Ctrl+V)

> 💡 You'll need this immediately to paste your **password** at login.

### Copying text FROM the remote desktop TO your laptop

1. Select text in the remote desktop
2. Use **Ctrl+Shift+C** to copy (NOT Ctrl+C)
3. Switch to your laptop — it's now in your clipboard

### If paste doesn't work

- Try the DCV clipboard panel: click the **clipboard icon** (📋) in the DCV toolbar on the left side
- Paste your text into that panel → it becomes available inside the remote desktop
- Then use Ctrl+V normally inside the remote desktop

### Quick Reference

| Direction | Shortcut |
|---|---|
| Laptop → Remote Desktop | Ctrl+Shift+V |
| Remote Desktop → Laptop | Ctrl+Shift+C |
| Inside remote desktop (normal) | Ctrl+C / Ctrl+V (works as usual) |

---

## Your Lab Environment

| Item | Value |
|---|---|
| **URL** | (provided by trainer in Webex chat) |
| **Username** | (provided by trainer) |
| **Password** | (provided by trainer) |
| **Browser** | Use the DCV link in Chrome/Edge on your computer |

---

## Lab Overview

| Module | Lab | What You Produce | Time |
|---|---|---|---|
| Setup | Connect + Start Dev Server | Running app in browser | 10 min |
| Module 1: Requirements | Customer Ask → Structured Requirements | `requirements.txt` | 45 min |
| Module 2: Steering | Try With vs Without (micro-exercise) | Understanding of skills | 2 min |
| Module 3: Prototype | Build a New Feature Page | Working React page | 75 min |
| Module 3 cont'd: Polish | Iterate to Production Quality | Polished prototype | 75 min |
| Module 4: Capstone | Full Pipeline (new scenario) | Requirements + Prototype + Handoff | 60 min |
| Show & Tell | Share + Engineering Handoff | Handoff summary | 30 min |

---

## Troubleshooting: Environment Setup

### Can't connect to DCV

| Problem | Fix |
|---|---|
| "Connection refused" | Wait 2 min — instance may still be starting |
| Certificate warning | Click "Advanced" → "Proceed" (self-signed cert is expected) |
| Black screen after login | Click anywhere, then press Enter. If stuck, tell trainer. |
| "Session not found" | Refresh the page. DCV auto-creates sessions. |
| Disconnected mid-work | Just reconnect to the same URL — your work is saved |

### Kiro IDE issues

| Problem | Fix |
|---|---|
| First launch is slow (~30s) | **This is normal.** Kiro loads extensions on first start. Wait for it. |
| Kiro won't open | Double-click the desktop icon. If nothing happens, open Terminal and type: `kiro` |
| "Sign in required" | Click "Sign In" → use your AWS Builder ID (create one at https://profile.aws.amazon.com if needed) |
| Sign-in page doesn't open | Open Chromium manually, then retry sign-in in Kiro |
| Chat panel not visible | Press `Ctrl+L` to toggle it |
| Kiro not responding | Check bottom status bar for connection status. Try: close chat tab, reopen with Ctrl+L |
| "No workspace open" | File → Open Folder → select `/home/YOUR-USERNAME/kiro-pm-starter` |

### Terminal issues

| Problem | Fix |
|---|---|
| Terminal not visible | Press `` Ctrl+` `` (backtick) to toggle terminal |
| "command not found: npm" | Type: `source ~/.bashrc` then retry |
| "EACCES permission denied" | Don't use `sudo`. If you see this, tell the trainer. |

### Dev server issues

| Problem | Fix |
|---|---|
| `npm run dev` shows error | Run `cd ~/kiro-pm-starter/sample-console` first, then `npm run dev` |
| "Port 5173 already in use" | Run: `kill $(lsof -t -i:5173)` then `npm run dev` again |
| Browser shows blank page | Make sure URL is `http://localhost:5173` (not https). Hard refresh: Ctrl+Shift+R |
| Changes not showing | Check terminal — is Vite still running? If crashed, run `npm run dev` again |
| "Module not found" error | Run `npm install` then `npm run dev` |

### Browser (Chromium) issues

| Problem | Fix |
|---|---|
| Chromium won't open | Click the desktop icon. Or Terminal: `chromium-browser &` |
| Page won't load | Check terminal: is `npm run dev` still running? |
| Old version showing | Hard refresh: Ctrl+Shift+R |

---

## Setup (9:10–9:20)

### Step 1: Connect to your lab

1. Open the DCV URL from Webex chat in your browser
2. Login with your username and password
3. You should see an Ubuntu desktop

### Step 2: Open Kiro IDE

1. Double-click **Kiro** on the desktop
2. ⏱ **First launch takes ~30 seconds** — this is normal, wait for it
3. When Kiro opens, click **Sign In**
4. A browser tab opens → sign in with your AWS Builder ID
5. Come back to Kiro — it should show the welcome screen
6. If the project isn't open: File → Open Folder → `/home/YOUR-USERNAME/kiro-pm-starter`

### Step 3: Start the dev server

1. Open Terminal: press `` Ctrl+` ``
2. Type:
   ```
   cd kiro-pm-starter/sample-console
   npm run dev
   ```
3. You should see: `VITE v5.x.x ready in XXX ms`

### Step 4: Open the browser

1. Double-click **Chromium** on the desktop
2. Go to: `http://localhost:5173`
3. You should see a **dark-themed security console**

### ✅ Checkpoint

- [ ] Kiro IDE open with `kiro-pm-starter` project
- [ ] Terminal running `npm run dev` (no errors)
- [ ] Browser showing dark security console at localhost:5173
- [ ] Chat panel visible (Ctrl+L)

**If all 4 are checked: 👍 in Webex chat. If stuck: share your screen.**

---

## Module 1: Customer Ask → Requirements (9:20–10:20)

### What you'll do
Take a messy customer request and turn it into structured requirements.

### Step 1: Open a scenario

In your project, open `scenarios/` folder and pick one. Or use this:

> "Hi team, we keep getting complaints from SOC analysts that when they bulk-select alerts to suppress, there's no way to set an expiry date. They end up suppressing things permanently and then forget about them. Can we add an expiry option to the bulk suppress flow? Several large customers have asked about this."

### Step 2: Ask Kiro

Open Kiro chat (Ctrl+L) and type:

```
I have a new feature request from a customer. Here's what they said:

[paste the scenario above]
```

### Step 3: Answer Kiro's questions

Kiro will ask you clarifying questions (because of the feature-design skill). Answer them naturally — pretend you're the PM who owns this feature.

### Step 4: Review the output

Kiro generates a structured requirements document. Check that it has:
- User stories with acceptance criteria
- Scope (in/out)
- Priority
- Business impact

### Step 5: Save it

Tell Kiro:
```
Save these requirements to a file called requirements.txt
```

### ✅ Checkpoint

- [ ] `requirements.txt` exists in your project
- [ ] It has user stories, scope, and priority
- [ ] You could send this to an engineer right now

### 💡 Tips
- Don't worry about being "right" — there are no wrong answers
- If Kiro's output isn't great, tell it: "That's not quite right. The priority should be higher because..."
- Kiro improves when you give feedback

---

## Module 2: Steering + Skills (10:35–10:45)

### What you'll do
Understand WHY Kiro asked smart questions (trainer-led, just follow along).

### Try it yourself (2 min)

In Kiro chat, type:
```
Add a button to the page.
```
→ Notice: Kiro just does it. No questions.

Now type:
```
I want to add a new feature for our users.
```
→ Notice: Kiro asks questions first.

**Same AI. Same workspace. The skill activated on the second prompt.**

---

## Module 3: Prototype (10:45–12:00)

### What you'll do
Turn your requirements into a working React page in the existing console.

### Step 1: Tell Kiro to build it

```
Based on the requirements in requirements.txt, create a new page in the 
sample-console for this feature. Add it to the sidebar navigation. 
Use the existing dark theme and component styles.
```

### Step 2: Check the browser

- Switch to Chromium
- The page should appear in the sidebar (may need to click the new nav item)
- If the browser didn't refresh: Ctrl+Shift+R

### Step 3: Iterate

Try these prompts (one at a time — check browser after each):

```
Add a table showing the suppression rules with columns: rule name, alert pattern, expiry date, status
```

```
Add 5 rows of realistic sample data
```

```
Add a "Create Rule" button that opens a form dialog
```

```
Add a severity filter dropdown above the table
```

### Step 4: Keep going!

More ideas to try:
- "Add a loading spinner that shows for 1 second before data appears"
- "Add an empty state that shows when there are no rules"
- "Make the table rows clickable — show details in a side panel"
- "Add color-coded severity badges like the alerts page"

### ✅ Checkpoint (before lunch)

- [ ] New page visible in the sidebar
- [ ] Table with data showing
- [ ] At least one interaction working (filter, click, or dialog)

### 💡 Tips
- Each prompt should be ONE change. Don't ask for 5 things at once.
- If something looks wrong: "That's not right. The table should have a dark background."
- If Kiro breaks something: "Undo that last change" or Ctrl+Z in the file
- Keep the terminal visible — if Vite crashes, run `npm run dev` again

---

## Module 3 cont'd: Iterate + Polish (13:00–14:15)

### Goal
Make your prototype look production-quality. A customer should not be able to tell it's a prototype.

### Checklist — add these:

- [ ] Realistic data (not "test" or "lorem ipsum")
- [ ] Loading state (spinner or skeleton)
- [ ] Empty state ("No rules found — create your first rule")
- [ ] Error state ("Failed to load — click to retry")
- [ ] Hover effects on table rows
- [ ] Proper spacing and alignment
- [ ] Color-coded status badges

### Prompts to try:

```
Replace the sample data with realistic security alert suppression rules — use real-looking rule names, IP patterns, and dates
```

```
Add a loading skeleton that shows for 1.5 seconds before the data appears
```

```
When the table is empty, show a friendly empty state with an icon and "Create your first suppression rule" button
```

### ✅ Checkpoint

- [ ] Would a customer believe this is the real product? If yes, you're done.
- [ ] Screenshot your prototype — you'll show it later.

---

## Module 4: Capstone — Full Pipeline (14:30–15:30)

### What you'll do
New scenario. Full pipeline. 60 minutes. By yourself.

### The Scenario

Open `scenarios/` in your project and read the capstone scenario. Or the trainer will share it.

### Your deliverables:

1. **Requirements** — use the feature-design skill (just like Module 1)
2. **Prototype** — add a new page to the console (just like Module 3)
3. **Handoff summary** — ask Kiro:
   ```
   Summarize what files were changed and what each change does, in language an engineer can understand.
   ```

### ✅ Checkpoint

- [ ] Requirements file saved
- [ ] New page working in browser
- [ ] Handoff summary generated

### 💡 Tips
- Start with requirements. Don't jump to prototype.
- You've done each step before — now chain them together.
- If stuck: "What should I do first?" — Kiro will guide you.

---

## Show & Tell (15:30–16:00)

### Share your screen (2 min each)

1. Show your prototype in the browser
2. Explain: "This feature does X for Y users"
3. Tell us: how many iterations did it take?

---

## Quick Reference

### Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| Ctrl+L | Open/close Kiro chat |
| Ctrl+` | Toggle terminal |
| Ctrl+Shift+R | Hard refresh browser |
| Ctrl+Z | Undo in editor |
| # | Attach context to prompt (files, steering) |

### Useful Prompts

| What you want | Prompt |
|---|---|
| Start a feature | "I have a new feature request: [describe it]" |
| Build UI | "Create a new page for [feature]. Add to sidebar." |
| Add data | "Add 5 rows of realistic sample data" |
| Add interaction | "Make the rows clickable — show details in a side panel" |
| Fix something | "That's not right. [Describe what's wrong]" |
| Undo | "Undo that last change" |
| Check changes | "What files did you change and why?" |
| Save requirements | "Save these requirements to requirements.txt" |

### If Everything Breaks

1. Close the Kiro chat tab (X button)
2. Reopen with Ctrl+L
3. In terminal: `cd ~/kiro-pm-starter/sample-console && npm run dev`
4. Refresh browser: Ctrl+Shift+R
5. If still broken: tell the trainer

---

*End of Lab Guide*
