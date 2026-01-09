#!/usr/bin/env bash

DEPENDECIES=(curl git tar tree-sitter unzip fzf rg fd yazi)

REQ_NVIM_VERSION='0.12'
REQ_FZF_VERSION='0.67.0'
REQ_RIPGREP_VERSION='15.1.0'
REQ_FD_VERSION='10.3.0'
REQ_YAZI_VERSION='26.1.4'

ROOT_DIR="$HOME/.nvim_nightly"
NVIM_DEPENDENCY_DIR="$ROOT_DIR/bin"
NVIM_TAR_DIR="$ROOT_DIR/tar"
NVIM_LOCATION="$ROOT_DIR/nvim-linux-x86_64/bin"

check_pkg() {
    if ! which "$1" 1> /dev/null 2>&1; then
        echo "✗ $1 not installed"
    else
        sleep 0.1 # fancy code is running
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

install_fzf () {
    mkdir -p "$ROOT_DIR"
    mkdir -p "$NVIM_TAR_DIR"
    mkdir -p "$NVIM_DEPENDENCY_DIR"
    cd "$NVIM_TAR_DIR" || exit
    curl -s -LO "https://github.com/junegunn/fzf/releases/download/v$REQ_FZF_VERSION/fzf-$REQ_FZF_VERSION-linux_amd64.tar.gz"
    rm -rf "$ROOT_DIR/fzf"
    tar -C "$NVIM_DEPENDENCY_DIR" -xzf "fzf-$REQ_FZF_VERSION-linux_amd64.tar.gz"
    echo "fzf installed"
}

install_ripgrep () {
    mkdir -p "$ROOT_DIR"
    mkdir -p "$NVIM_TAR_DIR"
    mkdir -p "$NVIM_DEPENDENCY_DIR"
    cd "$NVIM_TAR_DIR" || exit
    local name="ripgrep-$REQ_RIPGREP_VERSION-aarch64-unknown-linux-gnu"
    curl -s -LO "https://github.com/BurntSushi/ripgrep/releases/download/$REQ_RIPGREP_VERSION/$name.tar.gz"
    rm -rf "$name"
    tar -xzf "$name.tar.gz"
    mv "$name/rg" "$NVIM_DEPENDENCY_DIR"
    rm -r "$name"
    echo "ripgrep installed"
}

install_fd () {
    mkdir -p "$ROOT_DIR"
    mkdir -p "$NVIM_TAR_DIR"
    mkdir -p "$NVIM_DEPENDENCY_DIR"
    cd "$NVIM_TAR_DIR" || exit
    local name="fd-v$REQ_FD_VERSION-aarch64-unknown-linux-gnu"
    curl -s -LO "https://github.com/sharkdp/fd/releases/download/v$REQ_FD_VERSION/$name.tar.gz"
    rm -rf "$name"
    tar -xzf "$name.tar.gz"
    mv "$name/fd" "$NVIM_DEPENDENCY_DIR"
    rm -r "$name"
    echo "fd installed"
}

install_yazi () {
    mkdir -p "$ROOT_DIR"
    mkdir -p "$NVIM_TAR_DIR"
    mkdir -p "$NVIM_DEPENDENCY_DIR"
    cd "$NVIM_TAR_DIR" || exit
    local name="yazi-aarch64-unknown-linux-gnu"
    curl -s -LO "https://github.com/sxyazi/yazi/releases/download/v$REQ_YAZI_VERSION/$name.zip"
    rm -rf "$name"
    unzip "$name.zip" > /dev/null
    mv "$name/yazi" "$NVIM_DEPENDENCY_DIR"
    mv "$name/ya" "$NVIM_DEPENDENCY_DIR"
    rm -r "$name"
    echo "yazi installed"
}

if [[ $1 = --install-nvim ]]; then
    install_nvim
    exit
elif [[ $1 = --install-fzf ]]; then
    install_fzf
    check_path
    exit
elif [[ $1 = --install-ripgrep ]]; then
    install_ripgrep
    check_path
    exit
elif [[ $1 = --install-fd ]]; then
    install_fd
    check_path
    exit
elif [[ $1 = --install-yazi ]]; then
    install_yazi
    check_path
    exit
elif [[ $1 = --install-all ]]; then
    install_nvim
    install_fzf
    install_ripgrep
    install_fd
    install_yazi
    check_path
    exit
fi

# neovim is checked by itself
check_nvim_version

# check all others pkgs
for pkg in "${DEPENDECIES[@]}"; do
    check_pkg "$pkg"
done
