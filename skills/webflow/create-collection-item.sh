#!/usr/bin/env bash
# Create a new CMS item in a Webflow collection
# Usage: create-collection-item.sh <collection-id> <json-file>
set -euo pipefail

COLLECTION_ID="${1:?Error: collection-id is required as first argument}"
JSON_FILE="${2:?Error: json-file path is required as second argument}"
API_BASE="https://api.webflow.com/v2"

if [ -z "${WEBFLOW_API_TOKEN:-}" ]; then
  echo "Error: WEBFLOW_API_TOKEN is not set" >&2
  exit 1
fi

if [ ! -f "$JSON_FILE" ]; then
  echo "Error: File not found: $JSON_FILE" >&2
  exit 1
fi

response=$(curl -s -w "\n%{http_code}" \
  -X POST \
  -H "Authorization: Bearer $WEBFLOW_API_TOKEN" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d @"$JSON_FILE" \
  "$API_BASE/collections/$COLLECTION_ID/items" 2>&1) || {
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
