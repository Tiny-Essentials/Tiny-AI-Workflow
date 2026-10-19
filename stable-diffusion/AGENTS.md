# stable-diffusion/

Prompt engineering references for image generation models.

| Path | Contents |
| :--- | :--- |
| `sd-break-text.md` | How the 75-token chunking works and why prompts break. |
| `prompt-maker/` | System prompts for "prompt engineer" LLMs. |
| `prompt-templates/` | Ready-to-use prompt templates. |

## Rules

- This folder is **text only**. No generated images, no checkpoints, no LoRAs.
- Prompt syntax is model-specific. Always state the target model in the file.
- Weights use the `(term:1.2)` syntax; do not convert to `[term]` or `((term))`
  without a reason.
- `questionable/` holds adult/fetish-adjacent templates. Keep it isolated; never
  reference it from a technical document.
