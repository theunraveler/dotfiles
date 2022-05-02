let s:plugins = [
  "\ Start with vim-packager.
  \['kristijanhusak/vim-packager', {'type': 'opt'}],
  \
  "\ Plugins.
  \ 'airblade/vim-gitgutter',
  \ ['theunraveler/vim-buffet', {'branch': 'nerdfont'}],
  \ 'bitc/vim-bad-whitespace',
  \ 'dbakker/vim-projectroot',
  \ 'editorconfig/editorconfig-vim',
  \ 'ervandew/supertab',
  \ 'jeffkreeftmeijer/vim-numbertoggle',
  \ 'junegunn/fzf.vim',
  \ 'junegunn/vim-peekaboo',
  \ 'kshenoy/vim-signature',
  \ ['lambdalisue/fern-renderer-nerdfont.vim', {'requires': 'lambdalisue/nerdfont.vim'}],
  \ 'lambdalisue/fern.vim',
  \ 'luizribeiro/vim-cooklang',
  \ 'mg979/vim-visual-multi',
  \ 'preservim/nerdcommenter',
  \ 'preservim/tagbar',
  \ 'python-mode/python-mode',
  \ 'rbgrouleff/bclose.vim',
  \ 'rhysd/devdocs.vim',
  \ 'sheerun/vim-polyglot',
  \ ['theunraveler/fern-comparator-lexical.vim', {'branch': 'case_insensitive'}],
  \ 'tpope/vim-eunuch',
  \ 'tpope/vim-rbenv',
  \ 'tpope/vim-repeat',
  \ 'tpope/vim-sensible',
  \ 'tpope/vim-surround',
  \ 'w0rp/ale',
  \ 'Yggdroot/indentLine',
  \
  "\ Color schemes.
  \ 'connorholyday/vim-snazzy'
\]

function! PackagerInit() abort
  packadd vim-packager
  call packager#init()

  for plugin in s:plugins
    if type(plugin) == v:t_list
      let [name, kwargs] = plugin
    else
      let name = plugin
      let kwargs = {}
    endif
    call packager#add(name, kwargs)
  endfor
endfunction

command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()
