# AdamBot Audit Report

**Date:** March 9, 2026

---

## 1. Active Cron Jobs

AdamBot has **7 cron jobs** configured. Only **1 is currently enabled** -- the rest are all disabled.

| # | Name | Schedule | What It Does | LLM Provider/Model | Enabled? |
|---|------|----------|-------------|---------------------|----------|
| 1 | **ping** | Every minute | Runs a simple "pong!" echo command. No LLM involved, no cost. Basically a heartbeat to confirm the scheduler is alive. | N/A (command, no LLM) | **Yes** |
| 2 | heartbeat | Every 30 minutes | Spins up an AI agent to read `config/HEARTBEAT.md` and complete the self-monitoring tasks described there. | Default (Anthropic / Claude Opus 4.6) | No |
| 3 | daily-check | Every day at 9:00 AM | Spins up an AI agent to check for outdated npm packages in `package.json` and report findings. | Default (Anthropic / Claude Opus 4.6) | No |
| 4 | cleanup-logs | Every Sunday at midnight | Runs `ls -la logs/` to list log files. Does not actually delete anything right now. | N/A (command, no LLM) | No |
| 5 | ping-status | Every 5 minutes | Sends a POST request to `https://example.com/status` with `{ "source": "heartbeat" }`. Currently pointing at a placeholder URL. | N/A (webhook, no LLM) | No |
| 6 | health-check | Every 10 minutes | Sends a GET request to `https://example.com/health`. Currently pointing at a placeholder URL. | N/A (webhook, no LLM) | No |
| 7 | daily-check-openai | Every day at 9:00 AM | Same as "daily-check" above (checks for outdated packages), but configured to use OpenAI's GPT-4o instead of the default. | OpenAI / GPT-4o | No |

**Bottom line:** The only running cron is a simple echo command that confirms the scheduler works. All the meaningful automations (heartbeat, daily checks, log cleanup, external status pings) are turned off. The webhook crons still point at placeholder example.com URLs.

---

## 2. Active Triggers / Webhooks

AdamBot has **7 webhook triggers** configured. **All 7 are disabled.**

| # | Name | Watches URL Path | What It Does When Fired | Enabled? |
|---|------|-----------------|------------------------|----------|
| 1 | on-github-event | `/github/webhook` | Runs a command that echoes "github webhook fired" (logging only). | No |
| 2 | on-webhook-log | `/webhook` | Runs a command that echoes the incoming webhook body (logging only). | No |
| 3 | review-github-event | `/github/webhook` | Spins up an AI agent to review and summarize the GitHub event payload. Uses default LLM. | No |
| 4 | react-to-webhook | `/webhook` | Spins up an AI agent to analyze incoming webhook payloads and decide if action is needed. Uses default LLM. | No |
| 5 | forward-github | `/github/webhook` | Forwards the GitHub event to `https://example.com/hook` via POST. Placeholder URL. | No |
| 6 | forward-webhook | `/webhook` | Forwards the webhook payload to `https://example.com/hook` via POST. Placeholder URL. | No |
| 7 | review-with-openai | `/github/webhook` | Same as "review-github-event" but uses OpenAI GPT-4o instead of the default. | No |

**Bottom line:** No triggers are active. Everything here is still in template/demo state. The forwarding webhooks point at placeholder URLs. None of this is doing any real work.

---

## 3. Active Skills

AdamBot has **5 skills** activated:

| Skill | What It Does |
|-------|-------------|
| **brave-search** | Web search and content extraction via the Brave Search API. Lightweight alternative to browser-based searching. |
| **browser-tools** | Interactive browser automation via Chrome DevTools Protocol. Can navigate web pages, fill forms, take screenshots, and test frontends. |
| **llm-secrets** | Lists available API keys and credentials by name (without exposing values). Lets the agent know what services it can access. |
| **modify-self** | Allows the agent to edit its own code, configuration, personality files, cron jobs, skills, and system files. |
| **webflow** | Reads and writes pages, CMS collections, and items on thestrategicveteran.com via the Webflow API. Can publish changes to the live site. |

---

## 4. Available API Keys

The following credentials are available to AdamBot during jobs:

| Key Name | Service | What It's For |
|----------|---------|---------------|
| **BRAVE_API_KEY** | Brave Search | Web searching and content retrieval |
| **OPENAI_API_KEY** | OpenAI | GPT models (GPT-4o, etc.) and Whisper (audio transcription) |
| **GOOGLE_API_KEY** | Google AI | Gemini models |
| **DEEPSEEK_API_KEY** | DeepSeek | DeepSeek models (low-cost coding/reasoning) |
| **XAI_API_KEY** | xAI | Grok models |
| **PERPLEXITY_API_KEY** | Perplexity | AI-powered search and research |
| **WEBFLOW_API_TOKEN** | Webflow | Website management for thestrategicveteran.com |

**Notable:** AdamBot also has an Anthropic API key (used as the default provider), but it's stored as a protected `AGENT_` secret rather than an `AGENT_LLM_` secret, so it doesn't show up in the LLM-accessible list. This is fine -- it's the system default and doesn't need to be directly referenced.

**LLM providers with active credentials:** Anthropic, OpenAI, Google, DeepSeek, xAI, and Perplexity -- that's **6 LLM providers**.

---

## 5. Current Default LLM

| Setting | Value |
|---------|-------|
| **Default Provider** | Anthropic |
| **Default Model** | Claude Opus 4.6 |

