#!/bin/bash

# Only install Go on Linux, macOS uses Homebrew
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Installing Go..."

    # detect architecture
    ARCH=$(uname -m)
    case $ARCH in
        x86_64)
            ARCH_GO="amd64"
            ;;
        aarch64|arm64)
            ARCH_GO="arm64"
            ;;
        *)
            echo "Unsupported architecture: $ARCH"
            exit 1
            ;;
    esac

    # get latest version
    GO_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)

    # download and install go
    echo "Downloading ${GO_VERSION}..."
    curl -Lo go.tar.gz "https://go.dev/dl/${GO_VERSION}.linux-${ARCH_GO}.tar.gz"

    # remove old go installation if it exists
    sudo rm -rf /usr/local/go

    # extract to /usr/local
    sudo tar -C /usr/local -xzf go.tar.gz
    rm go.tar.gz

    # add go to path if not already there
    if ! grep -q "export PATH=\$PATH:/usr/local/go/bin" ~/.zshrc; then
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
    fi
fi

# create go workspace directory if it doesn't exist (for both OS)
mkdir -p ~/go/{bin,pkg,src}
if ! grep -q "export GOPATH=\$HOME/go" ~/.zshrc; then
    echo 'export GOPATH=$HOME/go' >> ~/.zshrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
fi

echo "Go installation complete! Please restart your terminal or run: source ~/.zshrc" 