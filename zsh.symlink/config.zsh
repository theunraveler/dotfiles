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

# Ruby.
for dir in $BREWPATH/var/ruby-build/*; do
  if [[ -d $dir ]]; then
    RUBIES+=$dir
  fi
done
[[ -r "$HOME/.zsh/rb-binstubs.zsh" ]] && source $HOME/.zsh/rb-binstubs.zsh

# hub.
if which hub > /dev/null; then eval "$(hub alias -s)"; fi

# ChefDK.
path=(/opt/chefdk/bin $path)

# Go.
export GO15VENDOREXPERIMENT=1
export GOPATH="$BREWPATH/share/go"
path=($path $GOPATH/bin)

# Python.
export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE="$HOME/.pip.conf"
export PYTHONDONTWRITEBYTECODE=1
export PYENV_ROOT="$BREWPATH/var/python"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Adding misc GNU utils man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  export MANPATH="$BREWPATH/opt/$UTIL/libexec/gnuman:$MANPATH"
done

# zsh-autoenv
AUTOENV_AUTH_FILE="$HOME/.autoenv_auth"
AUTOENV_FILE_ENTER=".env_up"
AUTOENV_FILE_LEAVE=".env_down"
AUTOENV_LOOK_UPWARDS=0

# ag tagging.
# https://github.com/aykamko/tag#installation
if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi

# Command not found.
if brew command command-not-found-init > /dev/null; then eval "$(brew command-not-found-init)"; fi

# Source out to local config file.
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
