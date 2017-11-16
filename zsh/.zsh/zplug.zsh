export ZPLUG_HOME=$BREWPATH/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "djui/alias-tips"
zplug "Tarrasch/zsh-autoenv"
zplug "theunraveler/zsh-fancy_ctrl_z"
zplug "modules/gnu-utility", from:prezto
zplug "modules/history-substring-search", from:prezto
zplug "modules/ruby", from:prezto
zplug "modules/utility", from:prezto
zplug "zimframework/archive"
zplug "zimframework/history"
zplug "zimframework/prompt"
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zstyle ':prezto:module:*:*' color 'yes'
zstyle ':prezto:module:history-substring-search' color 'no'
zstyle ':prezto:module:history-substring-search' globbing-flags ''
zstyle ':prezto:module:ruby:chruby' auto-switch 'yes'

zprompt_theme='theunraveler'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
