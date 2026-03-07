---
name: webflow
description: "Interact with thestrategicveteran.com Webflow site via API. Read and write pages, CMS collections, and items. Publish changes."
---

# Webflow Skill

Manage thestrategicveteran.com through the Webflow API v2. All scripts use `$WEBFLOW_API_TOKEN` for authentication and target site ID `66878d6a1082f3dca2c24ae6`.

## Prerequisites

- `WEBFLOW_API_TOKEN` environment variable must be set (available via `llm-secrets` skill)

## Scripts

### site-info.sh

Get site details (name, domain, last published date, etc).

```bash
skills/webflow/site-info.sh
```

### list-pages.sh

List all pages on the site with their IDs, titles, slugs, and SEO metadata.

```bash
skills/webflow/list-pages.sh
```

### list-collections.sh

List all CMS collections with their IDs, names, slugs, and field schemas.

```bash
skills/webflow/list-collections.sh
```

### list-collection-items.sh

List items in a CMS collection. Supports pagination via optional offset and limit args.

```bash
# List first 100 items (default)
skills/webflow/list-collection-items.sh <collection-id>

# Paginate: skip 100, get next 50
skills/webflow/list-collection-items.sh <collection-id> 100 50
```

### get-collection-item.sh

Get a single item from a collection by ID.

```bash
skills/webflow/get-collection-item.sh <collection-id> <item-id>
```

### create-collection-item.sh

Create a new CMS item from a JSON file. The JSON structure depends on the collection's field schema.

```bash
# Create the JSON payload
cat > /tmp/new-item.json << 'EOF'
{
  "fieldData": {
    "name": "My New Item",
    "slug": "my-new-item",
    "some-field": "value"
  }
}
EOF

skills/webflow/create-collection-item.sh <collection-id> /tmp/new-item.json
```

### update-collection-item.sh

Update an existing CMS item. Only include fields you want to change.

```bash
cat > /tmp/update.json << 'EOF'
{
  "fieldData": {
    "name": "Updated Title"
  }
}
EOF

skills/webflow/update-collection-item.sh <collection-id> <item-id> /tmp/update.json
```

### publish-site.sh

Publish all pending changes to the live site. Use after creating or updating CMS items.

```bash
skills/webflow/publish-site.sh
```

## Site Reference

- **Site ID:** `66878d6a1082f3dca2c24ae6`
- **Domain:** thestrategicveteran.com
- **Site map:** See `data/webflow-site-map.md` for full page/collection inventory
