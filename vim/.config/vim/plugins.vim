set packpath=$HOME/.local/share/vim

let s:plugins = [
  "\ Start with vim-packager.
  \ ['kristijanhusak/vim-packager', {'type': 'opt'}],
  \
  "\ Plugins.
  \ 'aaronjensen/vim-command-w',
  \ 'airblade/vim-gitgutter',
  \ ['theunraveler/vim-buffet', {'branch': 'nerdfont'}],
  \ 'bitc/vim-bad-whitespace',
  \ 'dbakker/vim-projectroot',
  \ 'ervandew/supertab',
  \ 'jeffkreeftmeijer/vim-numbertoggle',
  \ 'junegunn/fzf.vim',
  \ 'kshenoy/vim-signature',
  \ 'lambdalisue/fern.vim',
  \ ['lambdalisue/fern-renderer-nerdfont.vim', {'requires': 'lambdalisue/nerdfont.vim'}],
  \ 'moll/vim-bbye',
  \ 'preservim/nerdcommenter',
  \ 'preservim/tagbar',
  \ 'python-mode/python-mode',
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
  \ 'connorholyday/vim-snazzy',
\]

function! s:packager_init(packager) abort
  for plugin in s:plugins
    if type(plugin) == v:t_list
      let [name, kwargs] = plugin
    else
      let name = plugin
      let kwargs = {}
    endif
    call a:packager.add(name, kwargs)
  endfor
endfunction

packadd vim-packager
call packager#setup(function('s:packager_init'))
