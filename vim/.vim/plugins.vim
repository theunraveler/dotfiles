function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugins
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('bronson/vim-trailing-whitespace')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('ervandew/supertab')
  call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('kshenoy/vim-signature')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('python-mode/python-mode')
  call minpac#add('rbgrouleff/bclose.vim')
  call minpac#add('rhysd/devdocs.vim')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-rbenv')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('w0rp/ale')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('Yggdroot/indentLine')

  " Color schemes
  call minpac#add('connorholyday/vim-snazzy')
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
