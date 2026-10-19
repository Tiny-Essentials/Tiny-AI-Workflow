# comfy/

Isolated **ComfyUI** environment: one install script, one launcher.

| File | Responsibility |
| :--- | :--- |
| `install.sh` | Create the `venv` and install ComfyUI + dependencies. |
| `launch.sh` | Activate the `venv` and start the server. |
| `README.md` | Human documentation. Keep it in sync with the scripts. |

## Rules

- Both scripts must stay **idempotent**: running twice must not break anything.
- Never hardcode a home directory. Use `"$(cd "$(dirname "$0")" && pwd)"`.
- The `venv` directory is git-ignored (see root `.gitignore`). Never commit it.
- Any new flag goes into `launch.sh` **and** into the README table.
