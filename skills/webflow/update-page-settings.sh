#!/usr/bin/env bash
# Update page settings (title, description, SEO metadata)
# Usage: update-page-settings.sh <page-id> <json-file>
# JSON should contain fields like: title, description, seo (object with title, description)
# Requires: pages:write scope
set -euo pipefail

PAGE_ID="${1:?Usage: update-page-settings.sh <page-id> <json-file>}"
JSON_FILE="${2:?Usage: update-page-settings.sh <page-id> <json-file>}"
API_BASE="https://api.webflow.com/v2"

if [ -z "${WEBFLOW_API_TOKEN:-}" ]; then
  echo "Error: WEBFLOW_API_TOKEN is not set" >&2
  exit 1
fi

if [ ! -f "$JSON_FILE" ]; then
  echo "Error: JSON file not found: $JSON_FILE" >&2
  exit 1
fi

response=$(curl -s -w "\n%{http_code}" \
  -X PUT \
  -H "Authorization: Bearer $WEBFLOW_API_TOKEN" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d @"$JSON_FILE" \
  "$API_BASE/pages/$PAGE_ID" 2>&1) || {
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
