#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")" > /dev/null && pwd )"
BREW_DIR="/opt/homebrew"

# Install homebrew if we need to.
if [ -f "$BREW_DIR/bin/homebrew" ]; then
  echo "Homebrew already installed"
else
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install homebrew packages.
printf "Installing homebrew packages..."
"$BREW_DIR/bin/homebrew" tap homebrew/bundle > /dev/null
"$BREW_DIR/bin/homebrew" bundle --file="$DIR/Brewfile" --no-lock > /dev/null
echo "done."

# Symlink everything.
printf 'Linking items from %s to home directory...' "$DIR"
find "$DIR" -type d \( ! -regex '.*/\..*' \) -depth 1 | sed 's!.*/!!' | xargs stow --dir="$DIR" --target="$HOME" --restow
echo "done."

# fzf
"$BREW_DIR"/opt/fzf/install --no-bash --no-zsh --all

# Finally, go back to where we started.
cd "$WD" > /dev/null || exit 1
exit 0
