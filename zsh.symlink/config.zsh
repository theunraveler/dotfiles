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

# Rubies from ruby-build
for dir in $(brew --prefix)/var/ruby-build/*; do
  if [[ -d $dir ]]; then
    RUBIES+=$dir
  fi
done

# Source out to local config file
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
