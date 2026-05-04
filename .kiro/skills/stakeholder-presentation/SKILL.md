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

**Executive feature pitch:**
```
Create a PowerPoint presentation for my VP about a new bulk alert suppression feature.
Include: executive summary, user flow diagram, cost/benefit chart (saves 2 hours/shift
for 50 SOC analysts at $75/hr), competitive comparison bar chart, and a 3-phase
implementation timeline. Make it executive-ready — minimal text, strong visuals.
```

**Engineering kickoff:**
```
Create a PowerPoint for the engineering kickoff of the detection rule optimizer.
Include: architecture diagram showing the data pipeline, a bar chart of current
vs projected false positive rates, user flow for the rule tuning workflow, and
a task breakdown timeline with 3 sprints.
```

**Customer business review:**
```
Create a PowerPoint for a quarterly business review with Customer Alpha.
Include: a line chart showing incident response time improvement over 4 quarters,
a pie chart of ticket categories, a roadmap of upcoming features relevant to them,
and a summary slide with renewal talking points.
```

## Output Guidelines

- Generate a single Python script that creates the .pptx
- Use clean, professional styling (dark blue headers, white background)
- Charts should have clear labels and a key takeaway callout
- Diagrams should use shapes and connectors, not images
- Keep text minimal — this is for presenting, not reading
- Include speaker notes on every slide
