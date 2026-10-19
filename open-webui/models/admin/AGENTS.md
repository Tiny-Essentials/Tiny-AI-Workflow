# models/admin/

Presets imported through **Admin → Models** in OpenWebUI.

- One JSON per model, file name = model tag.
- The model itself must already exist in the provider (Ollama, OpenAI, …).
  These files contain **settings only**, never weights.
- When adding a preset, keep the parameters that matter for reproducibility
  (`temperature`, `top_p`, `num_ctx`, `repeat_penalty`).
- Do not reorder or reformat the JSON: diffs must stay readable.
