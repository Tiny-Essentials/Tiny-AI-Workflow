# librechat/

Skills and configuration snippets for **LibreChat**.

- `skills/` — one Markdown file per skill, same contract used by
  [`../agents/puddy-coder/versions/1/skills/`](../agents/puddy-coder/versions/1/skills/AGENTS.md)
  (`## Name`, `## Description`, `## System Prompt`).
- Skills are pasted into the LibreChat UI; they must be self-contained.
- Portuguese skills carry the `(pt-br)` suffix in the file name.
- Never put an API key, base URL with token or model credential here.
