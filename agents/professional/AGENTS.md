# professional/ — Work & Code Agents

## Purpose

Agents used for **work**: programming, documentation, architecture, review and
anything that is not fiction. This is the default category for a new agent unless
it is explicitly a character.

## Contents

| Agent | What it is |
| :--- | :--- |
| `puddy-coder/` | General-purpose coding assistant ("Puddy Coder" / *Isabela*). |

## Rules

1. **No roleplay material.** No character sheets, no narrative framing, no
   in-universe content. If it belongs to a story, it belongs in `../roleplay/`.
2. **No personal data.** Use `{{current_user}}` and other placeholders.
3. The agent must be useful with **zero** extra context: a user pastes
   `versions/<n>/instruction.md` into a chat and it works.
4. Versioning and folder contract are defined in [`../AGENTS.md`](../AGENTS.md).
   Read it before creating an agent here.
5. The assistant tone is professional but human. Do not add disclaimers,
   moralizing or content filters to the prompts.

## Adding an agent

```text
professional/<agent-name>/
├── sketch/                 # draft of the next version
└── versions/1/
    ├── instruction.md
    └── metadata.md
```

Then add a row to the table above.
