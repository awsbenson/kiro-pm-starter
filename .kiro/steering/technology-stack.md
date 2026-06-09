# Technology Stack

## Rules
- Always use the tech stack defined below. Do not introduce new frameworks or libraries without asking.
- When generating prototypes, use the sample-console project as the base.
- Do not ask the PM to install anything. All tools are pre-installed.

## Frontend
- React 19 (already installed)
- Vite for dev server (`npm run dev` → localhost:5173)
- CSS: plain CSS or inline styles. No Tailwind, no Sass, no CSS-in-JS.
- State: React useState/useReducer. No Redux, no Zustand.
- Tables: @tanstack/react-table (already installed)
- No additional npm packages unless absolutely necessary.

## Styling
- Dark theme (matches TrendAI Vision One console)
- Colors: use existing CSS variables in App.css
- Font: system font stack (already set)

## Browser
- Chromium (pre-installed, open localhost:5173)

## Development Flow
- Run `npm run dev` in terminal — hot-reload is automatic
- Edit files → browser updates in ~2 seconds
- No build step needed during development

## What NOT to Do
- Do not suggest installing TypeScript, Next.js, or other frameworks
- Do not suggest Docker, databases, or backend services
- Do not create new projects — always modify the existing sample-console
- Do not run `npx create-*` commands
