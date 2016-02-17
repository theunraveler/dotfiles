export BREWPATH="/usr/local"
export CLICOLOR=1

# For some reason, we need to add this manually before adding the prezto
# `utility` module so that dircolors get set properly when we're using GNU ls.
alias dircolors="$BREWPATH/bin/gdircolors"

# Initialize run path
typeset -U path
path=($HOME/.bin $BREWPATH/bin $BREWPATH/sbin /usr/X11/bin $path)
fpath=($HOME/.zsh/functions $fpath)

# Set up our zgen plugins.
#
# It's important that this go after the $fpath setting above.
[[ -r "$HOME/.zsh/zgen.zsh" ]] && source $HOME/.zsh/zgen.zsh

# Default programs
export BROWSER="open"
export EDITOR="mvim -f"
export MARKDOWN="cmark"

# History.
export HISTIGNORE="&:ls:l:ll:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
setopt HIST_REDUCE_BLANKS

# Rubies from ruby-build
for dir in $BREWPATH/var/ruby-build/*; do
  if [[ -d $dir ]]; then
    RUBIES+=$dir
  fi
done

# hub.
if [ `which hub` ]; then
  eval "$(hub alias -s)"
fi

# ChefDK.
path=(/opt/chefdk/bin $path)

# Go.
export GO15VENDOREXPERIMENT=1
export GOPATH="$BREWPATH/share/go/"
path=($path $GOPATH/bin)

# Python.
export PIP_REQUIRE_VIRTUALENV=true

# Adding misc GNU utils man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  export MANPATH="$BREWPATH/opt/$UTIL/libexec/gnuman:$MANPATH"
done

[[ -r "$HOME/.zsh/rb-binstubs.zsh" ]] && source $HOME/.zsh/rb-binstubs.zsh

# Source out to local config file.
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
