# default-prompts/

Default prompt templates, stored as JSON arrays.

## Schema

```json
[
  {
    "title": ["Primary heading", "Descriptive subtitle"],
    "content": "The prompt sent to the LLM."
  }
]
```

## Rules

- `title` is always a 2-item array: heading + subtitle.
- `content` is the literal prompt. No Markdown fences around it.
- Valid JSON, 2-space indentation, trailing newline.
- One file per theme (`coder.json`, `brony.json`, …).
- These are based on the upstream OpenWebUI list — do not remove the original
  prompts, only add.
