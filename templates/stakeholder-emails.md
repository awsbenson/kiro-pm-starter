# Stakeholder Email Drafts

> Fill in the fact base once. Kiro drafts emails for each audience. You review and approve before sending.

## Fact Base (fill this in once)

### What happened / What's the feature
[e.g., "Customer Alpha requested bulk alert suppression. SOC analysts spend 2 hrs/shift on manual dismissal."]

### Key numbers
[e.g., "8 analysts, $75/hr, 2 hrs/shift, $2.4M ARR, renewal in 38 days"]

### Current status
[e.g., "Scoping proposal, need engineering estimate by Friday"]

### Decision needed
[e.g., "Approve P1 priority for Q3 roadmap"]

---

## Kiro Prompt (paste after filling in above)

```
Based on the fact base above, draft emails for these audiences.
Follow the communication-standards steering for tone.
Do NOT send anything — just draft for my review.

Draft these 4 emails:

1. REPLY TO CUSTOMER (Sarah, SOC Manager)
   - Acknowledge the pain
   - Confirm we're working on it
   - Ask 2-3 clarifying questions
   - Tone: empathetic, professional, no internal details

2. EXECUTIVE UPDATE (VP / CISO)
   - Business impact (revenue, renewal risk)
   - What we're doing about it
   - Decision or resource ask
   - Tone: 5 bullets max, lead with impact, no jargon

3. ENGINEERING BRIEF (R&D team)
   - What the customer needs (functional requirements)
   - What we know vs what we need to investigate
   - Suggested scope for initial estimate
   - Tone: technical, specific, actionable

4. SALES/ACCOUNT UPDATE (Account team)
   - Renewal risk assessment
   - Customer sentiment
   - Talking points for next customer call
   - What NOT to promise
   - Tone: relationship-aware, honest about timeline

Format each email with:
- To: [recipient]
- Subject: [suggested subject line]
- Body: [the draft]
- [APPROVE] / [EDIT] / [SKIP] ← mark for my review
```

---

## After Kiro Drafts

Review each email:
- **Approve** → send via Slack MCP or copy to your email client
- **Edit** → tell Kiro what to change ("make the customer email warmer", "add the timeline to the VP update")
- **Skip** → don't send this one

## Example: Sending via MCP (if Slack connected)

```
Send the customer reply to #customer-alpha-escalation channel on Slack.
```

```
Create a Jira comment on PROJ-123 with the engineering brief.
```

```
Create a Confluence page titled "Bulk Alert Suppression — Stakeholder Updates" with all 4 drafts.
```
