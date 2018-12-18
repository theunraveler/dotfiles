#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")" > /dev/null && pwd )"
BREW_CMD="/usr/local/bin/brew"

# Install homebrew if we need to.
if [ ! -f $BREW_CMD ]; then
  echo -n "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Install GNU stow if we need to.
if ! [ -x "$(command -v stow)" ]; then
  echo -n "Installing stow..."
  $BREW_CMD install stow
fi

# Symlink everything.
printf 'Linking items from %s to home directory...' "$DIR"
find "$DIR" -type d \( ! -regex '.*/\..*' \) -depth 1 | sed 's!.*/!!' | xargs stow --dir="$DIR" --target="$HOME" --restow
echo "done."

printf "Checking homebrew packages..."
brew tap homebrew/bundle
brew bundle --global > /dev/null
echo "done."

# Install vim plugins
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +PlugInstall +qall

# Install pipsi and packages
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python - --src 'git+https://github.com/mitsuhiko/pipsi.git#egg=pipsi'
while read -r pkg; do
  pipsi install "$pkg"
done < ~/.pipsirc

# Finally, go back to where the user started.
cd "$WD" > /dev/null || exit 1
exit 0
