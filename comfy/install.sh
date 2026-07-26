#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- Configuration ---
DEFAULT_PYTHON="python3.14"
TARGET_DIR="comfyUI"

echo "------------------------------------------"
echo "   ComfyUI Automated Installer"
echo "------------------------------------------"

# 1. Ask the user for the Python command
read -p "Enter the python command to use for venv [$DEFAULT_PYTHON]: " PYTHON_CMD

# If the user just presses Enter, use the default value
PYTHON_CMD=${PYTHON_CMD:-$DEFAULT_PYTHON}

# 2. Validate if the chosen python command exists on the system
if ! command -v "$PYTHON_CMD" &> /dev/null; then
    echo "Error: Command '$PYTHON_CMD' not found. Please check if Python is installed and in your PATH."
    exit 1
fi

# 3. Check if the directory already exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory '$TARGET_DIR' does not exist. Creating it..."
    mkdir "$TARGET_DIR"
else
    echo "Directory '$TARGET_DIR' already exists. Skipping creation."
fi

# 4. Create the Virtual Environment
echo "Creating virtual environment using '$PYTHON_CMD'..."
"$PYTHON_CMD" -m venv "$TARGET_DIR"

# 5. Enter the directory and activate the environment
cd "$TARGET_DIR"
echo "Activating virtual environment..."
# Note: Using 'source' works in interactive shells; for scripts, we use '.' 
# but 'source' is more readable and standard in most modern bash environments.
source bin/activate

# 6. Upgrade pip and install dependencies
echo "Updating pip and installing comfy-cli..."
pip install --upgrade pip
pip install comfy-cli

# 7. Run the ComfyUI installation via comfy-cli
echo "Starting ComfyUI installation via comfy-cli..."
comfy install

echo "------------------------------------------"
echo "SUCCESS: ComfyUI installation completed!"
echo "To start ComfyUI in the future, run: ./launch.sh"
echo "------------------------------------------"