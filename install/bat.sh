#!/bin/bash

echo "Setting up bat with Catppuccin theme..."

# create bat config directory and themes subdirectory
BAT_CONFIG_DIR="$(bat --config-dir)"
mkdir -p "$BAT_CONFIG_DIR/themes"

# download catppuccin themes
echo "Downloading Catppuccin themes..."
wget -P "$BAT_CONFIG_DIR/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$BAT_CONFIG_DIR/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$BAT_CONFIG_DIR/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$BAT_CONFIG_DIR/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme

# create/update bat config file
BAT_CONFIG_FILE="$(bat --config-file)"
mkdir -p "$(dirname "$BAT_CONFIG_FILE")"
echo "--theme=\"Catppuccin Macchiato\"" > "$BAT_CONFIG_FILE"

# rebuild bat cache
echo "Rebuilding bat cache..."
bat cache --build

echo "Bat configuration complete!" 