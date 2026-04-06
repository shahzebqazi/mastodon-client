# mastodon-client

A web client for [Mastodon](https://joinmastodon.org/) and compatible instances. You connect to an instance, sign in with OAuth, and use your home timeline and other features as they are implemented.

## Requirements

- **Node.js** (LTS recommended) and **npm** (or **pnpm** if the repo ships a `pnpm-lock.yaml`)

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/shahzebqazi/mastodon-client.git
   cd mastodon-client
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Copy the environment template and fill in values for your instance and OAuth app:

   ```bash
   cp .env.example .env
   ```

   Register an application on your Mastodon instance (**Preferences → Development → New application**). Set the redirect URI to match your local app (for example `http://localhost:5173/oauth/callback` if the dev server uses that port).

4. Start the development server:

   ```bash
   npm run dev
   ```

   Open the URL shown in the terminal (by default the app expects port **5173**).

## Environment variables

See **`.env.example`** for the exact names. Typical values:

| Variable | Purpose |
|----------|---------|
| `PUBLIC_MASTODON_ORIGIN` | Instance base URL (no trailing slash), e.g. `https://mastodon.social` |
| `MASTODON_CLIENT_ID` / `MASTODON_CLIENT_SECRET` | From your registered OAuth application |

Never commit **`.env`** or real secrets.

## Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Development server |
| `npm run build` | Production build (when available) |
| `npm run check` | Type-check / Svelte check (when available) |

## Contributing

Issues and pull requests are welcome on [GitHub](https://github.com/shahzebqazi/mastodon-client).
