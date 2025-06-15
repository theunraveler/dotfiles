#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")" > /dev/null && pwd )"
BREW_DIR='/opt/homebrew'

# Install homebrew if we need to.
printf 'Installing homebrew...'
if [ -f "$BREW_DIR/bin/brew" ]; then
  echo 'already installed, skipped.'
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
  echo 'done.'
fi

# Install homebrew packages.
printf 'Installing homebrew packages...'
"$BREW_DIR/bin/brew" bundle install --upgrade --file="$DIR/Brewfile" > /dev/null
echo 'done.'

# Symlink everything.
printf 'Linking items from %s to %s...' "$DIR" "$HOME"
find "$DIR" -type d \( ! -regex '.*/\..*' \) -depth 1 | sed 's!.*/!!' | xargs stow --dir="$DIR" --target="$HOME" --restow
echo 'done.'

# fzf
printf 'Installing fzf...'
"$BREW_DIR"/opt/fzf/install --no-bash --no-zsh --all > /dev/null
echo 'done.'

# Install vim plugins
printf 'Installing vim plugins...'
if [ ! -d ~/.local/share/vim/pack/packager/opt/vim-packager ]; then
  git clone https://github.com/kristijanhusak/vim-packager ~/.local/share/vim/pack/packager/opt/vim-packager
fi
mvim -f -c "call packager#install({'on_finish': 'quitall'})"
echo 'done.'

# Finally, go back to where we started.
cd "$WD" > /dev/null || exit 1
exit 0
