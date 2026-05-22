# Sample Console — TrendAI Vision One (Prototype)

> This is a simplified version of the TrendAI security console for practicing UI modifications with Kiro.

## Setup (3 steps)

```bash
# Step 1: Go into the project
cd sample-console

# Step 2: Install dependencies (one time only)
npm install

# Step 3: Start the dev server
npm run dev
```

Open the URL shown in terminal (usually http://localhost:5173).

You should see a dark-themed security console with an alert dashboard.

## What's Inside

```
src/
├── App.jsx                    ← Main layout (sidebar + content area)
├── App.css                    ← All styles (dark theme)
└── components/
    ├── Sidebar.jsx            ← Navigation sidebar
    └── AlertDashboard.jsx     ← Alert table with filters and bulk actions
```

## Practice: Modify with Kiro

Open this project in Kiro IDE, then try these prompts in vibe chat:

**Easy:**
```
Add a "Bulk Suppress" button next to "Dismiss Selected" that creates a suppression rule
```

**Medium:**
```
Add a dark/light mode toggle in the top bar
```

**Harder:**
```
Create a new "Suppression Rules" page that shows a table of active rules with name, pattern, expiry date, and a delete button. Wire it up to the sidebar navigation.
```

## How This Maps to Real Work

In the real TrendAI console:
- Each feature is an iframe containing a React or Vue app
- PMs can prototype a single feature page like this one
- Show the prototype to customers → get approval
- Show to engineers → "build this into the real console"

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `npm: command not found` | Install Node.js from https://nodejs.org (LTS version) |
| Port 5173 in use | Kill the other process or use `npm run dev -- --port 3000` |
| Changes not showing | Check the terminal for errors. Vite hot-reloads automatically. |
| Kiro not seeing the project | Make sure you opened the `sample-console` folder in Kiro IDE |
