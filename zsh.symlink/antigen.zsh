source $HOME/.zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
  brew
  bundler
  chruby
  colored-man
  composer
  extract
  git
  git-flow
  github
  gitignore
  postgres
  rake
  rake-fast
  terminalapp
  zsh_reload
  zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme theunraveler
antigen apply
