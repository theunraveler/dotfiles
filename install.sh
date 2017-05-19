#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")/.." && pwd )"
BREW_CMD="/usr/local/bin/brew"

cd ~ || exit 1
echo "Linking items from $DIR to home directory using $(which ln)"

# If we are using GNU ln (from coreutils) the options are different.
if ln --version > /dev/null; then
  ln_command="ln -ns"
else
  ln_command="ln -hs"
fi

# Then, symlink all dotfiles into the home directory.
while IFS= read -r -d '' filepath; do
  filename=$(basename "${filepath%.*}")
  echo -n "Linking $filename..."

  if $ln_command "$filepath" ".$filename"; then echo "done"; fi
done <   <(find "$DIR" ! -path '*.git*' -name '*.symlink' -print0)

# Install homebrew if we need to.
if [ ! -f $BREW_CMD ]; then
  echo -n "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Checking homebrew packages..."
brew tap homebrew/bundle
brew bundle --global
echo "done."

# Install zgen.
cd ~/.zsh || exit 1
git clone https://github.com/tarjoilija/zgen.git zgen
cd - || exit 1

# Install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Install composer packages.
if which composer > /dev/null; then
  cd .composer || exit 1
  composer --dev install
  cd - || exit 1
fi

# Finally, go back to where the user started.
cd "$WD" || exit 1
exit 0
