#!/bin/bash

# only run on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Skipping Ghostty configuration (macOS only)"
    exit 0
fi


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