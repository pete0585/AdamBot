#!/usr/bin/env bash
# Get a single item from a Webflow CMS collection
# Usage: get-collection-item.sh <collection-id> <item-id>
set -euo pipefail

COLLECTION_ID="${1:?Error: collection-id is required as first argument}"
ITEM_ID="${2:?Error: item-id is required as second argument}"
API_BASE="https://api.webflow.com/v2"

if [ -z "${WEBFLOW_API_TOKEN:-}" ]; then
  echo "Error: WEBFLOW_API_TOKEN is not set" >&2
  exit 1
fi

response=$(curl -s -w "\n%{http_code}" \
  -H "Authorization: Bearer $WEBFLOW_API_TOKEN" \
  -H "Accept: application/json" \
  "$API_BASE/collections/$COLLECTION_ID/items/$ITEM_ID" 2>&1) || {
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
