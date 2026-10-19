# agents/ — Agent Definitions

## Purpose

Every subfolder here is a **persona or agent package**: the system prompt,
metadata, skills and sub-agents that define how an LLM should behave.

## Two-level layout (category → agent)

```text
agents/
├── professional/          # Work, code, documentation, productivity
│   └── <agent-name>/
└── roleplay/              # Fiction, characters, narrative
    └── <agent-name>/
```

**The first level is always a category, never an agent.** If you are about to
create `agents/my-agent/`, stop: decide whether it is `professional/` or
`roleplay/` first. A new category is a big deal — it needs a `README.md`, an
entry in the root [`README.md`](../README.md) and a line in the table below.

| Category | Contents |
| :--- | :--- |
| `professional/` | Coding, docs, architecture, anything work-related. |
| `roleplay/` | Fictional characters and narrative engines. |

## Structure of an agent package

```text
<category>/
│  <agent-name>/
│  ├── sketch/            # Work-in-progress draft of the next version
│  ├── versions/
│  │   └── <n>/
│  │       ├── instruction.md   # System prompt (the agent itself)
│  │       ├── metadata.md      # Name, description, category, contact
│  │       ├── prompts/         # Reusable prompt snippets
│  │       ├── skills/          # On-demand capabilities
│  │       ├── subagents/       # Nested agents with their own context
│  │       ├── transfer-agents/ # Agents the main agent can hand off to
│  │       └── deprecated/      # Frozen older revisions
```

## Rules

1. **Never edit a released version in place** to change behavior. Copy it to
   `versions/<n+1>/` and edit the copy. Old versions are history.
2. `instruction.md` is the prompt. It must be self-contained: the model reading
   it has no other context.
3. `metadata.md` is data, not prose. Keep the `## Name`, `## Description`,
   `## Category` headings — tooling parses them.
4. Skills and sub-agents are **opt-in**: the main instruction must state when to
   load them, otherwise they are dead weight in the context window.
5. Moving an agent between categories is a `git mv` **plus** an update to every
   relative link. Grep for the old path before committing.

## Content separation (hard rule)

`agents/roleplay/` is fictional/personal content. It must never be mixed with
`agents/professional/` (work, code, documentation). Do not copy tone, style or
examples between them, and never load a roleplay agent during a professional
session (or the reverse).

## Adding a new agent

1. Pick the category: `professional/` or `roleplay/`.
2. Create `agents/<category>/<agent-name>/versions/1/`.
3. Add `instruction.md` and `metadata.md`.
4. Add a row to the root [`README.md`](../README.md) if the agent is public.
