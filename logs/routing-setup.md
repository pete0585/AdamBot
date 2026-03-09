# Config Cleanup & Model Routing Setup

**Date:** 2026-03-09

---

## Backups Created

- `config/CRONS.backup.json` (copy of original CRONS.json)
- `config/TRIGGERS.backup.json` (copy of original TRIGGERS.json)

---

## CRONS.json Changes

### Removed Entries

| Name | Reason |
|------|--------|
| `daily-check-openai` | Duplicate of `daily-check` (same schedule, same job prompt) |
| `ping-status` | Placeholder with example.com URL (`https://example.com/status`) |
| `health-check` | Placeholder with example.com URL (`https://example.com/health`) |

### Updated Entries

**`heartbeat`** — Added model routing:
- Added `"llm_provider": "google"`
- Added `"llm_model": "gemini-2.0-flash"`
- `enabled` remains `false`; all other fields unchanged

**`daily-check`** — Added model routing:
- Added `"llm_provider": "custom"`
- Added `"llm_model": "deepseek-chat"`
- `enabled` remains `false`; all other fields unchanged

### Unchanged Entries

- `ping` — command type, enabled, no changes
- `cleanup-logs` — command type, disabled, no changes

### Before (7 entries)

```json
[
  { "name": "heartbeat", "schedule": "*/30 * * * *", "type": "agent", "enabled": false },
  { "name": "daily-check", "schedule": "0 9 * * *", "type": "agent", "enabled": false },
  { "name": "ping", "schedule": "*/1 * * * *", "type": "command", "enabled": true },
  { "name": "cleanup-logs", "schedule": "0 0 * * 0", "type": "command", "enabled": false },
  { "name": "ping-status", "schedule": "*/5 * * * *", "type": "webhook", "enabled": false },
  { "name": "health-check", "schedule": "*/10 * * * *", "type": "webhook", "enabled": false },
  { "name": "daily-check-openai", "schedule": "0 9 * * *", "type": "agent", "enabled": false }
]
```

### After (4 entries)

```json
[
  { "name": "heartbeat", "schedule": "*/30 * * * *", "type": "agent", "llm_provider": "google", "llm_model": "gemini-2.0-flash", "enabled": false },
  { "name": "daily-check", "schedule": "0 9 * * *", "type": "agent", "llm_provider": "custom", "llm_model": "deepseek-chat", "enabled": false },
  { "name": "ping", "schedule": "*/1 * * * *", "type": "command", "enabled": true },
  { "name": "cleanup-logs", "schedule": "0 0 * * 0", "type": "command", "enabled": false }
]
```

---

## TRIGGERS.json Changes

### Removed Entries (all 7)

| Name | Watch Path | Reason |
|------|-----------|--------|
| `on-github-event` | `/github/webhook` | Disabled placeholder (echo command) |
| `on-webhook-log` | `/webhook` | Disabled placeholder (echo command) |
| `review-github-event` | `/github/webhook` | Disabled placeholder (agent template) |
| `react-to-webhook` | `/webhook` | Disabled placeholder (agent template) |
| `forward-github` | `/github/webhook` | Disabled placeholder (example.com URL) |
| `forward-webhook` | `/webhook` | Disabled placeholder (example.com URL) |
| `review-with-openai` | `/github/webhook` | Disabled placeholder (agent template with openai) |

### Before (7 entries)

All 7 triggers were disabled template/placeholder entries with no real URLs or production logic.

### After

```json
[]
```

Empty array. No active triggers.

---

## What Was NOT Changed

- No crons were enabled
- `JOB_PLANNING.md` was not modified
- `.env` was not modified
- No GitHub variables or secrets were changed
- `ping` and `cleanup-logs` cron entries were left exactly as-is
