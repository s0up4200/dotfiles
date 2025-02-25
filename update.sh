#!/bin/bash

# fetch latest changes
cd ~/dotfiles
git pull

# check if aliases are already in .zshrc and add if missing
if ! grep -q "source ~/dotfiles/zsh/aliases.zsh" ~/.zshrc; then
    echo "source ~/dotfiles/zsh/aliases.zsh" >> ~/.zshrc
fi

# reload zsh configuration by executing the source command in zsh
zsh -c 'source ~/.zshrc'

echo "Dotfiles updated successfully!" 