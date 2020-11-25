# Overrides
alias cat 'bat'
abbr cp 'cp --recursive --verbose'
alias gpg 'gpg --options ~/.gnupg/gpg.local.conf --options ~/.gnupg/gpg.conf'
alias grep 'ack'
alias ls 'exa'
abbr mkdir 'mkdir --parents --verbose'
abbr mv 'mv --verbose'
abbr rsync 'rsync -arxvz --rsh=ssh --progress --exclude-from=$HOME/.rsync/exclude'
abbr rm 'rm --recursive --verbose'
alias vi 'mvim'
alias vim 'mvim'

# Shorties
abbr b 'brew'
abbr be 'bundle exec'
abbr d 'drush'
abbr el 'elixir'
abbr g 'git'
abbr k 'kill -15'
alias l 'exa --long --classify --git'
alias ll 'exa --long --classify --git --all'
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
