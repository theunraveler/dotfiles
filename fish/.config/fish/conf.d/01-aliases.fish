# Removes `asdf` shims from homebrew path.
# See https://github.com/pyenv/pyenv/issues/106#issuecomment-779325818.
set path_without_asdf "(string replace $ASDF_DATA_DIR/shims '' (echo $PATH))"

# Overrides
alias brew="env PATH=(string replace /usr/local/bin '' (echo $path_without_asdf)) brew"
alias cat 'bat'
abbr cp 'cp --recursive --verbose'
alias grep 'ack'
alias ls "exa $EXA_DEFAULT_OPTIONS"
abbr mkdir 'mkdir --parents --verbose'
abbr mv 'mv --verbose'
abbr rsync 'rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync_exclude'
abbr rm 'rm --recursive --verbose'
alias vi 'mvim'
alias vim 'mvim'

# Shorties
abbr - 'cd -'
abbr b 'brew'
abbr be 'bundle exec'
abbr d 'diff'
abbr el 'elixir'
abbr g 'git'
abbr k 'kill -15'
alias l "exa $EXA_DEFAULT_OPTIONS --long --classify --git"
alias ll "exa $EXA_DEFAULT_OPTIONS --long --classify --git --all"
abbr o 'open'
abbr py 'python'
abbr rb 'ruby'
alias v 'mvim'

# DNS/Network
abbr dns.clear 'dscacheutil -flushcache'
abbr ip 'curl icanhazip.com'

# Homebrew
alias service 'brew services'
alias start 'brew services start'
alias stop 'brew services stop'
alias restart 'brew services restart'

# lulz
alias fucking 'sudo'

# x86
alias x86 'arch -x86_64'
alias ibrew "arch -x86_64 env PATH=(string replace $HOMEBREW_PREFIX/bin '' (echo $path_without_asdf)) /usr/local/bin/brew"
