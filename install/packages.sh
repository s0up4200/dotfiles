#!/bin/bash

# Only proceed if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script is for macOS only."
    exit 0
fi

# install homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Set up Homebrew in the PATH
    echo "Setting up Homebrew in PATH..."
    if [[ "$(uname -m)" == "arm64" ]]; then
        # M1/M2 Mac
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        source ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        # Intel Mac
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        source ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    # Verify Homebrew is now in PATH
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew installation failed or PATH not set correctly"
        exit 1
    fi
else
    echo "Homebrew already installed"
fi

# install basic utilities
echo "Installing basic utilities..."
brew install wget
brew install git
brew install gh
brew install tmux

# install modern CLI replacements
echo "Installing modern CLI tools..."
brew install bat
brew install eza
brew install gdu

# install development tools
echo "Installing development tools..."
brew install node@22
brew install pnpm
brew install vite
brew install go
brew install aichat

# install GUI applications
echo "Installing productivity applications..."
brew install --cask raycast    # spotlight replacement
brew install --cask numi       # calculator
brew install --cask ghostty    # terminal
brew install --cask 1password  # password manager

echo "Installing browsers..."
brew install --cask firefox

echo "Installing media applications..."
brew install --cask spotify

echo "Installing download tools..."
brew install --cask qbittorrent
brew install --cask transmission

echo "Installing system utilities..."
brew install --cask jordanbaird-ice  # window management

# cleanup
echo "Cleaning up..."
brew cleanup

echo "Package installation complete!"