#!/usr/bin/env bash

REQ_NVIM_VERSION='0.12'
NVIM_INSTALL_DIR="$HOME/.nvim_nightly"
NVIM_LOCATION="$NVIM_INSTALL_DIR/nvim-linux-x86_64/bin"

check_version() {
    if [[ ! "$(nvim --version)" =~ $REQ_NVIM_VERSION ]]; then
        echo "nvim version not $REQ_NVIM_VERSION"
        echo "try to run this script with the --install-nvim parameter"
        exit
    else
        echo "✓ nvim good"
    fi
}

check_shell() {
    IFS='/' read -r -a SHELL_ARRAY <<< "$SHELL"
    SHELL_USED="${SHELL_ARRAY[-1]}"
}

check_pkg() {
    if ! which "$1" 2> /dev/null 1>&2; then
        echo "✗ $1 not installed"
    else
        sleep 0.1 # fancy code is running
        echo "✓ $1 good"
    fi
}

if [[ $1 = --install-nvim ]]; then
    mkdir -p "$NVIM_INSTALL_DIR"
    cd "$NVIM_INSTALL_DIR" || exit
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
    rm -rf "$NVIM_INSTALL_DIR/nvim-linux-x86_64"
    tar -C "$NVIM_INSTALL_DIR" -xzf nvim-linux-x86_64.tar.gz

    if [[ ! $PATH =~ $NVIM_LOCATION ]]; then
        check_shell
        if [[ $SHELL_USED = zsh ]]; then
            echo "add $NVIM_LOCATION to your PATH"
            path
        fi
    fi
fi

check_version

check_pkg git
check_pkg curl
check_pkg unzip
check_pkg tar
check_pkg fzf
check_pkg rg
check_pkg fd
check_pkg tree-sitter
