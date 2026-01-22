#!/usr/bin/env bash

DEPENDECIES=(curl git tar tree-sitter unzip npm python3-envs fzf rg fd yazi)

REQ_NVIM_VERSION='0.12'

ROOT_DIR="$HOME/.nvim_nightly"
NVIM_DEPENDENCY_DIR="$ROOT_DIR/bin"
NVIM_TAR_DIR="$ROOT_DIR/tar"
NVIM_LOCATION="$ROOT_DIR/nvim-linux-x86_64/bin"
FONTS_DIR="$HOME/.local/share/fonts"

check_pkg() {
    if which "$1" 1> /dev/null 2>&1; then
        installed=true
    else
        installed=false
    fi
}
print_check_pkg() {
    check_pkg "$1"
    sleep 0.1 # fancy code is running
    if [[ $installed = false ]]; then
        echo "✗ $1 not installed"
    else
        echo "✓ $1 good"
    fi
}

check_nvim_version() {
    if [[ ! "$(nvim --version 2> /dev/null)" =~ $REQ_NVIM_VERSION ]]; then
        echo "nvim version not $REQ_NVIM_VERSION"
        echo "try to run this script with the --install-nvim parameter"
        exit
    else
        echo "✓ nvim version $REQ_NVIM_VERSION found"
    fi
}

install_nvim () {
    mkdir -p "$ROOT_DIR"
    mkdir -p "$NVIM_TAR_DIR"
    cd "$NVIM_TAR_DIR" || exit
    curl -s -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
    rm -rf "$ROOT_DIR/nvim-linux-x86_64"
    tar -C "$ROOT_DIR" -xzf nvim-linux-x86_64.tar.gz

    if [[ $("$NVIM_LOCATION/nvim" --version) =~ $REQ_NVIM_VERSION ]]; then
        echo "nvim version $REQ_NVIM_VERSION installed"
    fi
    if [[ ! $PATH =~ $NVIM_LOCATION ]]; then
        echo "add $NVIM_LOCATION to your PATH"
    fi
}

check_path(){
    if [[ ! $PATH =~ $NVIM_DEPENDENCY_DIR ]]; then
        echo "add $NVIM_DEPENDENCY_DIR to your PATH"
    fi
}


if [[ $1 = --install-nvim ]]; then
    install_nvim
    exit
fi

# neovim is checked by itself
check_nvim_version

# check all others pkgs
for pkg in "${DEPENDECIES[@]}"; do
    print_check_pkg "$pkg"
done
