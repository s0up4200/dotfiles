#!/bin/bash

echo "Starting installation..."

# ensure we're in the right directory
cd "$(dirname "$0")"

# make all installation scripts executable
chmod +x install/*.sh

# create dotfiles structure
mkdir -p ~/dotfiles/zsh

# copy zsh configurations
cp zsh/aliases.zsh ~/dotfiles/zsh/

# detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running macOS installation..."
    ./install/packages.sh
    echo "Would you like to install Mac App Store applications? (y/n)"
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Please make sure you're logged in to the Mac App Store first."
        echo "Press any key to continue when ready..."
        read -n 1 -r
        ./install/mas_apps.sh
    fi
    ./install/shell.sh
    ./install/vim.sh
    ./install/bat.sh
    ./install/ghostty.sh
    ./install/repos.sh
    ./install/go.sh
    ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
else
    echo "Running Linux installation..."
    ./install/linux-packages.sh
    ./install/shell.sh
    ./install/vim.sh
    ./install/bat.sh
    ./install/repos.sh
    ./install/go.sh
    
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