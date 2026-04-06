#!/usr/bin/env bash
# Create a Cursor Cloud Agent task for this repo (https://cursor.com/docs/cloud-agent/api).
# Requires: export CURSOR_API_KEY from https://cursor.com/settings
set -euo pipefail

REPO="${REPO:-https://github.com/shahzebqazi/mastodon-client}"
REF="${REF:-main}"
PROMPT="${PROMPT:-Start a cloud session for mastodon-client. Confirm repository access and suggest a minimal first milestone (stack and scope) for a small Mastodon client.}"

if [[ -z "${CURSOR_API_KEY:-}" ]]; then
  echo "Set CURSOR_API_KEY (from https://cursor.com/settings) and re-run." >&2
  exit 1
fi

AUTH="$(printf '%s' "${CURSOR_API_KEY}:" | base64)"

body="$(jq -n \
  --arg text "$PROMPT" \
  --arg repo "$REPO" \
  --arg ref "$REF" \
  '{prompt:{text:$text}, source:{repository:$repo, ref:$ref}}')"

curl -sS -X POST "https://api.cursor.com/v0/agents" \
  -H "Authorization: Basic ${AUTH}" \
  -H "Content-Type: application/json" \
  -d "$body" | jq .
