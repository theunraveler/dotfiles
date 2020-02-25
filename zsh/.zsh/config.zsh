export CLICOLOR=1

# Initialize homebrew paths
eval "$(brew shellenv)"

# Initialize run path
typeset -U path
path=($HOME/.bin $path)
fpath=($HOME/.zsh/functions $fpath)

# Set up our zplug plugins.
#
# It's important that this go after the path stuff above.
[ -f "$HOME/.zsh/zplug.zsh" ] && source "$HOME/.zsh/zplug.zsh"

# Default programs
export BROWSER="open"
export EDITOR="mvim -f"
export MARKDOWN="cmark"

# History.
export HISTIGNORE="&:ls:l:ll:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
setopt HIST_REDUCE_BLANKS

# Homebrew
HOMEBREW_NO_ANALYTICS=1

# ChefDK.
path=(/opt/chefdk/bin $path)

# Go.
export GO15VENDOREXPERIMENT=1
export GOPATH="$HOMEBREW_PREFIX/share/go"
path=($path "$GOPATH/bin")

# Python.
export PIP_REQUIRE_VIRTUALENV=true
export PIP_CONFIG_FILE="$HOME/.pip.conf"
export PYTHONDONTWRITEBYTECODE=1

# grep
export GREP_COLOR='37;45'           # BSD.
export GREP_COLORS="mt=$GREP_COLOR" # GNU.

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Adding misc GNU utils man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  export MANPATH="$HOMEBREW_PREFIX/opt/$UTIL/libexec/gnuman:$MANPATH"
done

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# ag tagging.
# https://github.com/aykamko/tag#installation
if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi

# fzf
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# Add SSH keys from keychain.
# http://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots
ssh-add -A &> /dev/null

# direnv
eval "$(direnv hook zsh)"

# asdf
. $HOMEBREW_PREFIX/opt/asdf/asdf.sh

setopt -o extended_glob

eval "$(starship init zsh)"

# Put an hr between each command.
precmd() { tput setaf 7 && hr '-' && tput sgr0 }

# Source out to local config file.
[ -f "$HOME/.zshrc.local.zsh" ] && source "$HOME/.zshrc.local.zsh"
