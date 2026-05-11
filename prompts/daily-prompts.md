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

## --- MCP CRUD Operations ---

## Jira: Create Ticket from Spec
```
Create a Jira ticket in project [PROJECT_KEY] from this requirements spec:
- Summary: [one-line feature name]
- Description: use the requirements.md content
- Type: Story
- Priority: [P1/P2/P3]
- Add acceptance criteria as a checklist in the description
```

## Jira: Search & Read
```
Search Jira for open tickets assigned to me in project [PROJECT_KEY].
Show: key, summary, status, priority. Sort by priority.
```

## Jira: Update Status
```
Move ticket [PROJ-123] to "In Progress" and add a comment:
"Starting implementation — targeting completion by [date]."
```

## Jira: Add Sub-tasks from Tasks.md
```
For ticket [PROJ-123], create sub-tasks from the tasks.md file.
Each task becomes a sub-task with:
- Summary from the task title
- Description from the task details
- Estimate from the effort field
```

## Confluence: Create Page from Spec
```
Create a Confluence page in space [SPACE_KEY] titled "[Feature Name] — Design Spec".
Use the content from design.md. Format with proper headings and code blocks.
Add a table of contents at the top.
```

## Confluence: Read & Summarize
```
Get the Confluence page "[page title]" and summarize the key decisions
and action items in bullet points.
```

## Confluence: Update Page
```
Update the Confluence page "[page title]" — add a new section at the bottom:
## Status Update — [today's date]
[PASTE YOUR UPDATE]
```

## Slack: Send Update
```
Send a message to #[channel-name]:
"[Feature Name] update: [your message].
Next steps: [action items]."
```

## Slack: Search Context
```
Search Slack for recent messages about "[topic]" in the last 7 days.
Summarize the key points and any decisions made.
```

## Email: Draft Stakeholder Update
```
Draft an email to [recipient]:
Subject: [Feature Name] — Status Update
Tone: [executive/technical/customer-facing]
Include: current status, next steps, any blockers, timeline.

Context:
[PASTE RELEVANT CONTEXT]
```

## PowerPoint: Generate Stakeholder Deck
```
Generate a PowerPoint presentation for [audience]:
Topic: [feature/project name]
Include:
- Executive summary (3-5 bullets)
- [Bar/Line/Pie] chart showing [data description]
- User flow diagram for [workflow]
- Timeline with [N] phases
- "The Ask" slide

Style: Professional, minimal text, AWS dark blue headers.
Run the script to produce the .pptx file.
```

## PowerPoint: Update Existing Deck
```
Read the presentation at [filename.pptx] and:
- Update slide [N] with new data: [describe changes]
- Add a new slide after slide [N] showing [content]
- Update the timeline to reflect [new dates]
Regenerate the .pptx.
```
