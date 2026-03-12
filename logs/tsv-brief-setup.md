# TSV Brief Automation Setup Log
**Date:** 2026-03-12

## What Was Created

### 1. `config/tsv-brief-prompt.md`
- Full TSV weekly brief prompt with 5 research sections
- Instructions for research, formatting, Telegram delivery, and archiving
- Output format template included

### 2. `config/CRONS.json` - tsv-brief entry added
- Name: `tsv-brief`
- Schedule: `30 7 * * 0` (Sundays at 7:30 AM UTC)
- Provider: `custom` / Model: `deepseek-chat`
- Uses template include: `{{ config/tsv-brief-prompt.md }}`
- Status: enabled

### 3. `data/tsv-briefs/brief-2026-03-12.md`
- First live test brief archived
- Date: March 12, 2026

### 4. `data/tsv-briefs/seen-urls.json`
- 25 URLs from first brief indexed for future deduplication

## Stories Found Per Section

| Section | Stories |
|---------|---------|
| 1. Veteran Transition & Policy | 5 |
| 2. AI & Business Automation | 5 |
| 3. Podcasting & Creator Economy | 5 |
| 4. Plant Medicine & Psychedelic Therapy | 5 |
| 5. Speaking & Events Industry | 5 |
| **Total** | **25** |

## Telegram Delivery Status

**BLOCKED** - Telegram credentials (`TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID`) are not available to the Docker agent.

These secrets exist on the event handler side (in its `.env` file) but are not passed to the Docker agent container. To enable Telegram delivery from agent jobs:

### Fix Required
Add two GitHub repository secrets:
1. `AGENT_LLM_TELEGRAM_BOT_TOKEN` - The Telegram bot token
2. `AGENT_LLM_TELEGRAM_CHAT_ID` - The Telegram chat ID

The `AGENT_LLM_` prefix ensures these are passed to the Docker agent as LLM-accessible environment variables (`TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID` with prefix stripped).

## ALLOWED_PATHS Update

**BLOCKED** - The `gh variable set` command returned HTTP 403 (token lacks `actions:write` permission on repo variables).

### Fix Required
Manually update the GitHub repo variable:
- **Settings > Actions > Variables > ALLOWED_PATHS**
- Set value to: `/logs,/data/tsv-briefs,/config`

This allows auto-merge of PRs that modify files in the tsv-briefs data directory and config directory.

## Summary

The brief automation is fully configured and the first test brief was successfully researched and archived. Two manual steps remain before end-to-end automation works:

1. Add `AGENT_LLM_TELEGRAM_BOT_TOKEN` and `AGENT_LLM_TELEGRAM_CHAT_ID` as GitHub secrets
2. Update `ALLOWED_PATHS` repo variable to include `/data/tsv-briefs,/config`

Once those are set, the weekly cron at Sunday 7:30 AM UTC will produce and deliver the brief automatically.
