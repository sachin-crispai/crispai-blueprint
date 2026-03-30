# Model Routing — Cost + Speed Optimized

## Routing Table

| Task | Model | Provider | Why |
|------|-------|----------|-----|
| File reading, summaries, drafts | `qwen2.5:32b-ctx128k` | Ollama localhost:11434 | Free local |
| Embeddings (primary) | `nomic-embed-text` | Ollama | Free local, 768-dim |
| Embeddings (overflow) | `BAAI/bge-multilingual-gemma2` | Nebius | $0.01/1M tokens |
| Web search + light research | `gemini-2.5-flash-lite` | Gemini API | Unlimited RPD |
| Quality research | `gemini-2.5-flash` | Gemini API | Better reasoning |
| Chapter / long-form writing | `Qwen/Qwen3-235B-A22B-Instruct-2507` | Nebius batch | $0.10 in / $0.30 out |
| Architecture / chain-of-thought | `deepseek-ai/DeepSeek-R1-0528` | Nebius | Reasoning |
| Fast structured output | `Qwen/Qwen3-32B-fast` | Nebius | Speed + structure |
| Final QA, tool use, assembly | `claude-sonnet-4-6` | Anthropic | Tool use, consistency |

## Principles
1. **Local first** — Ollama models are free; use for all draft/summary work
2. **Burst to cloud** — only when local quality is insufficient
3. **Batch for bulk** — Nebius batch API for >50 chunk writes
4. **Flash-lite for search** — unlimited RPD makes it ideal for web grounding
5. **Claude for control flow** — tool use, JSON enforcement, final assembly

## Ollama Quick Reference
```bash
ollama run qwen2.5:32b-ctx128k   # interactive
ollama serve                      # ensure daemon running on :11434
```

## Nebius Quick Reference
```python
from openai import OpenAI
client = OpenAI(
    base_url="https://api.studio.nebius.com/v1/",
    api_key=os.environ["CRISPAI_NEBIUS_<PROJECT>"]
)
```
