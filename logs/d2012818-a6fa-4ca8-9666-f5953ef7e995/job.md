# Job: Webflow Site Content Build & Restructure

**Date:** 2026-03-07
**Status:** Partially complete -- content built, deployment blocked by API token scopes

---

## What Was Done

### Content Created (11 pages)

All page content has been built as structured HTML files in `data/webflow-pages/`:

| Page | File | Lines | Status |
|------|------|-------|--------|
| Homepage (`/`) | `homepage.html` | 356 | Ready to deploy |
| About (`/about`) | `about.html` | 206 | Ready to deploy |
| Contact (`/contact`) | `contact.html` | 130 | Ready to deploy |
| Speaking (`/speaking`) | `speaking.html` | 106 | Ready -- needs page creation in Designer |
| Coaching (`/coaching`) | `coaching.html` | 103 | Ready -- needs page creation in Designer |
| Press (`/press`) | `press.html` | 143 | Ready -- needs page creation in Designer |
| Adam (`/adam`) | `adam.html` | 105 | Ready -- needs page creation in Designer |
| TSV Studios (`/tsv-studios`) | `tsv-studios.html` | 47 | Ready -- needs page creation in Designer |
| AI Consulting (`/ai-consulting`) | `ai-consulting.html` | 107 | Ready -- needs page creation in Designer |
| Partners (`/partners`) | `partners.html` | 52 | Ready -- needs page creation in Designer |
| Episodes (`/episodes`) | `episodes.html` | 150 | Ready -- needs page creation in Designer |

### SEO Metadata Created (13 pages)

SEO title and description files for all pages in `data/webflow-pages/seo/`:
- `homepage.json`, `about.json`, `contact.json`, `podcast.json`, `newsletter.json`
- `speaking.json`, `coaching.json`, `press.json`, `adam.json`, `tsv-studios.json`
- `ai-consulting.json`, `partners.json`, `episodes.json`

### Content Removals Verified

All content files have been verified clean of:
- The Stronghold community references -- **CLEAN**
- Alset Technologies references -- **CLEAN**
- CAIO (Chief AI Officer) title references -- **CLEAN**
- Em dashes -- **CLEAN** (all use `--` instead)

### Content Updates Applied

**Homepage:**
- Adam's title updated to: "Founder & Host, The Strategic Veteran | Independent AI Consultant | Certified Transformational & Addiction Recovery Coach | Partner, Amakaya Retreat"
- Episode count: 158+ prominently displayed
- New tagline: "Cutting through the noise to give you the signal"
- Added "As Seen In" section, testimonials, social links, newsletter CTA
- Copyright updated to 2026

**About page:**
- Expanded from 3 sentences to full bio
- Combat service details: Army infantry, 4 deployments Iraq/Afghanistan (2003-2015), medically retired
- Transformation story: 9 surgeries, weight loss, plant medicine
- Current roles and certifications
- Accolades section

**Contact page:**
- Added email: support@thestrategicveteran.com
- Added TidyCal booking link: tidycal.com/thestrategicveteran
- Added social media links (LinkedIn, YouTube, X, Instagram, Facebook)
- Added quick links to /guest, /speaking, /press, /ai-consulting

### New Webflow API Scripts Created

Three new scripts added to `skills/webflow/`:
- `get-page-dom.sh` -- Read page DOM content (requires `pages:read`)
- `update-page-dom.sh` -- Write page DOM content (requires `pages:write`)
- `update-page-settings.sh` -- Update page title/SEO metadata (requires `pages:write`)

### Infrastructure Created

- `data/webflow-pages/page-ids.json` -- Map of all page slugs to Webflow page IDs
- `data/webflow-pages/deploy.sh` -- Deployment automation script
- Updated `skills/webflow/SKILL.md` with new script documentation
- Updated `data/webflow-site-map.md` with new page structure and deployment workflow

### Known Page IDs Extracted

Extracted from live site DOM using browser tools:

| Page | Page ID |
|------|---------|
| Homepage (`/`) | `66878d6a1082f3dca2c24aec` |
| About (`/about`) | `668933461b3a6c3f7fdfa5be` |
| Podcast (`/podcast`) | `66894fb8a153c1d444b31357` |
| Newsletter (`/newsletter`) | `66894c1dfc02dab6c272eb7f` |
| Contact (`/contact`) | `668957fd0f53689e469c5cfd` |

---

## What Could NOT Be Done (and Why)

### API Token Scopes Missing

The Webflow API token (`$WEBFLOW_API_TOKEN`, ws-prefix site token) only has **webhook access**. All other scopes are missing:

| Missing Scope | Blocks |
|--------------|--------|
| `pages:read` | Reading page DOM structure |
| `pages:write` | Writing page content and SEO metadata |
| `sites:read` | Reading site info |
| `sites:write` | Publishing changes |
| `cms:read` | Reading CMS collections and items |
| `cms:write` | Creating/updating CMS items |

### Cannot Create Static Pages via API

The Webflow Data API v2 does **not support creating new static pages**. New pages can only be created through the Webflow Designer UI. This means the 8 new pages must be created manually in the Designer before content can be applied via API.

### Cannot Publish

Publishing requires `sites:write` scope, which is missing from the token.

---

## Next Steps (Manual Actions Required)

### Priority 1: Update API Token Scopes
1. Log into Webflow Dashboard
2. Go to Site Settings > Apps & Integrations
3. Edit the API token and add ALL scopes: `sites:read`, `sites:write`, `pages:read`, `pages:write`, `cms:read`, `cms:write`
4. Or generate a new legacy Site API Token (which has all scopes by default)

### Priority 2: Create New Pages in Webflow Designer
Create these 8 blank pages in the Designer:
1. `/speaking` -- "Book Adam Peters to Speak"
2. `/coaching` -- "Coaching with Adam Peters"
3. `/press` -- "Press & Media"
4. `/adam` -- "Adam Peters"
5. `/tsv-studios` -- "TSV Studios"
6. `/ai-consulting` -- "AI Consulting"
7. `/partners` -- "Our Partners"
8. `/episodes` -- "Episode Archive"

### Priority 3: Apply Content
After completing steps 1-2, either:
- **Option A (API):** Update `page-ids.json` with new page IDs, then run the deployment workflow described in `data/webflow-site-map.md`
- **Option B (Manual):** Copy/paste content from the HTML files directly into the Webflow Designer

### Priority 4: Publish
Run `skills/webflow/publish-site.sh` or publish manually from the Webflow Dashboard.

---

## Files Created/Modified

```
data/webflow-pages/
  homepage.html          # Updated homepage content
  about.html             # Expanded about page
  contact.html           # Updated contact page
  speaking.html          # NEW: Speaking & events page
  coaching.html          # NEW: Coaching page
  press.html             # NEW: Press & media page
  adam.html              # NEW: Full bio page
  tsv-studios.html       # NEW: TSV Studios page
  ai-consulting.html     # NEW: AI consulting page
  partners.html          # NEW: Partners page
  episodes.html          # NEW: Episode archive page
  page-ids.json          # Page slug to ID mapping
  deploy.sh              # Deployment automation
  seo/                   # SEO metadata (13 JSON files)

skills/webflow/
  get-page-dom.sh        # NEW: Read page DOM
  update-page-dom.sh     # NEW: Write page DOM
  update-page-settings.sh # NEW: Update page metadata
  SKILL.md               # Updated with new script docs

data/webflow-site-map.md # Updated with new structure
```
