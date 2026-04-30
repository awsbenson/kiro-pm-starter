---
name: feature-design
description: Feature design and prototype workflow. Use when a PM receives a customer feature request and needs to plan, design, and prototype it.
---

# Feature Design Workflow

## The Pipeline

```
Customer ask → Requirements → Design spec → Prototype → Engineering handoff
```

## Step 1: Structure the Ask

Use `/plan` with the customer request. Answer:
- What problem does this solve?
- Who are the users? What's their current workflow?
- What's the business impact? (revenue, retention, competitive)
- What are the constraints? (timeline, tech, resources)
- What's in scope vs out of scope?

## Step 2: Requirements

Output `requirements.md` with:
- User stories: "As a [role], I want [action] so that [benefit]"
- Acceptance criteria for each story
- Business impact analysis
- Priority (P0-P3)
- Dependencies and risks

## Step 3: Design Spec

Output `design.md` with:
- User journey (step-by-step from user's perspective)
- Screen descriptions (what each screen shows, what user can do)
- Data flow (what data moves where)
- Edge cases (errors, empty states, permissions)
- Technical approach (API endpoints, data model)

## Step 4: Prototype

Ask Kiro to generate a working prototype:
- "Create an HTML prototype of this feature based on the design spec"
- Iterate with plain language: "make the button bigger", "add a loading state"
- Screenshot or record for engineering handoff

## Step 5: Engineering Handoff

Output `tasks.md` with:
- Ordered task breakdown
- Each task has: description, acceptance criteria, effort estimate
- Dependencies between tasks
- What the prototype demonstrates vs what needs real implementation

## Quality Check
- [ ] Every user story has acceptance criteria?
- [ ] Prototype matches the requirements?
- [ ] Edge cases documented?
- [ ] Engineering handoff has no ambiguity?
- [ ] Business impact quantified?
