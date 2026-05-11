---
name: mcp-for-pms
description: MCP (Model Context Protocol) practical guide for Product Managers. Use when connecting Kiro to Jira, Confluence, Slack, email, or other external tools. Covers setup, tool control, and CRUD operations.
---

# MCP for Product Managers

## What Is MCP?

MCP (Model Context Protocol) lets Kiro connect to external tools — Jira, Confluence, Slack, email, and more. Instead of copy-pasting between tools, you tell Kiro what you need and it reads/writes directly.

## How It Works (Simple Version)

```
You (plain language) → Kiro → MCP Server → External Tool (Jira, Slack, etc.)
                                                    ↓
                                              Result back to you
```

- Your credentials are handled securely (Kiro never sees your passwords)
- Each MCP server connects to one service (Jira server, Slack server, etc.)
- You control which tools are available and which auto-approve

## Setup in Kiro IDE

1. Open Settings: `Cmd + Shift + P` → "Kiro: Open workspace MCP config (JSON)"
2. Add your MCP servers (example below)
3. Save → servers connect automatically
4. Check: Kiro panel → MCP servers tab → see green status

### Example: Atlassian (Jira + Confluence)

```json
{
  "mcpServers": {
    "atlassian": {
      "command": "npx",
      "args": ["-y", "@anthropic/atlassian-mcp-server"],
      "env": {
        "ATLASSIAN_SITE_URL": "https://yoursite.atlassian.net",
        "ATLASSIAN_USER_EMAIL": "${ATLASSIAN_EMAIL}",
        "ATLASSIAN_API_TOKEN": "${ATLASSIAN_TOKEN}"
      }
    }
  }
}
```

### Example: Slack

```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@anthropic/slack-mcp-server"],
      "env": {
        "SLACK_BOT_TOKEN": "${SLACK_BOT_TOKEN}"
      }
    }
  }
}
```

## Controlling Which Tools Are Available

### Disable specific tools (keep the rest)

```json
{
  "mcpServers": {
    "atlassian": {
      "command": "npx",
      "args": ["-y", "@anthropic/atlassian-mcp-server"],
      "disabledTools": ["deleteJiraIssue", "deleteConfluencePage"]
    }
  }
}
```

Use this to prevent accidental deletions — PMs can read and create, but not delete.

### Auto-approve trusted tools (skip confirmation)

```json
{
  "mcpServers": {
    "atlassian": {
      "command": "npx",
      "args": ["-y", "@anthropic/atlassian-mcp-server"],
      "autoApprove": ["searchJiraIssues", "getJiraIssue", "getConfluencePage"]
    }
  }
}
```

Read operations auto-approve. Write operations still ask for confirmation.

### Disable an entire server temporarily

```json
{
  "mcpServers": {
    "slack": {
      "disabled": true
    }
  }
}
```

### CLI: Limit tools per custom agent

In CLI, custom agents can whitelist specific tools:

```json
{
  "name": "jira-reader",
  "description": "Read-only Jira agent",
  "tools": ["searchJiraIssues", "getJiraIssue"],
  "allowedTools": ["searchJiraIssues", "getJiraIssue"]
}
```

This agent can ONLY search and read — no create, update, or delete.

## PM Tool Control Strategy

| Action | Recommendation |
|--------|---------------|
| Search / Read | `autoApprove` — safe, no side effects |
| Create / Update | Keep confirmation (default) — review before writing |
| Delete | `disabledTools` — prevent accidental deletion |
| Sensitive (transitions, assignments) | Keep confirmation — verify before changing status |

## CRUD Operations by Tool

### Jira
- **Create**: "Create a Jira ticket for [feature] in project [KEY]"
- **Read**: "Show me open tickets assigned to me in [project]"
- **Update**: "Move [TICKET-123] to In Progress" / "Add a comment to [TICKET-123]"
- **Delete**: "Delete [TICKET-123]" (only if not in `disabledTools`)

### Confluence
- **Create**: "Create a Confluence page titled [X] in space [Y]"
- **Read**: "Get the content of page [title/ID]"
- **Update**: "Update the page [X] with this new section: ..."
- **Delete**: "Delete page [X]" (recommend disabling)

### Slack
- **Create**: "Send a message to #channel: [message]"
- **Read**: "Search Slack for messages about [topic]"

### Email (via MCP server)
- **Create**: "Draft an email to [recipient] about [topic]"
- **Read**: "Search my inbox for emails from [sender]"

### PowerPoint (via python-pptx skill)
- **Create**: "Generate a PowerPoint presentation about [topic]"
- Uses the stakeholder-presentation skill — no MCP needed, runs locally

## Configuration Locations

| Location | Scope | Use Case |
|----------|-------|----------|
| `.kiro/settings/mcp.json` | This workspace only | Project-specific tools |
| `~/.kiro/settings/mcp.json` | All workspaces | Personal tools (your Jira, your Slack) |

Workspace settings override global settings if both exist.

## Security Best Practices

- Never hardcode tokens in the JSON — use `${ENV_VAR}` references
- Set environment variables in your shell profile or `.env` file
- Use `disabledTools` to prevent destructive operations
- Use `autoApprove` only for read-only tools
- Review what each MCP server can do before connecting it
