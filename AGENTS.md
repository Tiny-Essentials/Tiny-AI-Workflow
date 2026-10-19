# AGENTS.md — Root Instructions

## What this repository is

This is a **documentation and configuration vault**, not an application. It stores
personal AI assets: agent prompts, OpenWebUI model configs, ComfyUI workflows,
Stable Diffusion prompt templates, Linux service units and long-form articles.

There is **no build step, no test suite and no runtime**. The only "product" is
well-organized Markdown and JSON.

## Golden rules

1. **Language**
   - Code, comments, commit messages, file names and documentation: **English**.
   - Portuguese content is allowed, but the file name **must** carry the `(pt-br)`
     suffix (e.g. `Basics-(pt-br).md`).
   - Never mix two languages inside the same file.
2. **Markdown only** — do not introduce tooling (no `package.json`, no linters,
   no CI) unless explicitly requested.
3. **No secrets, tokens, API keys or personal paths** in any file. Use
   placeholders such as `{{current_user}}` or `/path/to/model`.
4. **No binary blobs** except the existing images. Link to external files instead.
5. **Preserve user voice** — when editing prose, keep the author's tone, emoji
   usage and formatting style. Do not "improve" text that was not part of the task.

## Directory map

| Path | Contents |
| :--- | :--- |
| `agents/` | Agent system prompts, skills, subagents and transfer agents. |
| `articles/` | Long-form articles and AI explainers. |
| `comfy/` | Install/launch scripts for an isolated ComfyUI environment. |
| `deprecated/` | Frozen content kept for reference. Do not update, do not link to it. |
| `invokeai/` | InvokeAI tutorials and workflows. |
| `librechat/` | LibreChat skills. |
| `linux/` | Linux notes and `systemd` unit files. |
| `ollama/` | Ollama Docker setup and model notes by VRAM size. |
| `open-webui/` | OpenWebUI configs, prompts, tools and ComfyUI workflows. |
| `stable-diffusion/` | Prompt engineering references and templates. |
| `suno/` | Suno (music generation) methodology. |
| `voice-ai/` | Voice cloning / TTS references. |

## Where does a new file go?

- New agent or persona → `agents/<agent-name>/` (see [`agents/AGENTS.md`](agents/AGENTS.md)).
- New model preset → `open-webui/models/{admin,personal}/`.
- New image prompt template → `stable-diffusion/prompt-templates/`.
- New article → `articles/` (or `articles/text-ai/` for AI theory).
- New systemd unit → `linux/services/` **and** document it in that folder's README.

## When you add or remove a top-level directory

Update three places: this file (directory map), [`README.md`](README.md) and the
`AGENTS.md` of the parent directory. A stale map is considered a bug.

## Content policy

Some folders (`agents/roleplay/`, `stable-diffusion/prompt-templates/questionable/`)
contain adult or fetish-adjacent fictional content. Rules:

- They are **fiction only** and must stay clearly separated from technical work.
- Never import that context into professional, legal or code tasks.
- Never move that content to a different folder or "clean it up" without an
explicit request.

## Style checklist before saving

- [ ] File name in `kebab-case.md` (parentheses only for `(pt-br)` / `(WIP)`).
- [ ] One `# H1` per document.
- [ ] Fenced code blocks always declare a language.
- [ ] Relative links point to files that actually exist.
- [ ] No trailing whitespace, file ends with a single newline.
