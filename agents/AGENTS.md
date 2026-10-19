# agents/ — Agent Definitions

## Purpose

Every subfolder here is a **persona or agent package**: the system prompt,
metadata, skills and sub-agents that define how an LLM should behave.

## Structure of an agent package

```text
<agent-name>/
├── sketch/            # Work-in-progress draft of the next version
├── versions/
│   └── <n>/
│       ├── instruction.md   # System prompt (the agent itself)
│       ├── metadata.md      # Name, description, category, contact
│       ├── prompts/         # Reusable prompt snippets
│       ├── skills/          # On-demand capabilities
│       ├── subagents/       # Nested agents with their own context
│       ├── transfer-agents/ # Agents the main agent can hand off to
│       └── deprecated/      # Frozen older revisions
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
5. Language: instructions in English. `agents/roleplay/` is the only exception
   and has its own rules.

## Content separation (hard rule)

`agents/roleplay/` is fictional/personal content. It must never be mixed with
`agents/puddy-coder/` (professional coding assistant). Do not copy tone, style
or examples between them.

## Adding a new agent

1. Create `agents/<agent-name>/versions/1/`.
2. Add `instruction.md` and `metadata.md`.
3. Add a row to the root [`README.md`](../README.md) if the agent is public.
