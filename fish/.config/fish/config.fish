set --export CLICOLOR 1
set fish_greeting

# Initialize homebrew paths
eval (brew shellenv)

# Initialize run path
set --export PATH $HOME/.bin $PATH

# Default programs
set --export BROWSER 'open'
set --export EDITOR 'mvim -f'
set --export MARKDOWN 'cmark'

# Homebrew
set --export HOMEBREW_NO_ANALYTICS 1

# Python.
set --export PIP_REQUIRE_VIRTUALENV true
set --export PIP_CONFIG_FILE "$HOME/.pip.conf"
set --export PYTHONDONTWRITEBYTECODE 1
set --export PIPENV_VENV_IN_PROJECT 1

# grep
set --export GREP_COLOR '37;45'           # BSD.
set --export GREP_COLORS "mt=$GREP_COLOR" # GNU.

# man
set --export MANPAGER "sh -c 'col -bx | bat -l man -p'"

# GNU utils.
# Reference GNU utils instead of built-in ones.
set _ignored '[' 'test'
for d in $HOMEBREW_PREFIX/opt/*/libexec/gnubin/*
  set p (basename $d)
  if contains $p $_ignored
    continue
  end
  alias $p g$p
end
# Add misc GNU utils man pages.
for d in $HOMEBREW_PREFIX/opt/*/libexec/gnuman
  set --export MANPATH $d $MANPATH
end

# fzf
set --export FZF_DEFAULT_COMMAND 'rg --files --follow --hidden'

# Add SSH keys from keychain.
# http://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots
ssh-add -A &> /dev/null

# direnv
eval (direnv hook fish)

# asdf
source $HOMEBREW_PREFIX/opt/asdf/asdf.fish

eval (starship init fish)

# Source out to local config file.
[ -f "$HOME/.local/share/fish/local.fish" ] && source "$HOME/.local/share/fish/local.fish"

source $HOME/.config/fish/aliases.fish
