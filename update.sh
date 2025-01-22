#!/bin/bash

# fetch latest changes
cd ~/dotfiles
git pull

# relink aliases file
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# reload zsh configuration by executing the source command in zsh
zsh -c 'source ~/.zshrc'

echo "Dotfiles updated successfully!" 