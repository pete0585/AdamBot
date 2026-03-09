# Provider Connectivity Test

**Date:** 2026-03-09T22:00Z

---

## Test 1: DeepSeek (Custom Provider)

- **Endpoint:** `https://api.deepseek.com/v1/chat/completions`
- **Model:** `deepseek-chat`
- **Auth:** `$CUSTOM_API_KEY`
- **Prompt:** "Say hello in exactly 5 words."
- **Result:** PASS (HTTP 200)
- **Response:** "Hello to you, my friend."
- **Usage:** 12 prompt tokens, 7 completion tokens, 19 total

---

## Test 2: Google Gemini Flash

- **Endpoint:** `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent`
- **Model:** `gemini-2.5-flash`
- **Auth:** `$GOOGLE_API_KEY`
- **Prompt:** "Say hello in exactly 5 words."
- **Result:** PASS (HTTP 200)
- **Response:** "Hello! How are you doing?"
- **Usage:** 8 prompt tokens, 7 candidate tokens, 643 total (includes 628 thinking tokens)

**Note:** The originally requested model `gemini-2.0-flash` returned a 404 ("no longer available to new users"). Tested with `gemini-2.5-flash` instead, which succeeded.

---

## Summary

| Provider | Model | Status |
|----------|-------|--------|
| DeepSeek | deepseek-chat | PASS |
| Google Gemini | gemini-2.5-flash | PASS |

Both providers are connected and responding correctly.
