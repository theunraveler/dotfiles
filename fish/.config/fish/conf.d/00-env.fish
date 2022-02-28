set --export CLICOLOR 1

# Initialize homebrew paths
eval (/opt/homebrew/bin/brew shellenv)

set --export PATH ~/.bin $PATH

# Default programs
set --export BROWSER 'open'
set --export EDITOR 'vi'
set --export MARKDOWN 'cmark'

# Homebrew
set --export HOMEBREW_NO_ANALYTICS 1

# Python.
set --export PIP_REQUIRE_VIRTUALENV true
set --export PYTHONDONTWRITEBYTECODE 1
set --export PIPENV_VENV_IN_PROJECT 1
set --export POETRY_VIRTUALENVS_IN_PROJECT true

# ruby
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
set --export RUBY_CONFIGURE_OPTS --with-readline-dir="$HOMEBREW_PREFIX"/opt/readline --with-openssl-dir="$HOMEBREW_PREFIX"/opt/openssl@1.1

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
  contains $p $_ignored || alias $p g$p
end
# Add misc GNU utils man pages.
for d in $HOMEBREW_PREFIX/opt/*/libexec/gnuman
  set --export MANPATH $d $MANPATH
end

# fzf
set --export FZF_DEFAULT_COMMAND 'rg --files --follow --hidden --glob=!.git'

# direnv
direnv hook fish | source

# asdf
source $HOMEBREW_PREFIX/opt/asdf/asdf.fish
set --export ASDF_PYTHON_PATCHES_DIRECTORY "$HOME"/.asdf/patches/python

# Android dev
set --export ANDROID_SDK_ROOT "$HOME"/Library/Android/sdk

# exa
set --export EXA_ICON_SPACING 2
set --export EXA_DEFAULT_OPTIONS '--icons --header'
