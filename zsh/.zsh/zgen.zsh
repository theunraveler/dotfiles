export ZGEN_RESET_ON_CHANGE=(
  ${HOME}/.zshrc*
  ${HOME}/.zsh/*.zsh
  ${HOME}/.zsh/functions/*
)

source $HOME/.zsh/zgen/zgen.zsh

if ! zgen saved; then
  # Prezto options.
  zgen prezto '*:*' color 'yes'
  zgen prezto 'git:alias' skip 'yes'
  zgen prezto history-substring-search color 'no'
  zgen prezto history-substring-search globbing-flags ''
  zgen prezto prompt theme 'theunraveler'
  zgen prezto 'ruby:chruby' auto-switch 'yes'

  zgen prezto
  zgen prezto archive
  zgen prezto completion
  zgen prezto git
  zgen prezto gnu-utility
  zgen prezto history
  zgen prezto ruby
  zgen prezto syntax-highlighting
  zgen prezto utility

  zgen load djui/alias-tips
  zgen load Tarrasch/zsh-autoenv
  zgen load theunraveler/zsh-fancy_ctrl_z
  zgen prezto history-substring-search
  zgen load zsh-users/zsh-completions src

  zgen save
fi
