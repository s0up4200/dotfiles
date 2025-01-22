#!/bin/bash

echo "Setting up vim configuration..."

# create required directories
mkdir -p ~/.vim/colors

# clone catppuccin theme
git clone https://github.com/catppuccin/vim.git /tmp/catppuccin-vim

# copy color files
cp /tmp/catppuccin-vim/colors/* ~/.vim/colors/

# cleanup downloaded repo
rm -rf /tmp/catppuccin-vim

# create vimrc if it doesn't exist
cat > ~/.vimrc << 'EOL'
" enable syntax highlighting
syntax on

" set color scheme
colorscheme catppuccin_mocha

" show line numbers
set number

" enable mouse support
set mouse=a

" set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" enable auto-indentation
set autoindent
set smartindent

" highlight current line
set cursorline

" show matching brackets
set showmatch

" enable incremental search
set incsearch
set hlsearch

" always show status line
set laststatus=2

" enable file type detection
filetype plugin indent on
EOL

echo "Vim configuration complete!" 