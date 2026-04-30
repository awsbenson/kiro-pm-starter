# Daily PM Prompts — Copy, Paste, Customize

## Escalation Intake
```
/plan Handle this escalation:
[PASTE RAW NOTES, EMAIL, OR SLACK THREAD]
```

## Structure an Escalation
```
Create an escalation spec from these raw notes. Follow the escalation-playbook skill.
Include: confirmed facts, assumptions, unknowns, business impact, investigation plan, closure criteria.

[PASTE NOTES]
```

## 6-Audience Communication
```
From this fact base, create 6 stakeholder-specific updates following the stakeholder-comms skill:
1. Customer executive (CISO)
2. Customer technical (SOC)
3. Engineering brief
4. Product manager brief
5. Sales/account update
6. Internal VP update

Fact base:
[PASTE ESCALATION SPEC OR INCIDENT SUMMARY]
```

## Product Feedback Report
```
Analyze these escalations for patterns. Follow the product-feedback skill.
Identify recurring themes, quantify impact, and recommend action.

Escalations:
[PASTE MULTIPLE ESCALATION SUMMARIES]
```

## Executive Update
```
Write a VP-level executive update for this situation.
Max 10 bullets. Lead with business impact. Include "risk and ask" section.
No jargon.

Situation:
[PASTE CONTEXT]
```

## AMEA Handoff
```
Create a region handoff document for this escalation.
Include: current status, open actions with owners, customer expectations for next 12 hours, escalation path if situation worsens.

Current state:
[PASTE STATUS]
```

## Weekly Status
```
Summarize my open escalations into a weekly status report.
3 bullets per escalation: status, risk, next step.
Sort by severity (P0 first).
```

## Feature Design (Customer Ask → Spec)
```
/plan A customer is requesting this feature:
[PASTE CUSTOMER REQUEST]

Follow the feature-design skill. Produce requirements.md with user stories,
acceptance criteria, and business impact.
```

## Generate Prototype
```
Based on the requirements and design spec above, create a working HTML prototype.
Single file, opens in browser. Include:
- The main user flow (happy path)
- Basic styling (clean, professional)
- Interactive elements (buttons, forms work)
- A loading state and one error state

Make it look like a real product, not a wireframe.
```

## Iterate on Prototype
```
Update the prototype:
- [YOUR FEEDBACK IN PLAIN LANGUAGE]
- e.g., "make the sidebar collapsible"
- e.g., "add a confirmation dialog before delete"
- e.g., "show a success toast after saving"
```

## Engineering Handoff
```
Create an engineering handoff document from the requirements, design spec, and prototype.
Include:
- What the prototype demonstrates vs what needs real implementation
- API endpoints needed (method, path, request/response)
- Data model (entities, relationships)
- Task breakdown with effort estimates
- Open questions for engineering
```

## Project Register Update
```
Update the project register with this initiative:
[DESCRIBE THE PROJECT]

Include: owner, stakeholders, status, dependencies, milestones, risks.
```
