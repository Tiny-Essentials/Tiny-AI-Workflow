# ollama/models/

One file per VRAM tier: `12gb.md`, `24gb.md`, `48gb.md`…

## Entry format

```markdown
### `model:tag`

- **Quantization:** Q4_K_M
- **Context:** 8k
- **VRAM:** ~11.2 GB
- **Verdict:** one sentence.
```

- Sort by quality, best first.
- Only add a model after running it on real hardware of that tier.
- Do not delete a model that stopped being recommended — mark it as such.
