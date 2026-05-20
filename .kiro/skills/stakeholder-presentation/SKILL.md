---
name: stakeholder-presentation
description: Generate stakeholder presentations with charts, diagrams, and data visualizations in PowerPoint format. Use when a PM needs to present a feature, business case, roadmap, or market analysis to executives, engineering, or customers.
---

# Stakeholder Presentation Generator

## What This Skill Does

Generates a complete PowerPoint (.pptx) presentation from a plain language description.
The output is a Python script that creates the .pptx file using python-pptx.

## Supported Artifacts

### Charts (native PowerPoint charts)
- **Bar charts** — feature comparison, cost breakdown, resource allocation
- **Line charts** — market trends, adoption curves, timeline projections
- **Pie charts** — budget allocation, market share, effort distribution
- **Stacked bar** — multi-dimension comparisons

### Diagrams (PowerPoint shapes + connectors)
- **User flow diagrams** — step-by-step user journey with decision points
- **Architecture diagrams** — system components and connections
- **Timeline/roadmap** — milestones with dates and status

### Slides
- **Title slide** — feature name, presenter, date
- **Executive summary** — 3-5 bullet points, business impact
- **Feature overview** — what it does, who it's for
- **Diagram slides** — flow charts, architecture
- **Data slides** — charts with key takeaways
- **Timeline/roadmap** — phases, milestones, dates
- **Ask slide** — what you need from the audience

## How to Use

1. Describe your presentation need in plain language
2. Kiro generates a Python script using python-pptx
3. Run the script: `python3 generate_presentation.py`
4. Open the resulting .pptx in PowerPoint/Keynote/Google Slides

## Prerequisites

```bash
pip install python-pptx
```

## Example Prompts

**One feature → VP deck:**
```
Create a PowerPoint presentation for my VP about the bulk alert suppression feature.
Include: executive summary, cost/benefit chart (saves 2 hours/shift for 50 analysts
at $75/hr), 3-phase timeline, and "The Ask" slide (approve P1 for Q3).
Tone: executive-ready, no jargon, lead with business impact.
```

**Same feature → Engineering kickoff deck:**
```
Create a PowerPoint for the engineering kickoff of bulk alert suppression.
Include: architecture diagram showing rule engine + API + UI components,
bar chart of current vs projected false positive rates, user flow for the
rule creation workflow, and sprint breakdown (3 sprints, 9 weeks).
Tone: technical, include data model and API endpoints.
```

**Same feature → Customer QBR deck:**
```
Create a PowerPoint for a quarterly business review with Customer Alpha.
Include: feature overview (what's coming), timeline for availability,
what changes for their SOC team, and a line chart showing projected
alert reduction over 3 months post-launch.
Tone: customer-facing, focus on their outcomes, no internal details.
```

**Same feature → Sales battlecard deck:**
```
Create a PowerPoint for the sales team about bulk alert suppression.
Include: competitive comparison (we have it, competitors don't),
customer talking points, demo script outline, and objection handling.
Tone: sales-ready, focus on differentiation and urgency.
```

## Output Guidelines

- Generate a single Python script that creates the .pptx
- Use clean, professional styling (dark blue headers, white background)
- Charts should have clear labels and a key takeaway callout
- Diagrams should use shapes and connectors, not images
- Keep text minimal — this is for presenting, not reading
- Include speaker notes on every slide
