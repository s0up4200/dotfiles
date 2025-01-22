#!/bin/bash

echo "Installing Linux packages..."

# create bin directory in home if it doesn't exist
mkdir -p ~/bin
PATH="$HOME/bin:$PATH"

# detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        ARCH_DEB="amd64"
        ARCH_NAME="x86_64"
        ;;
    aarch64|arm64)
        ARCH_DEB="arm64"
        ARCH_NAME="aarch64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# install basic utilities
echo "Installing basic utilities..."
sudo apt-get update
sudo apt-get install -y zsh wget

# make zsh the default shell
if [[ $SHELL != "/usr/bin/zsh" ]]; then
    chsh -s $(which zsh)
    echo "Changed default shell to zsh. You may need to log out and back in for this to take effect."
fi

# install node using nvm
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    # Download and install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    
    # Load nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # Install Node.js 22
    nvm install 22
    
    # Enable corepack and pnpm
    corepack enable pnpm
    
    echo "Verifying installations..."
    node -v
    nvm current
    pnpm -v
fi

# install bat
if ! command -v bat &> /dev/null; then
    echo "Installing bat..."
    BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo bat.deb "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_${ARCH_DEB}.deb"
    sudo dpkg -i bat.deb
    rm bat.deb
fi

# install eza (modern replacement for ls)
if ! command -v eza &> /dev/null; then
    echo "Installing eza..."
    EZA_VERSION=$(curl -s "https://api.github.com/repos/eza-community/eza/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo eza.tar.gz "https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/eza_${ARCH_NAME}-unknown-linux-gnu.tar.gz"
    tar xf eza.tar.gz
    mv eza ~/bin/
    rm eza.tar.gz
fi

# install tmux if not present
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    sudo apt-get update
    sudo apt-get install -y tmux
fi

# install git if not present
if ! command -v git &> /dev/null; then
    echo "Installing git..."
    sudo apt-get update
    sudo apt-get install -y git
fi

# install aichat from github
if ! command -v aichat &> /dev/null; then
    echo "Installing aichat..."
    AICHAT_VERSION=$(curl -s "https://api.github.com/repos/sigoden/aichat/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo aichat.tar.gz "https://github.com/sigoden/aichat/releases/download/v${AICHAT_VERSION}/aichat-v${AICHAT_VERSION}-${ARCH_NAME}-unknown-linux-musl.tar.gz"
    tar xf aichat.tar.gz
    mv aichat ~/bin/
    rm aichat.tar.gz
fi

echo "Linux package installation complete!" 