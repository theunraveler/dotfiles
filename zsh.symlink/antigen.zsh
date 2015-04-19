source $HOME/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  bundler
  chruby
  colored-man
  composer
  djui/alias-tips
  extract
  git
  git-flow
  github
  gitignore
  osx
  pj
  rake
  rake-fast
  sudo
  terminalapp
  zsh_reload
  zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme theunraveler
antigen apply
