# thestrategicveteran.com -- Webflow Site Map

**Generated:** 2026-03-07
**Last Updated:** 2026-03-07
**Platform:** Webflow
**Site ID:** 66878d6a1082f3dca2c24ae6
**Domain:** thestrategicveteran.com
**CDN:** cdn.prod.website-files.com (Webflow CDN)

---

## API Token Status

The current Webflow API token (`$WEBFLOW_API_TOKEN`) is a site-level token (ws-prefix) with **limited scopes**. It currently only has webhook access. The following scopes are **missing** and need to be added in the Webflow dashboard:

| Scope | Required For |
|-------|-------------|
| `sites:read` | site-info.sh |
| `sites:write` | publish-site.sh |
| `pages:read` | list-pages.sh, get-page-dom.sh |
| `pages:write` | update-page-dom.sh, update-page-settings.sh |
| `cms:read` | list-collections.sh, list-collection-items.sh, get-collection-item.sh |
| `cms:write` | create-collection-item.sh, update-collection-item.sh |

To fix: Go to Webflow Dashboard > Site Settings > Apps & Integrations > Edit the API token and add the missing scopes. Or generate a new Site API Token (legacy tokens have all scopes by default for their site).

---

## Known Page IDs (extracted from live site DOM)

| Page | Slug | Page ID |
|------|------|---------|
| Homepage | `/` | `66878d6a1082f3dca2c24aec` |
| About | `/about` | `668933461b3a6c3f7fdfa5be` |
| Podcast | `/podcast` | `66894fb8a153c1d444b31357` |
| Newsletter | `/newsletter` | `66894c1dfc02dab6c272eb7f` |
| Contact | `/contact` | `668957fd0f53689e469c5cfd` |

Full page ID reference: `data/webflow-pages/page-ids.json`

---

## Pending Content Updates

Pre-built content files exist in `data/webflow-pages/` for all pages below. These files are ready to deploy once the API token scopes are updated and new pages are created in the Webflow Designer.

### Content Removals (ALL pages)
- Remove all references to **The Stronghold** community
- Remove all references to **Alset Technologies**
- Remove all references to **CAIO** (Chief AI Officer) title

### Deployment Script
Run `data/webflow-pages/deploy.sh` after updating token scopes and creating new pages.

---

## Pages (8 existing + 8 new = 16 total)

