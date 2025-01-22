#!/bin/bash

echo "Setting up bat with Catppuccin theme..."

# create bat config directory and themes subdirectory
BAT_CONFIG_DIR="$HOME/.config/bat"
mkdir -p "$BAT_CONFIG_DIR/themes"

# download catppuccin themes
echo "Downloading Catppuccin themes..."

# function to download using available tool
download_file() {
    local url="$1"
    local output="$2"
    if command -v wget &> /dev/null; then
        wget -O "$output" "$url"
    else
        curl -Lo "$output" "$url"
    fi
}

# download themes using the function
download_file "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme" "$BAT_CONFIG_DIR/themes/Catppuccin Latte.tmTheme"
download_file "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme" "$BAT_CONFIG_DIR/themes/Catppuccin Frappe.tmTheme"
download_file "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme" "$BAT_CONFIG_DIR/themes/Catppuccin Macchiato.tmTheme"
download_file "https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme" "$BAT_CONFIG_DIR/themes/Catppuccin Mocha.tmTheme"

# create/update bat config file
mkdir -p "$BAT_CONFIG_DIR"
echo "--theme=\"Catppuccin Macchiato\"" > "$BAT_CONFIG_DIR/config"

# rebuild bat cache using full path
echo "Rebuilding bat cache..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ "$(uname -m)" == "arm64" ]]; then
        /opt/homebrew/bin/bat cache --build
    else
        /usr/local/bin/bat cache --build
    fi
else
    bat cache --build  # for Linux
fi

echo "Bat configuration complete!" 