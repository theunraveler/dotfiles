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
set --export PATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin $PATH
set --export PATH $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin $PATH
set --export PATH $HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin $PATH
set --export PATH $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $PATH
# Add misc GNU utils man pages.
for util in $HOMEBREW_PREFIX/opt/*/libexec/gnuman
  set --export MANPATH $util $MANPATH
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

# Overrides
alias cat 'bat'
alias cp 'cp --recursive --verbose'
alias grep 'grep --color=auto --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=.venv --exclude=tags'
alias ls 'exa'
alias mkdir 'mkdir --parents --verbose'
alias mv 'mv --verbose'
alias rsync "rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync/exclude"
alias rm 'rm --recursive --verbose'
alias vi 'mvim'
alias vim 'mvim'

# Shorties
alias b 'brew'
alias be 'bundle exec'
alias d 'drush'
alias el 'elixir'
alias g 'git'
alias k 'kill -15'
alias l 'exa --long --classify --git'
alias ll 'exa --long --classify --git --all'
alias o 'open'
alias py 'python'
alias rb 'ruby'
alias v 'mvim'

# DNS/Network
alias dns.clear 'dscacheutil -flushcache'
alias ip 'curl icanhazip.com'

# Homebrew
alias service 'brew services'
alias start 'brew services start'
alias stop 'brew services stop'
alias restart 'brew services restart'

# lulz
alias fucking 'sudo'
function whothefuckisusingport; lsof -i tcp:$argv; end
function whatthefuckisusingthefile; lsof | grep $argv; end

# Create and move to a new directory.
function mkcd; mkdir -p -- "$argv" && cd -P -- "$argv"; end

# Convert markdown to PDF
function md2pdf
  $MARKDOWN $argv > $argv.html &&
  htmldoc --cont --bodyfont helvetica --textfont helvetica --headfootsize 8.0 --fontsize 10.0 --format pdf14 $argv.html > $argv.pdf &&
  rm $argv.html
end

# View a markdown file in a browser.
function mdview
  set filename "$TMPDIR(basename $argv).html"
  $MARKDOWN $argv > $filename
  $BROWSER $filename
end

# Convenience function to execute some action on the argument (read: second
# column) part of STDIN.
#
# For example:
#
#     git status --porcelain | grep '??' | with_args rm
#
# You can reliably substitute this function anywhere you could do
# `awk '{print $2}' | xargs`.
function with_args; awk '{print $2}' | xargs $argv; end
