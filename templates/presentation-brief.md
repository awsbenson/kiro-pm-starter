# Stakeholder Presentation Brief

> Fill this in, then paste to Kiro with the prompt at the bottom.

## Presentation Title
[e.g., "Bulk Alert Suppression — Feature Proposal"]

## Audience
[e.g., VP of Engineering, CISO, Product team, Customer QBR]

## Key Message (one sentence)
[e.g., "This feature saves 2 hours per shift for every SOC analyst"]

## Slides Needed

### 1. Executive Summary
- Key point 1: [e.g., "SOC analysts spend 2 hrs/shift dismissing false positives"]
- Key point 2: [e.g., "Bulk suppression reduces this to 10 minutes"]
- Key point 3: [e.g., "Estimated $1.2M annual savings across enterprise customers"]

### 2. Diagram (pick one or more)
- [ ] User flow diagram: [describe the flow]
- [ ] Architecture diagram: [describe the components]
- [ ] Process flow: [describe the steps]

### 3. Chart (pick one or more)
- [ ] Bar chart: [what to compare, e.g., "current vs proposed time per shift"]
- [ ] Line chart: [what trend, e.g., "false positive rate over 6 months"]
- [ ] Pie chart: [what breakdown, e.g., "alert categories by volume"]
- [ ] Cost/benefit: [numbers, e.g., "50 analysts × $75/hr × 2 hrs × 250 days"]

### 4. Timeline / Roadmap
- Phase 1: [what, when]
- Phase 2: [what, when]
- Phase 3: [what, when]

### 5. The Ask
[What do you need from the audience? e.g., "Approve P1 priority for Q3 roadmap"]

---

## Kiro Prompt (copy this after filling in above)

```
Based on the presentation brief above, generate a Python script that creates
a PowerPoint (.pptx) presentation using python-pptx.

Requirements:
- Professional styling (dark blue #232F3E headers, white background, clean fonts)
- Native PowerPoint charts (not images) for all data visualizations
- Flow diagrams using PowerPoint shapes and connectors
- Speaker notes on every slide
- Minimal text on slides — this is for presenting, not reading
- Save as [presentation-title].pptx

After generating the script, run it to create the .pptx file.
```
