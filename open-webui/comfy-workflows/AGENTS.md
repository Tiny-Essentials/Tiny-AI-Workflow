# comfy-workflows/

ComfyUI workflows in the **API format** expected by OpenWebUI.

| Folder | Purpose |
| :--- | :--- |
| `image_generation/` | Text-to-image. |
| `edit_image/` | Image-to-image / inpainting. |

## Rules

- Export with **Save (API Format)**, never the regular save.
- One workflow per folder, with a `README.md` listing the node IDs that
  OpenWebUI must fill (prompt, width, height, steps, seed, checkpoint).
- A workflow that does not work must be renamed with a `(not-working)` suffix
  instead of being deleted.
- No model weights, no `__pycache__`, no `output/` folder.
