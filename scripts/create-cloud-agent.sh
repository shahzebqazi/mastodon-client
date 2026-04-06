#!/usr/bin/env bash
# Create a Cursor Cloud Agent task (https://cursor.com/docs/cloud-agent/api).
# Requires: export CURSOR_API_KEY from https://cursor.com/settings
#
# By default, prepends repository AGENTS.md into the prompt so the cloud agent
# uses it as the project prompt. Set INCLUDE_AGENTS_MD=0 to skip.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

REPO="${REPO:-https://github.com/shahzebqazi/mastodon-client}"
REF="${REF:-main}"
INCLUDE_AGENTS_MD="${INCLUDE_AGENTS_MD:-1}"

BASE_PROMPT="${PROMPT:-You are the Cursor Cloud Agent for this repository. Implement the next milestone from AGENTS.md using a feature branch and PR. Read AGENTS.md first.}"

if [[ "${INCLUDE_AGENTS_MD}" == "1" ]] && [[ -f "${ROOT}/AGENTS.md" ]]; then
  PROMPT="${BASE_PROMPT}

---

## Repository prompt (AGENTS.md)

$(cat "${ROOT}/AGENTS.md")"
else
  PROMPT="${BASE_PROMPT}"
fi

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
