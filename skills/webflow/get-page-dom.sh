#!/usr/bin/env bash
# Get the DOM content of a static Webflow page
# Usage: get-page-dom.sh <page-id>
# Requires: pages:read scope
set -euo pipefail

PAGE_ID="${1:?Usage: get-page-dom.sh <page-id>}"
API_BASE="https://api.webflow.com/v2"

if [ -z "${WEBFLOW_API_TOKEN:-}" ]; then
  echo "Error: WEBFLOW_API_TOKEN is not set" >&2
  exit 1
fi

response=$(curl -s -w "\n%{http_code}" \
  -H "Authorization: Bearer $WEBFLOW_API_TOKEN" \
  -H "Accept: application/json" \
  "$API_BASE/pages/$PAGE_ID/dom" 2>&1) || {
  echo "Error: API request failed" >&2
  echo "$response" >&2
  exit 1
}

http_code=$(echo "$response" | tail -1)
body=$(echo "$response" | sed '$d')

if [ "$http_code" -ge 400 ]; then
  echo "Error: HTTP $http_code" >&2
  echo "$body" | jq . 2>/dev/null || echo "$body" >&2
  exit 1
fi

echo "$body" | jq .
