# mastodon-client — agent instructions

This file is the **canonical project prompt** for humans and for **Cursor Cloud Agents** working in this repository. Read it at the start of every cloud task or local session before editing code.

## Roles

| Role | Responsibility |
|------|----------------|
| **You (human)** | Product direction, secrets, OAuth app registration on the Mastodon instance, review and merge in Cursor locally or on GitHub. |
| **Cursor IDE (local)** | Interactive editing, debugging, running the dev server, reviewing diffs, guiding the cloud agent via follow-ups. |
| **Cursor Cloud Agent** | Primary implementer: branches, code, tests, and pull requests against this **public** repo. |
| **GitHub** | Source of truth, CI visibility, PR review. **Repository:** `https://github.com/shahzebqazi/mastodon-client` |

## Mission

Build a **web Mastodon client** that can connect to arbitrary Mastodon-compatible instances, authenticate with OAuth where required, and support a useful minimal feature set (timeline reading first, then posting and core interactions). Prefer clarity and maintainability over feature breadth until Milestone 1 ships.

## Technical direction

- **UI:** **Svelte** (Svelte 5) with **TypeScript**.
- **App shape:** **SvelteKit** or **Vite + Svelte** — choose SvelteKit if routing, adapters, or SSR matter early; otherwise Vite SPA is fine for a static-first client.
- **API:** Mastodon **REST** API; follow official Mastodon API docs for the target API version. Use instance `/.well-known` / `nodeinfo` where helpful for discovery.
- **Auth:** OAuth 2 (authorization code) for user login; **never** commit tokens, client secrets, or `.env`. Commit only `.env.example` with placeholder names and short comments.
- **Styling:** Accessible, responsive layout; no mandatory CSS framework—add one only if it speeds delivery without bloat.

## Repository rules

1. Treat **`AGENTS.md`** as the product + engineering contract. If scope or stack must change, **update this file** in the same PR that introduces the change (or a preceding PR).
2. **Default branch:** `main`. Cloud work should use **branches** and **pull requests**; avoid direct pushes to `main` except trivial doc fixes if policy allows.
3. **Secrets:** Only in local/cloud **environment variables** or GitHub **secrets** for CI—not in the tree.
4. **Dependencies:** Prefer pinned lockfiles (`package-lock.json` or `pnpm-lock.yaml`). Keep the dependency set understandable.
5. **Quality:** After scaffold exists, add **lint/format** (ESLint + Prettier or equivalent) and **tests** for non-trivial logic (Vitest). E2E later if valuable.
6. **Commits:** Clear messages; optional note for AI-assisted work (e.g. `Cursor`, task id) when useful.

## Milestones (suggested order)

1. **Scaffold** — Package manager, Svelte + TS app shell, scripts (`dev`, `build`, `check`), `.gitignore`, README pointers. Dev server must run in the **Cursor Cloud** environment (see `.cursor/environment.json`).
2. **Instance + read-only** — User can enter instance base URL, complete OAuth, fetch and show home timeline (or equivalent read path) with basic error states.
3. **Post** — Compose and publish a simple post (text first).
4. **Polish** — Loading/empty/error UX, accessibility pass, README update.

Adjust milestones in this file if product priorities change.

## Cursor Cloud Agent workflow

1. Open or clone **`https://github.com/shahzebqazi/mastodon-client`** in the cloud environment.
2. **Read `AGENTS.md` first** (this file).
3. Run **`install`** steps from `.cursor/environment.json` (or `npm`/`pnpm` install after `package.json` exists).
4. Implement the **next milestone** in a branch; open a **PR** with a short description and test notes.
5. If the human sends a **follow-up** in Cursor Cloud, treat it as the source of truth for that iteration.

## Local development (human)

```bash
git clone https://github.com/shahzebqazi/mastodon-client.git
cd mastodon-client
# after package.json exists:
npm install   # or pnpm install
npm run dev
```

Copy **`.env.example`** to `.env` and fill values for your OAuth app and instance. Keep `.env` out of git (see `.gitignore`).

## Out of scope (unless added here later)

- Native mobile apps (use web responsive design instead).
- Hosting-specific deployment scripts beyond generic static/Node adapter notes.
- Non-Mastodon ActivityPub servers unless explicitly added to this file.
