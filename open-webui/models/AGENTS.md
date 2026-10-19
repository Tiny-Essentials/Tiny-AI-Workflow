# open-webui/models/

Model presets exported from OpenWebUI, split by **where they are imported**.

| Folder | OpenWebUI section |
| :--- | :--- |
| `admin/` | **Models** (admin-level, shared). |
| `personal/` | **Workspace** (personal). |

## Rules

- File name = model tag, exactly as the provider exposes it
  (`gemma4:12b-it-qat.json`). The `:` is intentional — do not sanitize it.
- One model per file. No arrays, no bundles.
- Keep the JSON valid: these files are imported directly by the UI.
- A preset that only works with a specific system prompt must say so in the
  model description field, not in a separate file.
