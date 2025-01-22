#!/bin/bash

# only run on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Skipping Ghostty installation (macOS only)"
    exit 0
fi

# install homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# install ghostty
echo "Installing Ghostty..."
brew install --cask ghostty

# set up ghostty config
GHOSTTY_CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_CONFIG_DIR"

# create config file with settings
cat > "$GHOSTTY_CONFIG_DIR/config" << 'EOL'
# Font configuration
font-family = "JetBrains Mono"
font-size = 14

# Window configuration
window-padding-x = 10
window-padding-y = 10
window-theme = "system"
window-decoration = true

# Terminal behavior
scrollback-limit = 10000
shell-integration = "detect"

# Theme and colors
theme = catppuccin-macchiato
EOL

echo "Ghostty configuration complete!"