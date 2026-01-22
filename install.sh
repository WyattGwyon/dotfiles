#!/usr/bin/env bash

set -e # exit on error

DOTFILES="$HOME/dotfiles"

declare -A FILES=(
    ["$DOTFILES/vim/.vimrc"]="$HOME/.vimrc"
    ["$DOTFILES/bash/.bashrc"]="$HOME/.bashrc"
    ["$DOTFILES/nvim/init.lua"]="$HOME/.config/nvim/init.lua"
    ["$DOTFILES/zsh/.zshrc"]="$HOME/.zshrc"
    ["$DOTFILES/github/.gitconfig"]="$HOME/.gitconfig"
)

backup() {
    local target="$1"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "target.bak"
        echo "Backed up $target -> $target.bak"
    fi
}

for src in "${!FILES[@]}"; do
    dest="${FILES[$src]}"

    mkdir -p "$(dirname "$dest")"
    backup "$dest"

    ln -sf "$src" "$dest"
    echo "Linked $dest -> $src"
done

echo "Dotfiles installed."
