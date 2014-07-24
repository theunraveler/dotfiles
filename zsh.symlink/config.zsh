# Initialize run path
typeset -U path
path=($HOME/.bin /usr/local/bin /usr/local/sbin /usr/X11/bin /usr/bin /bin /usr/sbin /sbin $path)

# Adding coreutils execs and man pages.
COREUTILS="$(brew --prefix coreutils)"
path=($COREUTILS/libexec/gnubin $path)
export MANPATH="$COREUTILS/libexec/gnuman:$MANPATH"

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
