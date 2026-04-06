# mastodon-client

Public **Mastodon** web client, built with **Cursor** locally and **Cursor Cloud Agents** as the primary implementer. GitHub is the source of truth.

## How this repo is meant to work

| Layer | Role |
|-------|------|
| **[`AGENTS.md`](./AGENTS.md)** | **Project prompt** — goals, stack (Svelte + TypeScript), milestones, Git rules, and cloud-agent workflow. Read this first. |
| **[`.cursor/environment.json`](./.cursor/environment.json)** | Cursor Cloud **environment** — install + dev terminal + port **5173**. |
| **[`.cursor/rules/project.mdc`](./.cursor/rules/project.mdc)** | Tells Cursor to treat `AGENTS.md` as canonical. |
| **GitHub** | Public repo, branches, PRs, review. |

**Local:** Clone, install deps after scaffold, run `npm run dev`. Use the Cursor IDE for editing and review.

**Cloud:** Start an agent from [cursor.com/agents](https://cursor.com/agents) against this repository. The agent should follow **`AGENTS.md`** on every run.

## Quick links

- Repo: [github.com/shahzebqazi/mastodon-client](https://github.com/shahzebqazi/mastodon-client)
- Cloud agents dashboard: [cursor.com/agents](https://cursor.com/agents)
- API key (for scripts / MCP): [cursor.com/settings](https://cursor.com/settings)

## Optional: create a cloud task from the CLI

```bash
export CURSOR_API_KEY="…"
./scripts/create-cloud-agent.sh
```

The script defaults to embedding **`AGENTS.md`** into the task prompt (`INCLUDE_AGENTS_MD=1`). Override the prompt with `PROMPT='…'`.
