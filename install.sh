#!/bin/bash

echo "Installing dotfiles..."

# Detect if running on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  echo "Running on macOS"
  ./macos-instant-show-dock.sh
fi

# Detect if running in a GitHub Codespace
if [[ -n "$CODESPACES" ]]; then
  echo "Running in a GitHub Codespace"
fi

./create-aliases.sh

echo "✅ Dotfiles installed"
