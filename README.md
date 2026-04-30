# Kiro for Product Managers — Starter Kit

> From customer ask to working prototype. No coding required.

## Quick Start

```bash
git clone https://github.com/awsbenson/kiro-pm-starter.git
cd kiro-pm-starter
kiro-cli chat
```

Kiro loads your steering rules, skills, and agent config automatically.

## What's Inside

```
.kiro/
├── steering/
│   ├── pm-operating-rules.md      ← How your team works (customize this)
│   └── communication-standards.md ← Tone, format, audience rules
├── skills/
│   ├── feature-design.md          ← Activates for feature requests and prototypes
│   ├── escalation-playbook.md     ← Activates when you mention "escalation"
│   ├── stakeholder-comms.md       ← Activates for communication tasks
│   ├── product-feedback.md        ← Activates for feature gap analysis
│   ├── project-coordination.md    ← Activates for cross-team work
│   └── pm-workflow-lessons.md     ← Lessons learned (loads every session)
└── agents/
    └── pm-assistant.json          ← PM-focused agent config

templates/
├── prototype-brief.md             ← Fill this in, paste to Kiro → get a working prototype
└── escalation-spec.md             ← Copy and fill for new escalations

prompts/
└── daily-prompts.md               ← Copy-paste prompts for common PM tasks
```

## The PM Workflow

```
1. PM receives a customer ask for a feature
         ↓
2. PM plans the feature  →  /plan [customer request]
         ↓
3. PM drafts the flow    →  Kiro generates user journey + design spec
         ↓
4. PM delivers a prototype  →  fill in templates/prototype-brief.md → Kiro builds it
```

Kiro also connects to Jira, Confluence, GitHub and other tools via MCP —
create tickets and update docs without leaving your workspace.

## Essential Commands

```
/plan [customer request]           ← Structure a feature ask before doing anything
/compact                           ← Free up context in long sessions
/chat save session-name.json       ← Save session before EOD
kiro-cli chat --resume             ← Pick up where you left off
/knowledge add customer-x ./docs   ← Index docs for cross-session search
```

## Customize for Your Team

1. Edit `.kiro/steering/pm-operating-rules.md` — your team's process and standards
2. Edit `.kiro/skills/escalation-playbook.md` — your escalation workflow
3. Add a skill per major customer account in `.kiro/skills/`
4. Connect Jira/Confluence: add the Atlassian MCP server in Kiro settings
