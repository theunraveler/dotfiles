#!/usr/bin/env bash

WD="$(pwd)"
DIR="$( cd "$( dirname "$0" )" && pwd )"

# First, initialize git submodules.
git submodule init; git submodule update;

# Then, symlink all dotfiles into the home directory.
cd ~;
echo "Linking items from $DIR to home directory"

<<<<<<< HEAD
for filepath in `find "$DIR" ! -path "*.git*" -name "*.symlink"`; do
  filename=$(basename "${filepath%.*}")
  echo -n "Linking $filename..."
  ln -s "$filepath" "./.$filename"

  if [ $? -eq 0 ]; then
=======
for filepath in `find "$DIR" -name "*.symlink"`; do
  filename=$(basename "${filepath%.*}")
  echo -n "Linking $filename..."
  err=$(ln -s $filepath .$filename 2>&1)

  if [ $? -ne 0 ]; then
    echo "$err"
  else
>>>>>>> 1134fbc8e323927d0f6dfbb8d3842d41993fe745
    echo "done"
  fi
done

# Finally, go back to where the user started.
cd $WD
exit 0
