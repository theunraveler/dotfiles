function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('airblade/vim-gitgutter')
  call packager#add('bitc/vim-bad-whitespace')
  call packager#add('dbakker/vim-projectroot')
  call packager#add('editorconfig/editorconfig-vim')
  call packager#add('ervandew/supertab')
  call packager#add('jeffkreeftmeijer/vim-numbertoggle')
  call packager#add('junegunn/fzf.vim')
  call packager#add('junegunn/vim-peekaboo')
  call packager#add('kshenoy/vim-signature')
  call packager#add('lambdalisue/fern.vim')
  call packager#add('majutsushi/tagbar')
  call packager#add('mg979/vim-visual-multi')
  call packager#add('python-mode/python-mode')
  call packager#add('rbgrouleff/bclose.vim')
  call packager#add('rhysd/devdocs.vim')
  call packager#add('scrooloose/nerdcommenter')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-rbenv')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-sensible')
  call packager#add('tpope/vim-surround')
  call packager#add('w0rp/ale')
  call packager#add('Yggdroot/indentLine')

  " Color schemes
  call packager#add('connorholyday/vim-snazzy')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
