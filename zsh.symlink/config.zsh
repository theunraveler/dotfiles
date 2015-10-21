export BREWPATH="/usr/local"

# Initialize run path
typeset -U path
path=($HOME/.bin $BREWPATH/bin $BREWPATH/sbin /usr/X11/bin $path)

# Adding misc GNU utils execs and man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  PREFIX="$BREWPATH/opt/$UTIL"
  path=($PREFIX/libexec/gnubin $path)
  export MANPATH="$PREFIX/libexec/gnuman:$MANPATH"
done

# Default programs
export BROWSER="open"
export EDITOR="mvim -f"
export MARKDOWN="cmark"

# Setting commands to ignore
export HISTIGNORE="&:ls:l:ll:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Directory colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

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

# Go config.
export GO15VENDOREXPERIMENT=1
export GOPATH="$BREWPATH/share/go/"
path=($path $GOPATH/bin)

# Source out to local config file
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
