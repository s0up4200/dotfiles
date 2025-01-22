#!/bin/bash

echo "Starting installation..."

# ensure we're in the right directory
cd "$(dirname "$0")"

# make all installation scripts executable
chmod +x install/*.sh

# detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running macOS installation..."
    ./install/packages.sh
    ./install/shell.sh
    ./install/vim.sh
    ./install/bat.sh
    ./install/ghostty.sh
    ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
else
    echo "Running Linux installation..."
    ./install/linux-packages.sh
    ./install/shell.sh
    ./install/vim.sh
    ./install/bat.sh
    
    # use simplified gitconfig for Linux
    cat > ~/.gitconfig << EOL
[user]
        name = s0up4200
        email = s0up4200@pm.me
[pull]
        rebase = false
[fetch]
        prune = true
[diff]
        colorMoved = zebra
[core]
        editor = nano
EOL
fi

echo "Installation complete! Please restart your terminal." 