# Initialize run path
typeset -U path
path=($HOME/.bin /usr/local/bin /usr/local/sbin /usr/X11/bin $path)

# Adding misc GNU utils execs and man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  PREFIX="$(brew --prefix $UTIL)"
  path=($PREFIX/libexec/gnubin $path)
  export MANPATH="$PREFIX/libexec/gnuman:$MANPATH"
done

# Default programs
export BROWSER="open"
export EDITOR="mvim -f"

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

# rbenv.
export RBENV_ROOT=/usr/local/var/rbenv
path=($RBENV_ROOT/bin $path)
eval "$(rbenv init - zsh)"

# hub.
if [ `which hub` ]; then
  eval "$(hub alias -s)"
fi

# ChefDK.
path=(/opt/chefdk/bin $path)

# Go config.
export GOPATH="$(brew --prefix)/Cellar/go/"
path=($path $GOPATH/bin)

# Source out to local config file
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
