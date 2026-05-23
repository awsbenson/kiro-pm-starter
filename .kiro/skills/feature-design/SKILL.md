---
name: feature-design
description: Feature design, prototyping, fixing, improving, and debugging UI. Use when a PM wants to create a new feature, fix a bug, improve UX, or debug an issue in the frontend. ALWAYS ask clarifying questions before making changes.
---

# Feature Work: Design, Fix, Improve, Debug

## IMPORTANT: Detect Intent → Ask the Right Questions → Then Build

When a PM describes work to do, first determine the intent, then ask the appropriate questions. DO NOT start coding immediately.

---

## Intent: NEW FEATURE
**Signals:** "add", "create", "build", "I want", "customer wants", "new page/button/feature"

### Ask:
1. **Who is this for?** Which customer/user role? Will you show them directly?
2. **What's the current state?** What does the user do today?
3. **What should change?** Describe the desired behavior. Specific UI elements?
4. **Scope:** New page or modification to existing? What should NOT change?
5. **Visual:** Match existing theme? Any layout preferences?

---

## Intent: FIX / BUG
**Signals:** "broken", "not working", "bug", "wrong", "error", "customer reported"

### Ask:
1. **What's expected?** What should happen when the user does X?
2. **What happens instead?** Describe the incorrect behavior.
3. **Where?** Which page/component? Can you point me to the file?
4. **Reproducible?** Always, sometimes, or only in certain conditions?
5. **Urgency:** Is this blocking the customer? Need a quick fix or proper fix?

---

## Intent: IMPROVE / ENHANCE
**Signals:** "better", "faster", "cleaner", "more intuitive", "redesign", "polish", "enhance"

### Ask:
1. **What's the pain?** What's not working well enough today?
2. **For whom?** Is this your opinion, customer feedback, or data-driven?
3. **What does "better" look like?** Faster load? Fewer clicks? Clearer layout?
4. **Constraints:** Keep the same data/API? Or can we change the structure?
5. **Priority:** Quick polish or significant rework?

---

## Intent: DEBUG
**Signals:** "why is this", "not sure why", "help me understand", "something's off", "investigate"

### Ask:
1. **What did you expect?** Describe the correct behavior.
2. **What do you see?** Describe what's actually happening.
3. **Any errors?** Check browser console (F12) or terminal output.
4. **What changed recently?** Did this work before? What was modified?
5. **Can you show me?** Share screen or paste the error message.

---

## When to Skip Questions

Start immediately if the PM:
- Already provided full context (answers are obvious from the prompt)
- Says "just do it" or "quick change" or "same as last time"
- Is iterating on a previous change (follow-up prompt)
- Gives a very specific instruction ("change the button color to red")

---

## After Getting Answers → Do the Work

1. Read the relevant component files (use #file or #codebase if needed)
2. Make the change following project steering (theme, conventions)
3. Keep changes minimal — don't refactor unrelated code
4. Tell the PM: "Done — check your browser (hot-reload should show the change)"

## After the Change

Ask: "Would you like me to:"
- Iterate further? (adjust colors, layout, behavior)
- Show this to your customer? (screenshot-ready)
- Create an engineering handoff? (what to build for real)
- Create a Jira ticket? (via MCP)
- Generate a stakeholder presentation?
