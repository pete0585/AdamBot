# thestrategicveteran.com -- Webflow Site Map

**Generated:** 2026-03-07
**Platform:** Webflow
**Site ID:** 66878d6a1082f3dca2c24ae6
**Domain:** thestrategicveteran.com
**CDN:** cdn.prod.website-files.com (Webflow CDN)

---

## API Token Status

The current Webflow API token (`$WEBFLOW_API_TOKEN`) is an OAuth token with **limited scopes**. It currently only has webhook access. The following scopes are **missing** and need to be added in the Webflow dashboard:

| Scope | Required For |
|-------|-------------|
| `sites:read` | site-info.sh |
| `pages:read` | list-pages.sh |
| `cms:read` | list-collections.sh, list-collection-items.sh, get-collection-item.sh |
| `cms:write` | create-collection-item.sh, update-collection-item.sh |
| `sites:write` | publish-site.sh (POST) |

To fix: Go to Webflow Dashboard > Site Settings > Apps & Integrations > Edit the API token and add the missing scopes. Or generate a new Site API Token (legacy tokens have all scopes by default for their site).

---

## Pages (8 total)

### 1. Homepage (`/`)
- **Title:** "The Strategic Veteran | Expert Support for Military to Civilian Transition"
- **Meta Description:** None set
- **Content:**
  - Hero section: "UnF*ck Your Transition!" headline
  - Founder bio: Adam Peters, 13-year military background
  - Podcast section with 3 recent episodes (David Zallo, Rich Spalla, Rex Enriquez)
  - Newsletter signup CTA
  - Marquis Who's Who 2025 badge
  - Footer with social links (YouTube, X, Instagram, Facebook, LinkedIn)
- **Navigation:** Podcast, Newsletter, Shop, About, Contact
- **CTAs:** "Listen Now", "Subscribe for Free", "View All Episodes"
- **Notes:** Shop link is a placeholder (`#`). Copyright says 2024. Design credit to "The Brand Chef."

### 2. About (`/about`)
- **Title:** "The Strategic Veteran - Bridging Military and Civilian Worlds"
- **Meta Description:** None set
- **Content:**
  - Mission statement: "We're here for you. Veterans of all walks of life."
  - Brief founder background (Adam Peters, 13 years of service)
  - Mentions podcast and newsletter as core offerings
- **Notes:** Extremely thin. Only a few sentences. No personal transformation story, no combat details, no current ventures.

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

### 5. Contact (`/contact`)
- **Title:** "Contact The Strategic Veteran | Get Support for Your Civilian Transition"
- **Meta Description:** None set
- **Content:**
  - Heading: "Looking for answers?"
  - Contact form: Name, Email Address, Message
- **Notes:** No phone number, no email address displayed, no booking link, no social media links in body.

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

This site belongs to **Adam Peters / The Strategic Veteran** (TSV Studios LLC). A comprehensive website audit exists at `data/website-audit.md` (dated 2026-03-04) that identified significant gaps between Adam's actual presence and what the website communicates.

### Missing Pages That Need to Be Built

Based on the audit findings, the following pages do not exist and should be created:

| Page | Suggested Slug | Purpose |
|------|---------------|---------|
| Speaking | `/speaking` | Past events, topics, rate card, booking CTA. Adam speaks at VETSOCIAL25, U of Chicago/Boeing summit, Military CreatorCon, etc. |
| Coaching | `/coaching` | One-on-one transition coaching offerings, testimonials, TidyCal booking integration |
| AI Consulting | `/ai-consulting` | Fractional CAIO services, Alset Technologies connection, AI implementation offerings |
| Community (The Stronghold) | `/community` | The Stronghold veteran community description and join flow (now free) |
| Press & Media | `/press` | Magazine features (Bold Journey, CanvasRebel x2, Umbrella Local Heroes), podcast guest appearances, media kit |
| Episode Archive | `/episodes` | Searchable, filterable directory of all 158+ episodes with embedded players |
| Full Bio | `/about/adam` | Adam's complete transformation story: combat deployments, medical retirement, weight loss, plant medicine, founding TSV |
| Amakaya | `/amakaya` | Partnership with Amakaya Ayahuasca Retreat in Peru, Adam's healing journey, resources for veterans |
| Blog | `/blog` | Regular content for SEO, repurposed podcast insights, transition tips, AI articles |
| Store | `/store` | Audiobook, Ramshorn Coffee partnership, merchandise, digital products |

### Key Data Points for Building Missing Pages

- **Episodes published:** 158+ (per podcast platforms), 120 on website
- **Press features:** Bold Journey (Jul 2024), CanvasRebel x2 (Jul 2024, Dec 2024), Umbrella Local Heroes (Jul 2024)
- **Speaking events:** VETSOCIAL25, University of Chicago/Boeing Summit (Oct 2025), Military CreatorCon Dallas, Tampa events
- **Ventures:** TSV (founder), Alset Technologies (CTO), Amakaya Retreat (partner)
- **Titles:** Founder, CAIO, CTO, Veteran Transition Architect
- **Social:** LinkedIn (~16K-23K followers), YouTube, X, Instagram, Facebook
- **Booking:** TidyCal at tidycal.com/thestrategicveteran
- **Email:** support@thestrategicveteran.com
- **Sponsors:** Ramshorn Coffee (code: THESTRATEGICVET), Endure By Faith (partner)
- **Newsletter:** 339 subscribers, "Your Weekly Blueprint For Success"

---

## Technical Notes for AI Agents

### Webflow API Access

The Webflow skill scripts are at `skills/webflow/`. Before using CMS read/write scripts, the API token must be updated with the required scopes (see API Token Status section above).

Available scripts:
- `skills/webflow/site-info.sh` -- Get site details (requires `sites:read`)
- `skills/webflow/list-pages.sh` -- List all pages (requires `pages:read`)
- `skills/webflow/list-collections.sh` -- List CMS collections with field schemas (requires `cms:read`)
- `skills/webflow/list-collection-items.sh <collection-id>` -- List items in a collection (requires `cms:read`)
- `skills/webflow/get-collection-item.sh <collection-id> <item-id>` -- Get single item (requires `cms:read`)
- `skills/webflow/create-collection-item.sh <collection-id> <json-file>` -- Create CMS item (requires `cms:write`)
- `skills/webflow/update-collection-item.sh <collection-id> <item-id> <json-file>` -- Update CMS item (requires `cms:write`)
- `skills/webflow/publish-site.sh` -- Publish site (requires `sites:write`)

### Collection IDs

Collection IDs are not yet known because the API token lacks `cms:read` scope. Once the token is updated, run `skills/webflow/list-collections.sh` to get collection IDs and field schemas. The podcast episodes collection ID will be needed for any CMS operations.

### Page IDs

Page IDs are not yet known because the API token lacks `pages:read` scope. Once the token is updated, run `skills/webflow/list-pages.sh` to get page IDs needed for page-level operations.

### Making Changes

1. Use `list-collections.sh` to get collection ID
2. Use `list-collection-items.sh` to browse existing items
3. Create JSON payload matching the collection's field schema
4. Use `create-collection-item.sh` or `update-collection-item.sh`
5. Use `publish-site.sh` to push changes live

### Key Fixes Needed (Quick Wins)

1. Fix portrait alt text typo: `portraitportriat` -> `portrait`
2. Fix truncated episode slugs (11 episodes with slugs like `ba`, `c`, `d`)
3. Add meta descriptions to all pages
4. Update copyright to 2025/2026
5. Fix Shop nav link (currently `#`)
6. Populate episode descriptions for the ~80% that are empty
