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
ln -sf ~/.dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# set up p10k configuration using the existing file
ln -sf ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh

# update .zshrc to use powerlevel10k
sed -i.bak 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# add p10k configuration source to .zshrc if not already present
if ! grep -q "source ~/.p10k.zsh" ~/.zshrc; then
    echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc
fi

echo "Shell configuration complete!" 