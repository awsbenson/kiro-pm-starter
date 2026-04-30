---
name: pm-workflow-lessons
description: MANDATORY — lessons learned from production PM work. Read at the START of every session. Prevents common mistakes.
---

# PM Workflow — Lessons Learned

## Before Every Task
1. **Use `/plan` first** — Think before acting. The planning agent asks the right questions.
2. **Check skills** — Relevant knowledge may already exist. Don't re-explain context.
3. **Check knowledge base** — Previous sessions may have relevant history.

## During Work
4. **Delegate to sub-agents** — Don't do everything in one conversation. Use specialized agents.
5. **Save long sessions** — `/compact` when context fills up. `/chat save` before EOD.
6. **Separate facts from assumptions** — In every output. No exceptions.

## Before Sending Any Output
7. **Quality check** — Does every action item have owner + due date?
8. **Audience check** — Is this written for the right audience?
9. **Completeness check** — Are closure criteria defined and measurable?

## Common Mistakes to Avoid

| Mistake | Prevention |
|---|---|
| Re-explaining team context every session | Put it in steering files — loaded automatically |
| Forgetting customer history | Index customer files in knowledge base |
| Same update sent to all audiences | Use stakeholder-comms skill — 6 versions from 1 fact base |
| Missing action item owners | Hooks catch this automatically |
| Losing work between sessions | `/chat save` before closing. `--resume` to continue. |
| Jumping to drafting without planning | Start with `/plan` — structured thinking first |
| Inconsistent escalation quality | Use escalation-playbook skill — same structure every time |

## Essential Commands
```
/plan [task]              — Structured planning before execution
/compact                  — Free context in long sessions
/chat save [name].json    — Save session
kiro-cli chat --resume    — Resume last session
/knowledge add [name] [path] — Index files for cross-session search
/context                  — Check context usage
```
