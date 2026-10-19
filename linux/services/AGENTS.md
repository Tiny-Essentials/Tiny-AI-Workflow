# linux/services/

`systemd` **user-level** unit files for the local AI stack.

| Unit | Service |
| :--- | :--- |
| `openwebui.service` | OpenWebUI front-end. |
| `librechat.service` | LibreChat front-end. |
| `comfy.service` | ComfyUI backend. |
| `acestep.service` | ACE-Step audio generation. |

## Rules

1. One service per file, `kebab-case.service`.
2. Always `WantedBy=default.target` (user units), never `multi-user.target`.
3. Use absolute paths inside `ExecStart=`; `%h` for the home directory.
4. Every new unit needs a row in the table above **and** in `README.md`.
5. Never put secrets in the unit. Use `EnvironmentFile=%h/.config/<name>.env`.
6. After editing: `systemctl --user daemon-reload` then
   `systemctl --user restart <unit>`.
