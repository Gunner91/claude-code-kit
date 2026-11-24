# Project: <name> — Python API (FastAPI + PostgreSQL)

## Commands
- Setup: `uv sync` (or `pip install -r requirements.txt`)
- Run: `uv run uvicorn app.main:app --reload`
- Tests: `uv run pytest -q` — add or update a test for every behaviour change
- Lint/format: `uv run ruff check . && uv run ruff format .`

## Architecture
- `app/api/` — routers; `app/services/` — business logic; `app/models/` — SQLAlchemy models
- Migrations: Alembic in `migrations/`; create one for every model change (`alembic revision --autogenerate`)
- Settings come from environment variables via `app/config.py`

## Conventions
- Type hints everywhere; Pydantic models for request/response schemas
- Keep routers thin: logic goes to `services/`
- Use dependency injection (`Depends`) for DB sessions and auth

## Don't
- Don't edit existing migrations — create a new one
- Don't read or print secrets from `.env`
- Don't run destructive SQL against anything but the local database
