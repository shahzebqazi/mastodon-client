# mastodon-client

Web client for [Mastodon](https://joinmastodon.org/)-compatible instances: OAuth sign-in, home timeline first, then more features.

## Requirements

- **Node.js** (LTS) and **npm** (or **pnpm** if this repo has `pnpm-lock.yaml`)

## Setup

1. Clone:

   ```bash
   git clone https://github.com/shahzebqazi/mastodon-client.git
   cd mastodon-client
   ```

2. Install:

   ```bash
   npm install
   ```

3. Environment:

   ```bash
   cp .env.example .env
   ```

   On your instance, create an app under **Preferences → Development → New application**. Set the redirect URI to match local dev, e.g. `http://localhost:5173/oauth/callback`.

4. Run:

   ```bash
   npm run dev
   ```

   Use the URL from the terminal (Vite defaults to port **5173**).

## Environment variables

Names and placeholders are in **`.env.example`**.

| Variable | Purpose |
|----------|---------|
| `PUBLIC_MASTODON_ORIGIN` | Instance base URL (no trailing slash), e.g. `https://mastodon.social` |
| `MASTODON_CLIENT_ID` / `MASTODON_CLIENT_SECRET` | OAuth app credentials |

Do not commit **`.env`** or secrets.

## Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Dev server |
| `npm run build` | Production build |
| `npm run check` | Type / Svelte check |

## Contributing

Issues and pull requests: [github.com/shahzebqazi/mastodon-client](https://github.com/shahzebqazi/mastodon-client).
