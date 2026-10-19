# linux/

Linux notes and service definitions.

| Path | Contents |
| :--- | :--- |
| `python.md` | Python environment notes (uv, venv, versions). |
| `services/` | `systemd` unit files for the local AI stack. |

## Rules

- Commands must be copy-pasteable and distribution-agnostic when possible.
- When a command is destructive, put it in a fenced block with a `# WARNING:`
  comment on the line above.
- Never commit a real username, hostname or token. Use `$USER` / `{{current_user}}`.
- Units go in `services/` and must be documented in `services/README.md`.
