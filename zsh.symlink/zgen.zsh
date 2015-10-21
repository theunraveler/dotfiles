source $HOME/.zsh/zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save"

  # Prezto options.
  zgen prezto '*:*' color 'yes'
  zgen prezto ruby 'chruby:auto-switch' 'yes'
  zgen prezto history-substring-search color 'no'
  zgen prezto history-substring-search globbing-flags ''
  zgen prezto prompt theme 'theunraveler'

  zgen prezto
  zgen prezto archive
  zgen prezto completion
  zgen prezto git
  zgen prezto history
  zgen prezto ruby
  zgen prezto gnu-utility
  zgen prezto utility

  zgen load djui/alias-tips
  zgen load theunraveler/zsh-fancy_ctrl_z
  zgen load zsh-users/zsh-syntax-highlighting
  zgen prezto history-substring-search
  zgen load zsh-users/zsh-completions src

  zgen save
fi
