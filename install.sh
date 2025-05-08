#!/bin/bash
set -euo pipefail # Exit immediately if a command exits with a non-zero status

echo "Installing dotfiles..."

# Detect if running on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  echo "Running on macOS"
  ./macos-instant-show-dock.sh

  # install zshrc
  echo "Installing zshrc..."
  # If the .zshrc file exists, just add a line to also run the dotfiles script. Otherwise,
  # create a symbolic link to the dotfiles script.
  if [[ -f "$HOME/.zshrc" ]]; then
    echo "Adding line to existing .zshrc"
    # Check if the line already exists
    if grep -q "source ~/dotfiles/zshrc" "$HOME/.zshrc"; then
      echo "Line already exists in .zshrc"
    else
      echo "source ~/dotfiles/zshrc" >> "$HOME/.zshrc"
    fi
  else
    echo "Creating symbolic link to zshrc"
    ln -sf "~/dotfiles/zshrc" "$HOME/.zshrc"
  fi

  # Ensure that Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install Homebrew packages
  echo "Installing Homebrew packages..."
  brew update
  brew bundle --file=~/dotfiles/Brewfile
  
  echo "Setting up Ghostty config..."
  # Link the ghostty_config file to `$HOME/.config/ghostty/config` (or overwrite if it exists)
  mkdir -p "$HOME/.config/ghostty"
  ln -sf "$(pwd)/ghostty_config" "$HOME/.config/ghostty/config"
  echo "Ghostty config set up at $HOME/.config/ghostty/config"
fi

# Detect if running in a GitHub Codespace
if [[ -n "${CODESPACES:-}" ]]; then
  echo "Running in a GitHub Codespace"
fi

./create-aliases.sh

echo "✅ Dotfiles installed"
