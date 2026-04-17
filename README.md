# Diving Toolkit — mark-lss.github.io

Jekyll-based static site. GitHub Pages builds and deploys automatically on every push.

---

## How to add a new calculator

Create one file in `calculators/`:

```html
---
layout: calculator
title: "My New Calculator"
subtitle: "What it does in one sentence."
section: "Calculators"
footer_note: "Optional source note"
---

<!-- Your calc-section HTML here, no shell needed -->
<section class="calc-section">
  <h2 class="calc-section-label">Inputs</h2>
  ...
</section>

<script>
// Your calculator logic here
</script>
```

Then add a link to it on `index.html` in the relevant group panel. Push. Done.

---

## How to add a new emergency tool

Same as a calculator but in `emergency/` and `section: "Emergency"`.

---

## How to add a new familiarisation document

Create one file in `familiarisations/`:

```html
---
layout: fam-doc
title: "Document Title"
subtitle: "Short description"
---

<!-- Full sidebar + main content HTML here -->
<nav id="sidebar">
  ...
</nav>
<div id="main">
  ...
</div>
```

Add a link to `familiarisations/index.html`. Push. Done.

---

## How to add a new section index page

Create `my-section/index.html`:

```html
---
layout: section
title: My Section
description: What this section contains.
---

<a class="tool-row" href="/my-section/my-tool.html">
  <div class="tool-row-copy">
    <strong>Tool Name</strong>
    <span>What it does.</span>
  </div>
  <span class="tool-open">→</span>
</a>
```

---

## How to change the nav

Edit `_includes/nav.html`. One file. Every page updates on next push.

---

## How to change site-wide styling

- **Site chrome** (header, nav, footer, calc shell, homepage): `assets/css/site.css`
- **Familiarisation doc shell** (sidebar, topbar, callouts, tables): `assets/css/fam.css`

Change a CSS variable in `:root` — all pages that use that stylesheet update.

---

## Directory structure

```
_config.yml              Site settings
_layouts/
  default.html           Site chrome (header + footer) — used by index + section pages
  calculator.html        Calculator shell — no site header
  section.html           Section index pages (inherits default)
  fam-doc.html           Familiarisation doc shell — sidebar layout
_includes/
  nav.html               Navigation — single source of truth
assets/
  css/
    site.css             Site + calculator styles
    fam.css              Familiarisation doc styles
  js/
    calculator-common.js Shared JS utilities for calculators
  data/
    diving_calculators_master_reference.json
calculators/             Calculator pages
emergency/               Emergency tool pages
familiarisations/        Familiarisation document pages
tools/                   Systems & Tools section
documents/               Documents section
index.html               Homepage
```
