#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")/.." && pwd )"
BREW_CMD="/usr/local/bin/brew"

cd ~
echo "Linking items from $DIR to home directory using $(which ln)"

# If we are using GNU ln (from coreutils) the options are different.
ln --version > /dev/null
if [ $? -eq 0 ]; then
  ln_command="ln -ns"
else
  ln_command="ln -hs"
fi

# Then, symlink all dotfiles into the home directory.
for filepath in `find "$DIR" ! -path "*.git*" -name "*.symlink"`; do
  filename=$(basename "${filepath%.*}")
  echo -n "Linking $filename..."

  $ln_command "$filepath" ".$filename"

  if [ $? -eq 0 ]; then echo "done"; fi
done

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
cd ~/.zsh
git clone https://github.com/tarjoilija/zgen.git zgen
cd -

# Install vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Install composer packages.
which composer && cd .composer && composer --dev install && cd -;

# Finally, go back to where the user started.
cd "$WD"
exit 0
