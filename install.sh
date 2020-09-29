#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")" > /dev/null && pwd )"
BREW_CMD="/usr/local/bin/brew"

# Install homebrew if we need to.
if [ ! -f $BREW_CMD ]; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
  echo "Homebrew already installed"
fi

# Install homebrew packages.
printf "Installing homebrew packages..."
"$BREW_CMD" tap homebrew/bundle > /dev/null
"$BREW_CMD" bundle --file="$DIR/brew/.Brewfile" --no-lock > /dev/null
echo "done."

# Symlink everything.
printf 'Linking items from %s to home directory...' "$DIR"
find "$DIR" -type d \( ! -regex '.*/\..*' \) -depth 1 | sed 's!.*/!!' | xargs stow --dir="$DIR" --target="$HOME" --restow
echo "done."

# fzf
/usr/local/opt/fzf/install --no-bash --no-zsh --all

# Install vim plugins
if [ ! -d ~/.vim/pack/packager ]; then
  git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager
fi
vim -f -c "call PackagerInit() | call packager#install({'on_finish': ':w! >>/dev/tty | quitall'})"

# Finally, go back to where the user started.
cd "$WD" > /dev/null || exit 1
exit 0
