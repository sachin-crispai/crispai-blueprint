# New Project Checklist

## 1. Create Directory & Python Environment
- [ ] `mkdir -p /Volumes/WORK900_CRISPAI/CRISPAI-<NAME>`
- [ ] `uv init --python 3.13.2 && uv python install 3.13.2 && uv sync`

## 2. IntelliJ Setup
- [ ] Create `.idea/<PROJECT>.iml`, `.idea/modules.xml`, `.idea/misc.xml`
- [ ] Open in IntelliJ/PyCharm → set SDK to `.venv`

## 3. Git & GitHub
- [ ] `git init && git add . && git commit -m "Initial project setup"`
- [ ] `gh repo create <repo-name> --public --source=. --remote=origin --push`

## 4. Project Structure
- [ ] `src/<module>/` — source code
- [ ] `tests/` — test files
- [ ] `docs/` — specs and notes
- [ ] `output/` — generated artifacts (gitignored if large)
- [ ] `scripts/` — one-off utility scripts

## 5. Config Files
- [ ] Copy `CLAUDE.md.template` → `CLAUDE.md`, fill in project details
- [ ] Copy `pyproject.toml.template` → update name/description
- [ ] Copy `Makefile.template` → `Makefile`
- [ ] Update `.gitignore`

## 6. API Keys
- [ ] Add new Nebius key for project to `~/.claude/settings.json` env block
- [ ] Name it `CRISPAI_NEBIUS_<PROJECT>`
- [ ] Reference key names (not values) in `CLAUDE.md`

## 7. Verify
- [ ] `make verify` passes (lint + tests)
- [ ] `git push` — confirm on GitHub
- [ ] Open in IntelliJ — Python interpreter resolves correctly
