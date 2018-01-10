export ZPLUG_HOME=$BREWPATH/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "djui/alias-tips"
zplug "theunraveler/zsh-fancy_ctrl_z"
zplug "modules/gnu-utility", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/history", from:prezto
zplug "modules/prompt", from:prezto
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zstyle ':prezto:module:*:*' color 'yes'
zstyle ':prezto:module:prompt' theme 'theunraveler'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
