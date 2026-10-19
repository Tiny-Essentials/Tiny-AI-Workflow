# open-webui/

Everything related to an **OpenWebUI** installation.

| Path | Contents |
| :--- | :--- |
| `Chat-Settings.md` | Recommended UI/performance toggles. |
| `Functions.md` | Links to the Functions (plugins) in use. |
| `Tools.md` | Links to the Tools in use. |
| `models/` | Model presets (JSON) to import. |
| `default-prompts/` | Default prompt templates (JSON). |
| `comfy-workflows/` | ComfyUI workflow JSONs called by OpenWebUI. |

## Rules

- `Functions.md` and `Tools.md` are **link lists**. One entry = one link + one
  line explaining what it does. Do not paste the plugin source.
- Model presets are exported JSON. Do not hand-edit the IDs.
- Never commit the OpenWebUI database, `.env` or `webui.db`.
- When a setting only makes sense with a specific version, say which one.
