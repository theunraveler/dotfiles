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
