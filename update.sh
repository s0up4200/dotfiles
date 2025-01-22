#!/bin/bash

# fetch latest changes
cd ~/dotfiles
git pull

# relink aliases file
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# reload zsh configuration
source ~/.zshrc

echo "Dotfiles updated successfully!" 