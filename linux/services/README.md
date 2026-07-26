# Recommended Software Stack

> **Installation Note:** To ensure system stability and optimal dependency management, always attempt to install software via its official repository or native package manager before proceeding with manual configurations.

## LLM Interfaces (Text-based AI)
*These interfaces require a backend provider; it is recommended to have [Ollama](https://ollama.com/) installed as the primary model runner.*

### 1. Open WebUI
A highly customizable interface for interacting with Large Language Models that supports multiple providers.
- **Prerequisites:** `uvx`, Node.js

### 2. LibreChat
An advanced, open-source AI chat interface that supports multiple providers.
- **Prerequisites:** Node.js

## Audio Synthesis & Music Generation

### 1. Ace Step 1.5
High-fidelity audio generation tool.
- **Prerequisites:** `uv`

## Generative Media Tools

### 1. ComfyUI
A modular, node-based GUI for Stable Diffusion and other generative media workflows.
- **Installation Method:** It is highly recommended to use the provided automation script in the repository for setup:
  ```bash
  ./comfy/install.sh
  ```
