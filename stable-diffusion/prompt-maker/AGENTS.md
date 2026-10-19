# prompt-maker/

System prompts that turn a short idea into a full image prompt.

## Contract

- One file per target model, named after the checkpoint (`yiffymixv64.md`).
- The file is a **system prompt**: it is pasted verbatim into the LLM.
- It must define, in this order: role, output format, tag hierarchy, negative
  prompt, and the "no commentary" rule.
- No Markdown headings required — the file is read as plain text by the model.

## When adding a model

1. Copy the closest existing file.
2. Update the model name, the base architecture and the tag dialect.
3. Test it against the real checkpoint before committing.
