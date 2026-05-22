# TrendAI Console — Project Context

## Product
TrendAI Vision One security console. Browser-based, React frontend.

## Tech Stack
- React 18+ with Vite
- Functional components with hooks (useState, useEffect)
- CSS variables for theming (dark mode default)
- No external UI library — custom components

## UI Conventions
- Dark theme: background #1a1d23, cards #2a2f38, text #e8eaed
- Accent color: #4fc3f7 (blue)
- Severity colors: high=#ef5350, medium=#ffa726, low=#66bb6a
- Border radius: 4-6px for buttons, 6-8px for cards
- Font: system font stack (-apple-system, BlinkMacSystemFont, 'Segoe UI')
- Font sizes: 12px labels, 13px body, 14px nav, 16-20px headings

## Component Patterns
- One component per file in src/components/
- Props for data, callbacks for actions
- State managed with useState (no Redux needed for prototypes)
- Keep components under 100 lines — split if larger

## When Modifying UI
- Preserve the existing dark theme
- Match severity color coding (high=red, medium=orange, low=green)
- Keep the sidebar + main content layout
- New features go in src/components/ as new files
- Import new components in App.jsx
