## Default commands

```bash
# Set alias for easier access
alias ollama='docker exec -it ollama ollama'

# Run Ollama container in detached mode with GPU support
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

## Running compose

```bash
docker compose up -d
```

## Configuration

### Configure memory pools via environment variables
```bash
export OLLAMA_MAX_LOADED_MODELS=3
export OLLAMA_MAX_VRAM=6144  # 6GB in MB
export OLLAMA_CONTEXT_SIZE=4096
export OLLAMA_NUM_PARALLEL=2
```

### Start Ollama with custom memory settings
```bash
ollama serve
```

### Check allocated context length and model offloading

Reference: https://docs.ollama.com/context-length#check-allocated-context-length-and-model-offloading

```bash
export OLLAMA_CONTEXT_LENGTH=6400
ollama serve
ollama ps
```

## Performance and System Stability Optimization

To ensure optimal performance and prevent system instability (such as GPU driver crashes or "Out of Memory" errors), please adhere to the following resource management guidelines when running local Large Language Models (LLMs).

### VRAM Management and Resource Allocation
LLMs are highly dependent on available Video RAM (VRAM). When the model exceeds the available VRAM, the system may experience significant performance degradation or total application crashes.

* **Minimize IDE Overhead:** Avoid keeping excessive numbers of Visual Studio Code (VS Code) windows or heavy Integrated Development Environments (IDEs) open. Many modern IDE extensions and UI features utilize hardware acceleration, which consumes VRAM.
* **Manage Editor Tabs:** Close unnecessary editor tabs. Each active tab in a modern, GPU-accelerated editor contributes to the overall memory footprint of your development environment.
* **Close Background Applications:** Close other GPU-intensive software, such as web browsers with numerous hardware-accelerated tabs, video editing suites, or gaming applications, to ensure maximum VRAM is available for Ollama.

### Terminal Resource Consumption
Modern terminal emulators often utilize GPU acceleration to provide smooth text rendering and low latency.

* **Limit Terminal Tabs:** Be mindful of the number of active terminal tabs or panes open within VS Code or your system terminal. In some environments, each active terminal session can consume additional VRAM.
* **Monitor Usage:** If you experience performance drops, check your VRAM usage (e.g., via `nvidia-smi` on Linux) to determine if terminal sessions or IDE extensions are competing with the LLM for resources.
