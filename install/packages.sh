#!/bin/bash

# install homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# install command line tools
echo "Installing CLI tools..."
brew install node@22
brew install tmux
brew install bat
brew install eza
brew install git
brew install pnpm
brew install vite
brew install aichat

# install cask applications
echo "Installing applications..."
brew install --cask ghostty
brew install --cask firefox
brew install --cask jordanbaird-ice
brew install --cask numi
brew install --cask qbittorrent
brew install --cask spotify
brew install --cask transmission

# set up ghostty config
GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_CONFIG_DIR"
cp config/ghostty/config "$GHOSTTY_CONFIG_DIR/config"

# run bat configuration
./install/bat.sh

echo "Installation complete!" 