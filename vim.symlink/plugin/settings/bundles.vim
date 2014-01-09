Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-markdown'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'harleypig/ShowMarks'
Bundle '13k/vim-tomorrow'
Bundle 'othree/html5.vim'
Bundle 'beyondwords/vim-twig'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'tpope/vim-eunuch'
Bundle 'bronson/vim-trailing-whitespace'

colorscheme Tomorrow-Night-Bright

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" NERDCommenter
let g:NERDCreateDefaultMappings = 0

" Syntastic
let g:syntastic_php_checkers=['php']
let g:syntastic_quiet_messages = {'level': 'warnings'}
