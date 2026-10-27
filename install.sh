#!/usr/bin/env bash
# Symlink the dotfiles into $HOME. Safe to re-run: links that are already
# correct are skipped, and anything else in the way is moved to a backup folder.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

FILES=(.zshrc .zprofile .vimrc .tigrc)

for file in "${FILES[@]}"; do
  src="$DOTFILES/$file"
  dest="$HOME/$file"

  if [ "$(readlink "$dest" 2>/dev/null)" = "$src" ]; then
    echo "ok       $dest"
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/"
    echo "backup   $dest -> $BACKUP/$file"
  fi

  ln -s "$src" "$dest"
  echo "linked   $dest -> $src"
done
