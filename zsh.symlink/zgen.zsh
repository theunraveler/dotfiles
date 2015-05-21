source $HOME/.zsh/zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save"
  zgen oh-my-zsh

  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/bundler
  zgen oh-my-zsh plugins/colored-man
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-flow
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/pj
  zgen oh-my-zsh plugins/terminalapp
  zgen oh-my-zsh plugins/zsh_reload

  zgen load djui/alias-tips
  zgen load zsh-users/zsh-syntax-highlighting

  zgen load zsh-users/zsh-completions src

  zgen oh-my-zsh themes/theunraveler

  zgen save
fi
