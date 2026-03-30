# General Best Practices

## Code Style
- No docstrings or type annotations on code you didn't write
- No helpers/utilities for one-time operations
- No speculative abstractions — build for what's needed now
- Three similar lines > premature abstraction
- Comments only where logic isn't self-evident

## Dependency Management (uv)
```bash
uv add <package>              # add runtime dep
uv add --dev <package>        # add dev dep
uv remove <package>           # remove
uv sync                       # install from lockfile
uv run python <script.py>     # run in venv without activating
```

## Makefile Targets (Standard)
Every project should have a `Makefile` with:
```makefile
.PHONY: install sync lint test verify

install:
	uv sync

lint:
	uv run ruff check .

test:
	uv run pytest

verify:
	$(MAKE) lint test
```

## Database (PostgreSQL)
- Local PostgreSQL 15, port 5432, user: sachin
- Each project gets its own schema (never use `public`)
- pgvector for embeddings (768-dim)
- Migrations in `db/migrations/`, applied via `make migrate`

## Output Artifacts
- Markdown-first, then PDF via pandoc + typst
- Never use LaTeX directly
- Store outputs in `output/` or project-specific named dirs

## Claude Code CLI Tips
- `CLAUDE.md` at project root is auto-loaded as context
- Use `/fast` to toggle fast mode (same Opus model, faster output)
- `! <command>` in prompt runs shell command inline
- Use hooks in `settings.json` for automated pre/post behaviors
- Memory system at `~/.claude/projects/<path>/memory/`

## Security
- Never commit `.env`, credentials, or keys
- Validate only at system boundaries (user input, external APIs)
- No command injection, no XSS, no SQL injection
- Use parameterized queries always
