# prompt-templates/

Reference prompts, stored as text. **No images are committed here.**

## Layout

```text
prompt-templates/
├── questionable/   # adult / fetish-adjacent templates
└── README.md
```

## Rules

- One file per template or per tightly related set, `kebab-case.md`.
- Start with the positive prompt, then `Negative:`, then optional notes.
- State the model/checkpoint the template was tuned for.
- Everything under `questionable/` is fiction and must stay there.
