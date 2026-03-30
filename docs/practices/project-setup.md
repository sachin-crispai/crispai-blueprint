# Project Setup Best Practices

## Directory Naming
- Format: `CRISPAI-<PROJECT-NAME>` (all caps, hyphen-separated)
- Location: `/Volumes/WORK900_CRISPAI/`

## Python Environment
- Runtime manager: `uv`
- Default Python: 3.13.2
- Always pin in `.python-version`

```bash
mkdir -p /Volumes/WORK900_CRISPAI/CRISPAI-<NAME>
cd /Volumes/WORK900_CRISPAI/CRISPAI-<NAME>
uv init --python 3.13.2
uv python install 3.13.2
uv sync
```

## IntelliJ / PyCharm Setup
- Create `.idea/` with module, modules.xml, misc.xml
- Point SDK to `.venv` inside the project root
- Exclude from `.gitignore`: `workspace.xml`, `tasks.xml`, `shelf/`
- Commit: `.iml`, `modules.xml`, `misc.xml`

## Git & GitHub
```bash
git init
git add .
git commit -m "Initial project setup with uv and Python 3.13.2"
gh repo create <repo-name> --public --source=. --remote=origin --push
```

## CLAUDE.md
Every project root should have a `CLAUDE.md` that captures:
- Project purpose and target
- Key directories
- Model routing table (cost-optimized)
- API keys in use (names only, not values)
- PR/branch conventions
- User preferences
