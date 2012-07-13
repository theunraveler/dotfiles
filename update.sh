#!/usr/bin/env sh

# Store the current directory and switch to the project root.
DIR=$(pwd)
cd $(dirname "$0")

# First, update zsh.
cd zsh/zsh
git pull upstream master
git push origin master

# Next, update all git submodules.
cd ../..
git submodule foreach git pull

# Finally, commit the results.
git status --porcelain | grep '^ M' | awk '{print $2}' | xargs git add
if [ -n "$(git status --porcelain | grep '^M')" ]; then
  git ci -m "Updating submodules."
fi

cd $DIR
