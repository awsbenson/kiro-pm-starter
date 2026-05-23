---
name: feature-design
description: Feature design and prototype workflow. Use when a PM receives a customer feature request, wants to prototype a UI change, or needs to plan a feature. ALWAYS ask the clarifying questions before generating any prototype code.
---

# Feature Design & Prototype Workflow

## IMPORTANT: Ask Before Building

When a PM asks to create a prototype or implement a feature change, DO NOT start coding immediately. First, ask these questions to ensure the prototype is useful:

### Questions to Ask the PM

1. **Who is this for?**
   - Which customer or user role requested this?
   - Will you show this to the customer, to engineering, or both?

2. **What's the current state?**
   - What does the user see/do today?
   - What's the pain point with the current flow?

3. **What should change?**
   - Describe the desired behavior in plain language
   - Any specific UI elements? (button, dropdown, table, dialog, page)

4. **Scope boundaries:**
   - Is this a modification to an existing page or a new page?
   - What should NOT change? (preserve existing behavior)

5. **Visual expectations:**
   - Should it match the existing dark theme?
   - Any specific layout preferences? (sidebar, modal, inline)
   - Reference any existing component as a style guide?

### When to Skip Questions

Skip and start immediately if the PM:
- Already provided detailed context (all 5 areas covered)
- Says "just do it" or "quick change"
- Is iterating on an existing prototype (follow-up prompt)

## After Getting Answers → Build the Prototype

1. Generate a working React component that matches the project's conventions
2. Use the steering file for theme/style guidance
3. Make it interactive (buttons click, forms work, states change)
4. Include realistic sample data
5. Tell the PM: "Open your browser — the change should appear via hot-reload"

## Iteration Loop

After the first version, the PM will iterate:
- "Make the button a dropdown instead"
- "Add a confirmation dialog"
- "Show a count badge"
- "Change the color to match severity levels"

Each iteration: modify the component, browser hot-reloads, PM sees the result.

## When the PM is Satisfied

Ask: "Would you like me to:"
- Show this to your customer? (screenshot / share screen ready)
- Create an engineering handoff? (what to build for real)
- Create a Jira ticket from this? (via MCP)
- Generate a stakeholder presentation about this feature?
