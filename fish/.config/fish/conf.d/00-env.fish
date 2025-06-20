set --export CLICOLOR 1

# Initialize homebrew paths
eval (/opt/homebrew/bin/brew shellenv)

set --export PATH ~/.bin $PATH

# Default programs
set --export BROWSER open
set --export EDITOR mvim -f
set --export MARKDOWN cmark

# Homebrew
set --export HOMEBREW_NO_ANALYTICS 1
set --export HOMEBREW_NO_AUTO_UPDATE 1

# Python.
set --export PIP_REQUIRE_VIRTUALENV true
set --export PYTHONDONTWRITEBYTECODE 1
set --export PIPENV_VENV_IN_PROJECT 1
set --export PIPENV_VERBOSITY -1
set --export POETRY_VIRTUALENVS_IN_PROJECT true
set --export VIRTUALENV_DIR_NAME .venv
__activate_venv

# grep
set --export GREP_COLOR '37;45'           # BSD.
set --export GREP_COLORS mt=$GREP_COLOR   # GNU.

# man
set --export MANPAGER "sh -c 'col -bx | bat --language=man --plain'"
# Fish shell does weird stuff with $MANPATH. This allows us to add to it in a
# normal way that won't break `man` defaults.
# See https://github.com/fish-shell/fish-shell/issues/2090#issuecomment-421833616.
set --query MANPATH || set MANPATH ''

# GNU utils.
# Reference GNU utils instead of built-in ones.
set _ignored [ man test
for d in $HOMEBREW_PREFIX/opt/*/libexec/gnubin/*
  set p (basename $d)
  contains $p $_ignored || alias $p g$p
end
# Add misc GNU utils man pages.
for d in $HOMEBREW_PREFIX/opt/*/libexec/gnuman
  set --export MANPATH $MANPATH $d
end

# fzf
set --export FZF_DEFAULT_COMMAND rg --files --follow --hidden --glob=!.git

# watchman
set --export WATCHMAN_CONFIG_FILE $HOME/.watchman.json

# eza
set --export EZA_ICON_SPACING 2
set --export EZA_DEFAULT_OPTIONS --icons --header

# mise
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

# Enable TouchID for sudoing. This gets erased whenever there is an OS update,
# so we'll add it back if it's missing.
if ! /usr/bin/grep -q pam_tid.so /etc/pam.d/sudo
  echo 'TouchID for sudo missing, adding it to /etc/pam.d/sudo'
  awk '/sudo_local/ { print; print "auth       sufficient     pam_tid.so             # enables TouchID auth for sudo"; next }1' /etc/pam.d/sudo | sudo tee /etc/pam.d/sudo >/dev/null
end
