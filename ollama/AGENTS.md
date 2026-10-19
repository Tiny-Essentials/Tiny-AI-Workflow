# ollama/

Docker-based Ollama setup plus model recommendations grouped by **VRAM**.

| Path | Contents |
| :--- | :--- |
| `docker-compose.yml` | The only supported way to run Ollama here. |
| `models/12gb.md` | Models that fit in 12 GB of VRAM. |
| `models/24gb.md` | Models that fit in 24 GB of VRAM. |

## Rules

- Never commit `~/.ollama` or any model weight.
- A model only enters a list after being tested on the target VRAM size.
- Each entry: model tag, quantization, context used and a one-line verdict.
- Keep `OLLAMA_MAX_LOADED_MODELS` / `OLLAMA_CONTEXT_LENGTH` documented in the
  README when you rely on them.
