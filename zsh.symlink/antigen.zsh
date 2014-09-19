source $HOME/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  bundler
  composer
  extract
  git
  git-flow
  gitignore
  postgres
  terminalapp
EOBUNDLES
antigen theme theunraveler
antigen apply
