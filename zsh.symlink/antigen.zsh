source $HOME/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  composer
  extract
  git
  git-flow
  gitignore
  osx
  rbenv
  singlechar
  symfony2
  terminalapp
  zsh_reload
EOBUNDLES
antigen theme theunraveler
antigen apply
