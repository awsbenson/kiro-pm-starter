# Kiro for Product Managers — Starter Kit

> Turn escalation chaos into structured execution. From day one.

## What This Is

A ready-to-use `.kiro` workspace template that makes Product Managers 10x more effective. Download, open in Kiro, start working.

Built from real production experience managing a multi-CDN platform with 209 probe servers, 22 CDN providers, 18 active TODOs, and 48 skills — all orchestrated through Kiro.

## Quick Start

```bash
git clone https://github.com/awsbenson/kiro-pm-starter.git
cd kiro-pm-starter
kiro-cli chat
```

That's it. Kiro loads your steering rules, skills, and agent configs automatically.

## What's Inside

```
.kiro/
├── steering/
│   ├── pm-operating-rules.md      ← How your team works (customize this)
│   └── communication-standards.md ← Tone, format, audience rules
├── skills/
│   ├── escalation-playbook.md     ← Activates when you mention "escalation"
│   ├── stakeholder-comms.md       ← Activates for communication tasks
│   ├── product-feedback.md        ← Activates for feature gap analysis
│   ├── project-coordination.md    ← Activates for cross-team work
│   └── pm-workflow-lessons.md     ← Mistakes to avoid (loads every session)
├── agents/
│   └── pm-agents.json             ← 4 specialized sub-agents
└── hooks/
    └── quality-gates.md           ← Auto-checks on every output

templates/
├── escalation-spec.md             ← Copy and fill for new escalations
├── stakeholder-update.md          ← 6-audience communication template
├── product-feedback-report.md     ← Pattern analysis across escalations
└── project-register.md            ← Cross-team initiative tracker

prompts/
└── daily-prompts.md               ← Copy-paste prompts for common tasks
```

## Why Kiro, Not Just ChatGPT/Claude

| What You Need | ChatGPT/Claude | Kiro |
|---|---|---|
| Quick answer to a question | ✅ Great | ✅ Also works |
| Remember how your team works | ❌ Re-explain every session | ✅ Steering files — permanent |
| Load relevant knowledge automatically | ❌ Manual copy-paste | ✅ Skills — on-demand by description |
| Enforce quality gates | ❌ Hope you remember | ✅ Hooks — automatic, every time |
| Delegate to specialized agents | ❌ One conversation | ✅ Sub-agents — parallel, specialized |
| Resume work across days | ❌ New session, lost context | ✅ `/chat save` + `--resume` |
| Build institutional memory | ❌ Trapped in chat history | ✅ Knowledge base — searchable across sessions |

**The one-liner**: "I taught Kiro how my team works. Now every session starts with that knowledge, every output follows our rules, and every artifact passes our quality gates."

## Customize for Your Team

1. Edit `.kiro/steering/pm-operating-rules.md` — your severity definitions, closure criteria, stakeholder map
2. Edit `.kiro/skills/escalation-playbook.md` — your escalation workflow
3. Add customer-specific skills to `.kiro/skills/` — one per major account
4. Connect Jira: add Atlassian Rovo MCP server (see setup guide below)

## Essential Commands

```
/plan Handle the P1 escalation from Customer X    ← Think before acting
/compact                                           ← Free up context in long sessions
/chat save escalation-alpha.json                   ← Save session before EOD
kiro-cli chat --resume                             ← Pick up tomorrow
/knowledge add customer-x ./escalations/customer-x ← Index for cross-session search
/context                                           ← Check context usage
```
