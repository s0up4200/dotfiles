#!/bin/bash

echo "Starting installation..."

# ensure we're in the right directory
cd "$(dirname "$0")"

# run package installations first (includes Homebrew)
./install/packages.sh

# set up shell configuration
./install/shell.sh

# set up vim configuration
./install/vim.sh

# set up bat configuration
./install/bat.sh

# set up ghostty configuration
./install/ghostty.sh

# create symlink for gitconfig
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig

echo "Installation complete! Please restart your terminal." 