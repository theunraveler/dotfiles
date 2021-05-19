# XDG paths.
set --export XDG_CONFIG_HOME "$HOME"/.config
set --export XDG_CACHE_HOME "$HOME"/.cache
set --export XDG_DATA_HOME "$HOME"/.local/share
set --export XDG_BIN_HOME "$HOME"/.local/bin
set --export XDG_RUNTIME_DIR "$HOME"/.local/run

set --export CLICOLOR 1
set fish_greeting

# Initialize homebrew paths
eval (/opt/homebrew/bin/brew shellenv)

# Initialize run path
set --export PATH $XDG_BIN_HOME $PATH

# Default programs
set --export BROWSER 'open'
set --export EDITOR 'mvim -f'
set --export MARKDOWN 'cmark'

# less
set --export LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set --export LESSHISTFILE "$XDG_CACHE_HOME"/less/history

# Homebrew
set --export HOMEBREW_NO_ANALYTICS 1

# Python.
set --export PIP_REQUIRE_VIRTUALENV true
set --export PYTHONDONTWRITEBYTECODE 1
set --export PIPENV_VENV_IN_PROJECT 1

# ruby
set --export BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set --export BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set --export BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
set --export GEMRC "$XDG_CONFIG_HOME"/gem/gemrc
set --export GEM_HOME "$XDG_DATA_HOME"/gem
set --export GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set --export IRBRC "$XDG_CONFIG_HOME"/irb/irbrc
set --export RUBY_CONFIGURE_OPTS --with-openssl-dir="$HOMEBREW_PREFIX"/opt/openssl@1.1 # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment

# nodejs/npm
set --export NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set --export npm_config_devdir "$XDG_CACHE_HOME"/node/gyp

# grep
set --export GREP_COLOR '37;45'           # BSD.
set --export GREP_COLORS "mt=$GREP_COLOR" # GNU.

# ripgrep
set --export RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/config"

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
set --export FZF_DEFAULT_COMMAND 'rg --files --follow --hidden'

# Add SSH keys from keychain.
# http://apple.stackexchange.com/questions/254468/macos-sierra-doesn-t-seem-to-remember-ssh-keys-between-reboots
ssh-add -A &> /dev/null

# GPG
set --export GNUPGHOME "$XDG_DATA_HOME"/gnupg
set --export GPG_TTY (tty)
gpg-agent --daemon --options "$XDG_CONFIG_HOME"/gnupg/gpg-agent.conf 2>/dev/null

# direnv
direnv hook fish | source

# asdf
set --export ASDF_CONFIG_FILE "$XDG_CONFIG_HOME"/asdf/asdfrc
set --export ASDF_DATA_DIR "$XDG_DATA_HOME"/asdf
set --export ASDF_PYTHON_PATCHES_DIRECTORY "$XDG_DATA_HOME"/asdf/patches/python
source $HOMEBREW_PREFIX/opt/asdf/asdf.fish

# vim
set --export VIMINIT 'if !has("nvim") | source $XDG_CONFIG_HOME/vim/vimrc | endif'

# postgres
set --export PSQLRC "$XDG_CONFIG_HOME"/postgres/psqlrc
set --export PSQL_HISTORY "$XDG_CACHE_HOME"/postgres/history
set --export PGPASSFILE "$XDG_CONFIG_HOME"/postgres/pass
set --export PGSERVICEFILE "$XDG_CONFIG_HOME"/postgres/service.conf

# MySQL
set --export MYSQL_HISTFILE "$XDG_CACHE_HOME"/mysql/history

# Starship
eval (starship init fish)

# aspell
set --export ASPELL_CONF "per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_DATA_HOME/aspell/en.pws; repl $XDG_DATA_HOME/aspell/en.prepl"

# ansible
set --export ANSIBLE_CONFIG "$XDG_CONFIG_HOME"/ansible/ansible.cfg

# aws
set --export AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME"/aws/credentials
set --export AWS_CONFIG_FILE "$XDG_CONFIG_HOME"/aws/config

# Android dev
set --export ANDROID_SDK_ROOT "$HOME"/Library/Android/sdk

# wget
set --export WGETRC "$XDG_CONFIG_HOME/wgetrc"

# Source out to local config file.
[ -f "$HOME/.local/share/fish/local.fish" ] && source "$HOME/.local/share/fish/local.fish"

source $HOME/.config/fish/aliases.fish
