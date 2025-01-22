#!/bin/bash

# install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install powerlevel10k if not already installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# create custom directory if it doesn't exist
mkdir -p ~/.oh-my-zsh/custom

# link our custom zsh configuration
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# update .zshrc to use powerlevel10k
sed -i.bak 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "Shell configuration complete! Run 'source ~/.zshrc' to configure p10k." 