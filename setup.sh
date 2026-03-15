#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES=(.tmux.conf .wezterm.lua .zshrc)

for file in "${DOTFILES[@]}"; do
    target="$SCRIPT_DIR/$file"
    link="$HOME/$file"

    if [ ! -f "$target" ]; then
        echo "SKIP: $target does not exist"
        continue
    fi

    if [ -L "$link" ]; then
        echo "OK:   $link already a symlink -> $(readlink "$link")"
    elif [ -e "$link" ]; then
        mv "$link" "$link.bak"
        ln -s "$target" "$link"
        echo "LINK: $link -> $target (existing file backed up to $link.bak)"
    else
        ln -s "$target" "$link"
        echo "LINK: $link -> $target"
    fi
done
