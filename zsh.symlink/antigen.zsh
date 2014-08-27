source $HOME/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  composer
  extract
  git
  git-flow
  gitignore
  terminalapp
EOBUNDLES
antigen theme theunraveler
antigen apply
