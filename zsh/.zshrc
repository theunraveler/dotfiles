# Source our custom files.
source $HOME/.zsh/config.zsh
source $HOME/.zsh/aliases.zsh

setopt -o extended_glob

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Put an hr between each command.
precmd() { tput setaf 7 && hr '-' && tput sgr0 }
