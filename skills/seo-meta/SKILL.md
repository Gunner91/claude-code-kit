---
name: seo-meta
description: Writes SEO titles, meta descriptions, Open Graph tags and JSON-LD for web pages. Use when creating or optimizing pages for Google, Bing or AI search.
argument-hint: "[page file or URL] [target keyword]"
---

Page: $0. Target keyword: $1 (if empty, infer the main search intent from the content).

1. Read the page content and identify: the main topic, the audience, the search intent (informational / commercial / local).
2. Produce:
   - **Title** — 50-60 characters, keyword near the start, brand at the end (`| Brand`).
   - **Meta description** — 140-160 characters, answers "why click", includes the keyword naturally.
   - **H1** suggestion if the current one is weak.
   - **Open Graph**: og:title, og:description, og:type, og:image recommendation.
   - **JSON-LD**: the most fitting schema.org type (Article, Service, Product, FAQPage, LocalBusiness, BreadcrumbList).
   - **Slug** suggestion — short, lowercase, hyphens.
3. Give 3 variants of title + description to A/B test.
4. Apply the chosen variant to the page file if the user agrees. Keep the page language.
