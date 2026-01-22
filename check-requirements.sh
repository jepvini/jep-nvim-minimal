#!/usr/bin/env bash

DEPENDECIES=(
    curl
    fd
    fzf
    git
    npm
    rg
    tar
    tree-sitter
    unzip
    yazi
)

PY_MODULES=(
    python3-venv
)

REQ_NVIM_VERSION='0.12'

ROOT_DIR="$HOME/.nvim_nightly"
NVIM_TAR_DIR="$ROOT_DIR/tar"
NVIM_LOCATION="$ROOT_DIR/nvim-linux-x86_64/bin"


check_pkg() {
    sleep 0.1 # fancy code is running
    if which "$1" 1> /dev/null; then
        echo "✓ $1 installed"
    else
        echo "✗ $1 not installed"
    fi
}
check_module() {
    sleep 0.1 # fancy code is running
    if [[ -d /usr/share/doc/$1 ]]; then
        echo "✓ $1 installed"
    else
        echo "✗ $1 not installed"
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

if [[ $1 = --install-nvim ]]; then
    install_nvim
    exit
fi

# neovim is checked by itself
check_nvim_version

# check all others pkgs
for pkg in "${DEPENDECIES[@]}"; do
    check_pkg "$pkg"
done
for module in "${PY_MODULES[@]}"; do
    check_module "$module"
done
