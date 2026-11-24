# Project: <name> — PHP website (no framework)

## Run locally
- `php -S localhost:8000` from the project root
- Syntax check after edits: `php -l <file>`

## Structure
- `index.php` — homepage; `page.php` — router for inner pages
- `inc/` — shared helpers and config (not web-accessible)
- `content/{lang}/*.php` — page content as PHP arrays, one file per section
- `assets/` — CSS/JS; bump the `?v=` query when you change a file

## Conventions
- Escape all output with `e()`; never echo user input raw
- Texts exist in 3 languages: ru, ua, en — change all three together
- Keep pages fast: no new external scripts without asking

## Don't
- Don't touch `.htaccess` rewrite rules without explaining the change
- Don't store secrets in the repo; config lives outside the web root
