#!/bin/bash

# create required directories
mkdir -p ~/.vim/colors

# clone catppuccin theme
git clone https://github.com/catppuccin/vim.git ~/.vim/catppuccin-vim

# copy color files
cp ~/.vim/catppuccin-vim/colors/* ~/.vim/colors/

# cleanup downloaded repo
rm -rf ~/.vim/catppuccin-vim

# copy vimrc file
cp .vim/vimrc ~/.vim/vimrc

# create symlink to .vimrc in home directory
ln -sf ~/.vim/vimrc ~/.vimrc

chmod +x install/vim.sh 