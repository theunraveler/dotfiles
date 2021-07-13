set fish_greeting

source $HOME/.config/fish/env.fish
source $HOME/.config/fish/keys.fish
source $HOME/.config/fish/aliases.fish

# Source out to local config file.
[ -f "$HOME/.local/share/fish/local.fish" ] && source "$HOME/.local/share/fish/local.fish"

# Starship
eval (starship init fish)
