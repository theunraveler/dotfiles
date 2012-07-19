#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$( dirname "$0" )" && pwd )"

# First, initialize git submodules.
git submodule init; git submodule update;

# Then, symlink all dotfiles into the home directory.
cd ~;
echo "Linking items from $DIR to home directory"

for filepath in `find "$DIR" -name "*.symlink"`; do
  filename=$(basename "${filepath%.*}")
  echo -n "Linking $filename..."
  err=$(ln -s $filepath .$filename 2>&1)

  if [ $? -ne 0 ]; then
    echo "$err"
  else
    echo "done"
  fi
done

# Finally, go back to where the user started.
cd $WD
exit 0
