#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")/.." && pwd )"
BREW_CMD="/usr/local/bin/brew"

# First, initialize git submodules.
git submodule init; git submodule update;

mkdir vim.symlink/bundle
cd vim.symlink/bundle
git clone https://github.com/gmarik/vundle.git vundle
cd -

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

# Install vim bundles
vim +BundleInstall +qall

# Install homebrew if we need to.
if [ ! -f $BREW_CMD ]; then
  echo -n "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Checking homebrew packages..."
for brew in `cat ~/.brew`; do
  $BREW_CMD list $brew &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Installing $brew..."
    $BREW_CMD install $brew
  fi
done
echo "done."

# Finally, go back to where the user started.
cd $WD
exit 0
