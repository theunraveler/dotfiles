" https://github.com/k-takata/minpac#load-minpac-on-demand

if &compatible
  set nocompatible
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('alvan/vim-closetag')
  call minpac#add('bronson/vim-trailing-whitespace')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('eiginn/netrw')
  call minpac#add('ervandew/supertab')
  call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
  call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash --no-fish --all' })
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('kshenoy/vim-signature')
  call minpac#add('ludovicchabant/vim-gutentags')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('nathanaelkane/vim-indent-guides')
  call minpac#add('python-mode/python-mode')
  call minpac#add('rbgrouleff/bclose.vim')
  call minpac#add('rhysd/devdocs.vim')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('spf13/vim-autoclose')
  call minpac#add('tpope/vim-bundler')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-rbenv')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('w0rp/ale')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('Yggdroot/indentLine')

  " Color schemes
  call minpac#add('13k/vim-tomorrow')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
