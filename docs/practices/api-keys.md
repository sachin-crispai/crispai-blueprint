# API Key Management

## Storage
All API keys live in `~/.claude/settings.json` under the `env` block.
Never commit keys to any repo. Never hardcode in source.

```json
{
  "env": {
    "CRISPAI-GEMINI-<PROJECT-ID>": "...",
    "CRISPAI-NEBIUS-<PROJECT-ID>": "...",
    "CRISPAI-OPENAI-<PROJECT-ID>": "...",
    "CRISPAI-ANTHROPIC-<PROJECT-ID>": "..."
  }
}
```

## Naming Convention

**Format: `CRISPAI-<VENDOR>-<PROJECT-ID>`**

- All caps, hyphen-separated
- `<VENDOR>` — the service provider (GEMINI, NEBIUS, OPENAI, ANTHROPIC, GITHUB, etc.)
- `<PROJECT-ID>` — matches the project directory name without the `CRISPAI-` prefix
  (e.g. project `CRISPAI-DREAMER-SIDEKICK` → `<PROJECT-ID>` = `DREAMER-SIDEKICK`)

### Examples

| Service | Project | Key Name |
|---------|---------|----------|
| Google Gemini | DREAMER-SIDEKICK | `CRISPAI-GEMINI-DREAMER-SIDEKICK` |
| Nebius AI | DREAMER-SIDEKICK | `CRISPAI-NEBIUS-DREAMER-SIDEKICK` |
| OpenAI | DREAMER-SIDEKICK | `CRISPAI-OPENAI-DREAMER-SIDEKICK` |
| Anthropic | DREAMER-SIDEKICK | `CRISPAI-ANTHROPIC-DREAMER-SIDEKICK` |
| Google Gemini | OPENCLAW | `CRISPAI-GEMINI-OPENCLAW` |
| Nebius AI | OPENCLAW | `CRISPAI-NEBIUS-OPENCLAW` |

## Full Key Registry Per Project

When creating a new project, register all keys it will need in `~/.claude/settings.json`:

```json
{
  "env": {
    "CRISPAI-GEMINI-<PROJECT-ID>": "",
    "CRISPAI-NEBIUS-<PROJECT-ID>": "",
    "CRISPAI-OPENAI-<PROJECT-ID>": "",
    "CRISPAI-ANTHROPIC-<PROJECT-ID>": "",
    "CRISPAI-GITHUB-<PROJECT-ID>": ""
  }
}
```

Leave value empty (`""`) as a placeholder — fill in when the key is provisioned.
This keeps the registry discoverable without exposing values.

## Vendor Reference

| Vendor | Portal | Notes |
|--------|--------|-------|
| GEMINI | aistudio.google.com | Unlimited RPD on flash-lite |
| NEBIUS | studio.nebius.com | OpenAI-compatible, base URL: https://api.studio.nebius.com/v1/ |
| OPENAI | platform.openai.com | Use for GPT-4o, embeddings fallback |
| ANTHROPIC | console.anthropic.com | claude-sonnet-4-6 for tool use / QA |
| GITHUB | github.com/settings/tokens | PAT for repo automation |
| OLLAMA | localhost:11434 | No key — local, free |

## Accessing in Code

Always read from environment — never pass literals:

```python
import os

gemini_key = os.environ["CRISPAI-GEMINI-DREAMER-SIDEKICK"]
nebius_key  = os.environ["CRISPAI-NEBIUS-DREAMER-SIDEKICK"]
```

For Nebius (OpenAI-compatible):
```python
from openai import OpenAI

client = OpenAI(
    base_url="https://api.studio.nebius.com/v1/",
    api_key=os.environ["CRISPAI-NEBIUS-<PROJECT-ID>"]
)
```

## Rotation
- Rotate immediately on suspected exposure
- One key per project → rotation is scoped, no blast radius to other projects
- Key **names** go in `CLAUDE.md` (for visibility); values only in `settings.json`
- After rotation: update `settings.json`, do NOT update the key name

## Propagation Checklist (New Project)
- [ ] Provision keys at each vendor portal
- [ ] Add all keys to `~/.claude/settings.json` env block
- [ ] Reference key names (not values) in the project's `CLAUDE.md`
- [ ] Verify access: `echo $CRISPAI-GEMINI-<PROJECT-ID>` returns non-empty
