# CRISPAI-BLUEPRINT — Claude Context

## Project
A living knowledge base of CRISPAI best practices: project scaffolding, API key management, model routing, worktree usage, and reusable templates for new projects.

## Key Directories
- `docs/practices/` — best practice documents (setup, keys, models, worktrees, general)
- `docs/templates/` — copy-paste templates (CLAUDE.md, pyproject.toml, Makefile)
- `docs/guides/` — step-by-step checklists
- `src/blueprint/` — any tooling built to automate blueprint tasks
- `scripts/` — one-off utility scripts
- `tests/` — tests for any automation code

## Purpose
This repo is the single source of truth for how CRISPAI projects are created and maintained.
When starting a new project, consult `docs/guides/new-project-checklist.md` first.

## Model Routing
| Task | Model | Why |
|------|-------|-----|
| Summaries, drafts | `qwen2.5:32b-ctx128k` via Ollama | Free local |
| Web search | `gemini-2.5-flash-lite` via Gemini | Unlimited RPD |
| Quality research | `gemini-2.5-flash` via Gemini | Better reasoning |
| Final QA + assembly | Claude Sonnet 4.6 | Tool use, consistency |

## API Keys
- `GEMINI_API_KEY` — Google Gemini
- `CRISPAI_NEBIUS_BLUEPRINT` — Nebius AI Studio (if needed)

## PR / Branch Convention
- Branch: `feature/<topic>-<description>`
- One PR per topic area (practices, templates, guides, tooling)

## User Preferences
- Diffs in terminal only
- Minimal output — expert programmer, no hand-holding
- Local models first, cloud burst only when needed
- PDF toolchain: pandoc + typst
