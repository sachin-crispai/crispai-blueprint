# API Key Management

## Storage
All API keys live in `~/.claude/settings.json` under the `env` block.
Never commit keys to any repo. Never hardcode in source.

```json
{
  "env": {
    "GEMINI_API_KEY": "...",
    "OPENAI_API_KEY": "...",
    "CRISPAI_NEBIUS_<PROJECT>": "..."
  }
}
```

## Naming Convention
- Google Gemini: `GEMINI_API_KEY` (shared or `GEMINI_API_KEY_<PROJECT>` if project-isolated)
- OpenAI: `OPENAI_API_KEY`
- Nebius: `CRISPAI_NEBIUS_<PROJECT>` — one key per project for cost tracking
- Anthropic: `ANTHROPIC_API_KEY`

## Nebius Endpoint
```
Base URL: https://api.studio.nebius.com/v1/
Auth: Bearer $CRISPAI_NEBIUS_<PROJECT>
Protocol: OpenAI-compatible
```

## Accessing in Code
Always read from environment — never pass literals:
```python
import os
key = os.environ["CRISPAI_NEBIUS_MYPROJECT"]
```

## Rotation
- Rotate on suspected exposure immediately
- Use separate keys per project so rotation is scoped
- Key names in `CLAUDE.md` for visibility, values only in `settings.json`
