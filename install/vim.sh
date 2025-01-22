#!/bin/bash

echo "Setting up vim configuration..."

# ensure vim is installed
if ! command -v vim &> /dev/null; then
    echo "Installing vim..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install vim
    else
        sudo apt-get update && sudo apt-get install -y vim
    fi
fi

# create required directories
mkdir -p ~/.vim/colors ~/.vim/plugged

# install vim-plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# create vimrc if it doesn't exist
cat > ~/.vimrc << 'EOL'
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()
EOL

# Install plugins
echo "Installing vim plugins..."
vim +PlugInstall +qall

echo "Vim configuration complete!" 