### 1. Homepage (`/`) -- UPDATE PENDING
- **Page ID:** `66878d6a1082f3dca2c24aec`
- **Current Title:** "The Strategic Veteran | Expert Support for Military to Civilian Transition"
- **New Title:** "The Strategic Veteran | UnF*ck Your Transition | 158+ Episodes"
- **Content File:** `data/webflow-pages/homepage.html`
- **SEO File:** `data/webflow-pages/seo/homepage.json`
- **Planned Changes:**
  - Update Adam's title to: "Founder & Host, The Strategic Veteran | Independent AI Consultant | Certified Transformational & Addiction Recovery Coach | Partner, Amakaya Retreat"
  - Add 158+ episode count prominently
  - Add "signal vs. noise" tagline
  - Add "As Seen In" section (Bold Journey, CanvasRebel, Umbrella Local Heroes, Marquis Who's Who)
  - Add testimonials section
  - Update copyright to 2026
  - Remove Stronghold, Alset, CAIO references

### 2. About (`/about`) -- UPDATE PENDING
- **Page ID:** `668933461b3a6c3f7fdfa5be`
- **Current Title:** "The Strategic Veteran - Bridging Military and Civilian Worlds"
- **New Title:** "About The Strategic Veteran | Adam Peters | Military Transition Movement"
- **Content File:** `data/webflow-pages/about.html`
- **SEO File:** `data/webflow-pages/seo/about.json`
- **Planned Changes:**
  - Full bio: Army infantry, 4 deployments Iraq/Afghanistan (2003-2015), medically retired
  - Transformation story: 9 surgeries, weight loss, plant medicine
  - Current roles and certifications
  - Accolades & recognition section
  - Remove Stronghold, Alset, CAIO references

### 3. Podcast (`/podcast`)
- **Title:** "The Strategic Veteran Podcast | Insights for Successful Military Transition"
- **Meta Description:** None set
- **Content:**
  - Hero: "Unlock Your Entrepreneurial Potential" / "Real Stories, Real Strategies, Real Success"
  - Listening platforms: Apple Podcasts, YouTube, Spotify, Podbean
  - Episode grid showing 50+ guests with photos
  - Testimonials section (Jonathan Sessa, Kyle Kushner, Scott DeLuzio, others)
  - CTAs: "Become a Guest" and "Request Adam as a Guest"
- **Notes:** This is a CMS collection list page. Episodes are displayed as a grid of guest photos/names.

### 4. Newsletter (`/newsletter`)
- **Title:** "The Strategic Veteran Newsletter | Stay Informed with The Strategic Veteran"
- **Meta Description:** None set
- **Content:**
  - Headline: "Your Weekly Blueprint For Success"
  - Signup form (name + email)
  - Social proof: "Read by top executives at:" with logos (PGA of America, Diamond Sharp Capital, Walking Warrior, Veteran Roadmap, SHU)
  - Creator profile: Adam Peters

### 5. Contact (`/contact`) -- UPDATE PENDING
- **Page ID:** `668957fd0f53689e469c5cfd`
- **Current Title:** "Contact The Strategic Veteran | Get Support for Your Civilian Transition"
- **New Title:** "Contact The Strategic Veteran | Adam Peters"
- **Content File:** `data/webflow-pages/contact.html`
- **SEO File:** `data/webflow-pages/seo/contact.json`
- **Planned Changes:**
  - Add email: support@thestrategicveteran.com
  - Add TidyCal link: tidycal.com/thestrategicveteran
  - Add social media links (LinkedIn, YouTube, X, Instagram, Facebook)
  - Add quick links to /guest, /speaking, /press, /ai-consulting

### 6. Guest Landing Page (`/guest`)
- **Title:** "Be A Strategic Veteran Podcast Guest"
- **Meta Description:** None set
- **Content:**
  - Heading: "Become a guest on the podcast"
  - Introduction text directing visitors to the guest intake form
- **Notes:** Landing/intro page that leads to the full guest form.

### 7. Guest Intake Form (`/guest-form`)
- **Title:** "Guest Intake Form | The Strategic Veteran Podcast"
- **Meta Description:** None set
- **Content:**
  - Full questionnaire for potential podcast guests
  - Collects background info + headshot upload
- **Notes:** This is the actual form page linked from /guest.

### 8. Search (`/search`)
- **Title:** Webflow native search page
- **Meta Description:** None set
- **Content:** Webflow's built-in site search functionality

### 9. Speaking (`/speaking`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/speaking.html`
- **SEO File:** `data/webflow-pages/seo/speaking.json`
- **Content:** Past events (VETSOCIAL25, U of Chicago/Boeing Summit 2025), speaking topics, booking inquiry

### 10. Coaching (`/coaching`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/coaching.html`
- **SEO File:** `data/webflow-pages/seo/coaching.json`
- **Content:** Veteran transition coaching + psychedelic integration coaching, Being True to You certification, TidyCal booking

### 11. Press & Media (`/press`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/press.html`
- **SEO File:** `data/webflow-pages/seo/press.json`
- **Content:** Magazine features (Bold Journey, CanvasRebel x2, Umbrella Local Heroes), Marquis Who's Who 2025, podcast guest appearances

### 12. Adam Peters (`/adam`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/adam.html`
- **SEO File:** `data/webflow-pages/seo/adam.json`
- **Content:** Full transformation story, military service, certifications, current work

### 13. TSV Studios (`/tsv-studios`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/tsv-studios.html`
- **SEO File:** `data/webflow-pages/seo/tsv-studios.json`
- **Content:** Documentary arm, first project in production (Montana)

### 14. AI Consulting (`/ai-consulting`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/ai-consulting.html`
- **SEO File:** `data/webflow-pages/seo/ai-consulting.json`
- **Content:** Independent AI consulting, "signal vs. noise" value prop, inquiry form

### 15. Partners (`/partners`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/partners.html`
- **SEO File:** `data/webflow-pages/seo/partners.json`
- **Content:** Ramshorn Coffee (code: THESTRATEGICVET), future sponsors placeholder

### 16. Episodes (`/episodes`) -- NEW PAGE (needs creation in Designer)
- **Content File:** `data/webflow-pages/episodes.html`
- **SEO File:** `data/webflow-pages/seo/episodes.json`
- **Content:** Browsable episode archive (CMS collection list), "Start Here" featured episodes, platform links

---

## CMS Collections

### Podcast Episodes Collection

This is the primary (and likely only) CMS collection on the site. Episodes are displayed on the `/podcast` page and each has an individual page at `/podcast/{slug}`.

**Total episodes in sitemap:** 120
**Total episodes reported by podcast platforms:** 158+ (meaning ~38 episodes exist in feeds but not on the website)

#### Collection Fields (observed from episode pages)

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| Name | Plain Text | Yes | Guest name, used as page heading |
| Slug | Auto-generated | Yes | URL path segment. Inconsistent conventions (see below) |
| Portrait | Image | Yes | Guest headshot photo. Alt text template has typo: "{Name}portraitportriat" |
| Release Date | Date | Yes | Formatted "Month DD, YYYY" |
| Episode Description | Rich Text | No | Full episode description with paragraphs. Only populated on ~20% of episodes |
| Chapter Timestamps | Rich Text | No | Formatted timestamp list (e.g., "0:00 - Introduction"). Only on well-populated episodes |
| Resources | Rich Text / Links | No | Guest links, company URLs, social profiles |
| Episode Thumbnail | Image | No | Separate from portrait (e.g., "EP.017.jpg") |

#### Slug Conventions (inconsistent)

The episode slugs follow multiple conventions:

1. **Capitalized names** (47 episodes): `Aaron-Hill`, `Scott-Deluzio`, `Tyler-Goble`
2. **Lowercase names** (62 episodes): `david-befort`, `chad-rarie`, `brian-moss`
3. **Truncated/auto-generated** (11 episodes): `ba`, `c`, `d`, `ja`, `jo`, `l`, `m`, `n`, `pe`, `st`, `t`
4. **Suffixed duplicates**: `Tyler-Schmoker-79609`, `Walt-Morgan-a8549`, `d-82209`, `d-9b552`, `m-3ad36`, `m-65d03`, `m-d120e`, `christopher-maritni-ae6fd`

The truncated slugs (`ba`, `c`, `d`, etc.) appear to be auto-generated when proper slugs weren't provided. These are problematic for SEO and usability.

#### Full Episode List (120 episodes in sitemap)

**Capitalized slug format (47):**
Aaron Hill, Adam Bird, Alex Sosa, Anthony Bourke, Bill Kiefer, Christopher Phillips, Daren Pallatina, Darrell Williams, Dave Albin, David Fivecoat, David Jensen, Deric Keller, Dylan Dail, Edwin Carrion, Evan Poling, George Boyd, George Emmerson Hayworth, Holly Taylor, J Mach, Jack Daly, Jake Ray, Jay Patterson, Jeremy Bourgeois, Jim Fuhs, Juan Alvarado Jr, Kristen Morgan, Laura Kandewen, Lawson Latimer, Mark Gray, Mark Toner, Murray Beaulieu, Paul Mackiewicz, Rachelle Smith, Rich Hardin, Rich Ingram, Rich LaMonica, Ron Jansen, Scott Deluzio, Shawn Welsh, Tom Spooner, Tyler Goble, Tyler Nelson, Tyler Schmoker (x2), Walt Morgan, Wendi Wray, Zack Walker

**Lowercase slug format (62):**
Adrian Massey, Albert Winks, Alex Tessier, Alexis Benjamin, Antony Towndrow, Aren Brandfass, Arnold Beekes, Ben Vernon, Benjamin Parmele, Brandon Jenkins, Brandon Lovingier, Brent Bowers, Brian Fleming, Brian Moss, Chad Rarie, Christopher Maritni, Coach Rob, Damon Darnall, Darlene Greene, Dave Rosenberg, David Befort, David Pere, Douglas Katz, Doyle Glass, Ed Paracut, Eric Donoho, G. Michael Hopf, Georgia Arts, Ian Chamandy, Jackie Frederick, James Artman, John Dailey, John Tansill, Jonathan Sessa, Justin Boyum, Justin Henderson, Lauren Frazier (Part 2), Logan Spiewak, Manuel Martinez, Mark Booher, Mark Messina & Chris Ingram, Markos Eugenios, Matt Payne, Nathan Mechikoff, Otis McGregor, Rhiannon Gonzalez, Rich Mulder, Richard Kauffman, Richard Walsh, Rod Blunk, Ron Nussbaum, Scottie Schneider, Shawn Burnah, Steven Crane, Tim Thomas, Tom Collins, Tony Bozzi

**Truncated slugs (11):**
`ba` (Natalie Schibell?), `c` (Chad Hufford?), `d` (3 entries), `ja`, `jo`, `l`, `m` (4 entries), `n`, `pe`, `st`, `t`

**Episodes on homepage but NOT in sitemap (3):**
David Zallo, Rich Spalla, Rex Enriquez

#### Episode Page Content Quality

Episodes fall into two tiers:

1. **Well-populated (~20%):** Full description, chapter timestamps, resource links, guest bio. Example: David Befort (9 chapters, resource links, full narrative)
2. **Minimal (~80%):** Guest name, headshot, release date only. No description, no chapters, no resources. Example: Scott Deluzio (name, photo, date only)

---

## Site Structure Notes

### Navigation Structure
```
Header Nav: Podcast | Newsletter | Shop | About | Contact
Footer: Social links (YouTube, X, Instagram, Facebook, LinkedIn)
```

### Content Organization Patterns

1. **Single CMS collection:** The site uses one CMS collection (Podcast Episodes) that powers both the `/podcast` grid page and individual `/podcast/{slug}` pages.
2. **No blog:** Despite the audit recommending one, no blog collection or pages exist.
3. **No store:** The "Shop" nav link points to `#` (placeholder).
4. **Static pages only:** Homepage, About, Newsletter, Contact, Guest, Guest Form, and Search are all static Webflow pages (not CMS-powered).
5. **No embedded audio/video:** Episode pages don't embed players. Listeners are directed to Apple Podcasts, YouTube, Spotify, and Podbean externally.
6. **No SEO metadata:** None of the pages have meta descriptions or OG tags set.
7. **Copyright date stale:** Footer says 2024.
8. **Design credit:** "The Brand Chef" credited in footer.

### Collection-to-Page Mapping

| Collection | Page | Relationship |
|-----------|------|-------------|
| Podcast Episodes | `/podcast` | Collection list (grid of all episodes) |
| Podcast Episodes | `/podcast/{slug}` | Collection item template (individual episode page) |

### Image Patterns
- Guest portraits stored on Webflow CDN (`cdn.prod.website-files.com`)
- Episode thumbnails use naming like "EP.017.jpg"
- Portrait alt text template has a typo: `{Name}portraitportriat`

### Missing Functionality
- No audio/video embedding on episode pages
- No episode search or filtering by topic/guest
- No episode count displayed anywhere
- No "as seen in" press section
- No social proof on homepage beyond Marquis Who's Who badge

---

## Recommendations Context

This site belongs to **Adam Peters / The Strategic Veteran** (TSV Studios LLC). A comprehensive website audit exists at `data/website-audit.md` (dated 2026-03-04).

### Pages Addressed by Content Build (2026-03-07)

Content files have been created for all of the following. See `data/webflow-pages/` directory.

| Page | Slug | Status | Content File |
|------|------|--------|-------------|
| Speaking | `/speaking` | Content ready, needs page creation in Designer | `speaking.html` |
| Coaching | `/coaching` | Content ready, needs page creation in Designer | `coaching.html` |
| AI Consulting | `/ai-consulting` | Content ready, needs page creation in Designer | `ai-consulting.html` |
| Press & Media | `/press` | Content ready, needs page creation in Designer | `press.html` |
| Episode Archive | `/episodes` | Content ready, needs page creation in Designer | `episodes.html` |
| Full Bio | `/adam` | Content ready, needs page creation in Designer | `adam.html` |
| TSV Studios | `/tsv-studios` | Content ready, needs page creation in Designer | `tsv-studios.html` |
| Partners | `/partners` | Content ready, needs page creation in Designer | `partners.html` |

### Pages NOT Addressed (Future Work)

| Page | Suggested Slug | Purpose |
|------|---------------|---------|
| Amakaya | `/amakaya` | Partnership with Amakaya Ayahuasca Retreat -- needs Adam's sign-off on messaging |
| Blog | `/blog` | Regular content for SEO -- needs CMS collection setup |
| Store | `/store` | Audiobook, merchandise, digital products |

### Key Data Points

- **Episodes published:** 158+ (per podcast platforms), 120 on website
- **Press features:** Bold Journey (Jul 2024), CanvasRebel x2 (Jul 2024, Dec 2024), Umbrella Local Heroes (Jul 2024)
- **Speaking events:** VETSOCIAL25, University of Chicago/Boeing Summit (Oct 2025), Military CreatorCon Dallas, Tampa events
- **Ventures:** TSV (founder), Amakaya Retreat (partner), Independent AI Consultant
- **Titles:** Founder & Host, Independent AI Consultant, Certified Coach, Partner
- **Social:** LinkedIn (~16K followers), YouTube, X, Instagram, Facebook
- **Booking:** TidyCal at tidycal.com/thestrategicveteran
- **Email:** support@thestrategicveteran.com
- **Sponsors:** Ramshorn Coffee (code: THESTRATEGICVET)
- **Newsletter:** 339 subscribers, "Your Weekly Blueprint For Success"

---

## Technical Notes for AI Agents

### Webflow API Access

The Webflow skill scripts are at `skills/webflow/`. The API token must be updated with the required scopes before most operations work (see API Token Status section above).

Available scripts:
- `skills/webflow/site-info.sh` -- Get site details (requires `sites:read`)
- `skills/webflow/list-pages.sh` -- List all pages (requires `pages:read`)
- `skills/webflow/get-page-dom.sh <page-id>` -- Get page DOM content (requires `pages:read`)
- `skills/webflow/update-page-dom.sh <page-id> <json-file>` -- Update page DOM content (requires `pages:write`)
- `skills/webflow/update-page-settings.sh <page-id> <json-file>` -- Update page title/SEO (requires `pages:write`)
- `skills/webflow/list-collections.sh` -- List CMS collections with field schemas (requires `cms:read`)
- `skills/webflow/list-collection-items.sh <collection-id>` -- List items in a collection (requires `cms:read`)
- `skills/webflow/get-collection-item.sh <collection-id> <item-id>` -- Get single item (requires `cms:read`)
- `skills/webflow/create-collection-item.sh <collection-id> <json-file>` -- Create CMS item (requires `cms:write`)
- `skills/webflow/update-collection-item.sh <collection-id> <item-id> <json-file>` -- Update CMS item (requires `cms:write`)
- `skills/webflow/publish-site.sh` -- Publish site (requires `sites:write`)

### Known Page IDs

Extracted from live site DOM attributes (see `data/webflow-pages/page-ids.json` for full reference):

| Page | Page ID |
|------|---------|
| Homepage (`/`) | `66878d6a1082f3dca2c24aec` |
| About (`/about`) | `668933461b3a6c3f7fdfa5be` |
| Podcast (`/podcast`) | `66894fb8a153c1d444b31357` |
| Newsletter (`/newsletter`) | `66894c1dfc02dab6c272eb7f` |
| Contact (`/contact`) | `668957fd0f53689e469c5cfd` |

### Collection IDs

Collection IDs are not yet known because the API token lacks `cms:read` scope. Once the token is updated, run `skills/webflow/list-collections.sh` to get collection IDs and field schemas.

### Deployment Workflow

1. Update Webflow API token scopes in Webflow Dashboard
2. Create new static pages in Webflow Designer (8 pages)
3. Extract new page IDs and update `data/webflow-pages/page-ids.json`
4. Run `skills/webflow/get-page-dom.sh <page-id>` to learn DOM node structure
5. Map content from HTML files to DOM node update payloads
6. Run `skills/webflow/update-page-dom.sh <page-id> <payload.json>` for each page
7. Run `skills/webflow/update-page-settings.sh <page-id> <seo.json>` for each page
8. Run `skills/webflow/publish-site.sh` to push changes live
9. Alternatively: Copy/paste content from HTML files directly in Webflow Designer

### Key Fixes Still Needed

1. Fix portrait alt text typo: `portraitportriat` -> `portrait`
2. Fix truncated episode slugs (11 episodes with slugs like `ba`, `c`, `d`)
3. Update copyright to 2026
4. Fix Shop nav link (currently `#`)
5. Populate episode descriptions for the ~80% that are empty
6. Update navigation to include new pages
