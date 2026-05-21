# Example Hook: Spec Completeness Check

> This is a sample hook. Students create their own in Module 2.
> In Kiro IDE: Kiro panel → Hooks → + → "Ask Kiro to create a hook"

## What This Hook Does

When you save any `.md` file in the workspace, Kiro checks:
- Does it have an **owner** assigned?
- Does it have a **due date**?
- Does it have **acceptance criteria** (if it's a requirements file)?

If anything is missing, Kiro reminds you in the chat.

## How to Create This Hook (IDE)

1. Open Kiro panel → Agent Hooks → click `+`
2. Select "Ask Kiro to create a hook"
3. Type this description:

```
When I save a markdown file, check if it contains:
- An owner (look for "Owner:" or "Assigned to:")
- A due date (look for "Due:" or "Due date:")
- Acceptance criteria (if the file contains "requirements" in the name)

If any are missing, remind me what's missing in the chat.
```

4. Review the generated config → click "Save Hook"

## What the Hook Config Looks Like

```yaml
title: Spec Completeness Check
description: Checks saved markdown files for owner, due date, and acceptance criteria
event: File Save
filePattern: "**/*.md"
action: Ask Kiro
instructions: |
  Check this saved file for completeness:
  1. Does it have an owner? (look for "Owner:", "Assigned to:", or "Assignee:")
  2. Does it have a due date? (look for "Due:", "Due date:", or "Deadline:")
  3. If the filename contains "requirements", does it have acceptance criteria?
  
  If anything is missing, tell the user what's missing and suggest adding it.
  Keep the reminder brief — one line per missing item.
```

## Other Hook Ideas for PMs

| Trigger | What It Does |
|---------|-------------|
| File save (*.md) | Check for owner + due date |
| Prompt submit | Inject today's date into context |
| After spec task | Verify acceptance criteria are testable |
| File save (escalation-*) | Check severity is set |
| Manual trigger | Run a full quality audit on all open specs |
