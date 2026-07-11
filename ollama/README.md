## Default commands

```bash
alias ollama='docker exec -it ollama ollama'
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

## Running compose

```bash
docker compose up -d
```

## How to config

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