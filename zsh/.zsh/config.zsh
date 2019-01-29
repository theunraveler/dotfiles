export BREWPATH="/usr/local"
export CLICOLOR=1

# Initialize run path
typeset -U path
path=($HOME/.bin $BREWPATH/bin $BREWPATH/sbin /usr/X11/bin $path)
fpath=($HOME/.zsh/functions $fpath)

# We need to add this manually before adding the prezto `utility` module so
# that dircolors get set properly when we're using GNU ls.
alias dircolors="$BREWPATH/bin/gdircolors"

# Set up our zplug plugins.
#
# It's important that this go after the path stuff above.
[[ -r "$HOME/.zsh/zplug.zsh" ]] && source $HOME/.zsh/zplug.zsh

# Default programs
export BROWSER="open"
export EDITOR="mvim -f"
export MARKDOWN="cmark"

# History.
export HISTIGNORE="&:ls:l:ll:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
setopt HIST_REDUCE_BLANKS

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

# Fastlane.
path=($HOME/.fastlane/bin $path)

# Adding misc GNU utils man pages.
for UTIL in "coreutils" "gnu-sed" "gnu-tar"; do
  export MANPATH="$BREWPATH/opt/$UTIL/libexec/gnuman:$MANPATH"
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

# Add SSH keys from keychain.
# http://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots
ssh-add -A &> /dev/null

# direnv
eval "$(direnv hook zsh)"

# asdf
. $BREWPATH/opt/asdf/asdf.sh

# Source out to local config file.
if [[ -f $HOME/.zshrc.local.zsh ]]; then
  source $HOME/.zshrc.local.zsh
fi
