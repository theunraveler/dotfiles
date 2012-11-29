#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$(dirname "$0")/.." && pwd )"

# First, initialize git submodules.
git submodule init; git submodule update;

cd ~;
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

# Finally, go back to where the user started.
cd $WD
exit 0
