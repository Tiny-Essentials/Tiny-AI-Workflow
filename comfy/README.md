# ComfyUI Setup Manager

## Overview
This directory contains automation scripts designed to install and run **ComfyUI** within an isolated Python virtual environment. 

## Purpose
The primary goal of this setup is to provide a sandboxed environment for ComfyUI. 

ComfyUI relies heavily on "Custom Nodes" provided by the community. These nodes often require specific, and sometimes conflicting, versions of Python libraries. By using an isolated environment:
- **System Stability:** Your operating system's Python installation remains untouched and stable.
- **Conflict Prevention:** You can install, update, or remove custom nodes without the risk of breaking other software on your system.

## File Descriptions

| File | Description |
| :--- | :--- |
| `install.sh` | Automates the creation of a Python virtual environment (`venv`) and installs all required dependencies for ComfyUI. |
| `launch.sh` | Activates the virtual environment and starts the ComfyUI server automatically. |

## Prerequisites

Before running the scripts, ensure you have the following installed on your system:
- **Python 3.14** (compatible with the latest ComfyUI requirements).
- **Git** (to clone repositories and manage nodes).
- **Bash** (standard on most Linux and macOS environments).

## Usage Instructions

### 1. Initial Installation
The first time you set up the project, you must run the installation script. This will set up the virtual environment and download the necessary packages.

```bash
# Make the scripts executable
chmod +x *.sh

# Run the installation script
./install.sh
```