This means every agent job, chat interaction, and cron that doesn't explicitly override the provider will use **Claude Opus 4.6** -- the most capable (and most expensive) model available. Individual crons or triggers can override this by setting `llm_provider` and `llm_model` fields.

---

## 6. Recommendations

### Which Model to Use for What

You have six LLM providers available. Here's how to use them cost-effectively:

| Task Type | Recommended Provider/Model | Why |
|-----------|---------------------------|-----|
| **Chat (talking with Adam via web/Telegram)** | **Anthropic Claude Opus 4.6** (keep current default) | Best overall quality for nuanced conversation, strategic thinking, and co-founder-style interaction. Worth the cost for direct conversations. |
| **Coding / Agent jobs** | **Anthropic Claude Opus 4.6** for complex tasks, **DeepSeek** for routine/simple tasks | Opus is best-in-class for coding. DeepSeek is dramatically cheaper and handles straightforward coding tasks well. |
| **Web research / Search** | **Brave Search API** + **Perplexity** | Brave for quick factual lookups. Perplexity for deeper research questions that need synthesis. Both are far cheaper than burning Opus tokens on search. |
| **Content drafting (LinkedIn posts, show notes, emails)** | **OpenAI GPT-4o** or **Google Gemini** | Good quality writing at lower cost than Opus. Use Opus only for final review or high-stakes content. |
| **Simple/routine cron jobs (package checks, log cleanup)** | **DeepSeek** or **Google Gemini** | These tasks don't need top-tier reasoning. Save money by routing them to cheaper models. |
| **Audio transcription** | **OpenAI Whisper** (via OPENAI_API_KEY) | Industry standard for podcast/audio transcription. You already have the key. |

### Cron Job Changes

- **heartbeat** (every 30 min, currently disabled): If you enable this, switch it to **DeepSeek** or **Google Gemini**. Running Opus every 30 minutes for self-checks would be expensive and unnecessary. A cheaper model handles routine health checks just fine.
- **daily-check** (package updates): Switch to **DeepSeek**. Checking for outdated npm packages is a simple, well-defined task. No need for Opus.
- **daily-check-openai** is a duplicate of daily-check. Pick one and delete the other. If you keep it, DeepSeek is cheaper than GPT-4o for this task too.
- **cleanup-logs**: Currently just runs `ls`. If you want this to actually clean up old logs, update the command and enable it. No LLM needed.
- **ping-status and health-check**: Still pointing at `example.com`. Either configure real URLs or remove them to reduce clutter.

### New Automations Worth Building

Given the tools and APIs available, here are high-value automations to consider:

1. **Post-episode release automation** (cron or trigger)
   - When a new episode drops, auto-generate show notes, YouTube description, and tags from the transcript using a cheaper model (GPT-4o or Gemini)
   - Auto-draft a LinkedIn post for Adam's review
   - Draft a guest notification email

2. **LinkedIn content assistant** (daily cron)
   - Every morning, draft 1-2 LinkedIn post options based on recent podcast themes, trending veteran topics (via Brave/Perplexity search), or content calendar
   - Use GPT-4o for drafting, queue for Adam's review

3. **Website content sync** (weekly cron)
   - Use the Webflow skill to check if the episode archive, blog, or other pages need updates
   - Auto-publish new episode entries to the site

4. **Financial runway tracker** (weekly cron)
   - Simple script that calculates remaining runway based on known income/burn
   - Sends a Telegram notification with current runway countdown

5. **Guest follow-up reminder** (daily cron)
   - Check Airtable for guests whose episodes dropped recently
   - Send Adam a Telegram reminder to follow up (or auto-draft the follow-up email)

6. **Weekly review prompt** (weekly cron, Sunday evening)
   - Compile the week's activity: jobs run, content published, tasks completed
   - Push a structured "weekly review" prompt to Telegram

### Cost Optimization

- **Biggest win: Route routine jobs away from Opus.** Claude Opus 4.6 is your most expensive model. Every agent cron that fires burns Opus tokens plus GitHub Actions minutes. Reserve Opus for chat and complex tasks.
- **Set per-cron overrides.** Any cron with `"type": "agent"` should include `"llm_provider"` and `"llm_model"` fields pointing to a cheaper model unless it genuinely needs Opus-level reasoning.
- **DeepSeek is your budget workhorse.** For coding tasks, file analysis, and structured data processing, DeepSeek performs well at a fraction of the cost.
- **Perplexity for research, not Opus.** When a job needs to search the web and synthesize findings, Perplexity is purpose-built for that and cheaper than feeding search results into Opus.
- **Consolidate duplicate crons.** `daily-check` and `daily-check-openai` do the same thing. Remove the duplicate.
- **Clean up placeholder configs.** The example.com webhook URLs and disabled template triggers add clutter. Remove anything you're not planning to use. It makes the config easier to maintain and audit.

---

## Summary

AdamBot has a solid multi-provider setup with 6 LLM providers and useful skills (web search, browser automation, website management, self-modification). But almost nothing is turned on. The only active cron is a simple heartbeat echo. All triggers are disabled. The system is configured but idle.

The default LLM (Claude Opus 4.6) is the most powerful and most expensive option. That's fine for chat and complex agent work, but routine automations should be routed to cheaper models like DeepSeek or Gemini to keep costs down.

The infrastructure is ready. The next step is deciding which automations to enable first and wiring them up with the right models for the job.
