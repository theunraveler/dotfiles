
" Fix vim defaults
set nocompatible
set lazyredraw
set ttyfast
set nostartofline           " Make j/k respect the columns (after all, this is not a freaking typewriter)
set modeline                " Respect modeline of the file (the famous "vi:noai:sw=3 ts=6" on the beginning of the files)
set hidden                  " Avoid asking to save before hiding

" Fixes funny things when we use non-POSIX-compliant shells, like fish.
set shell=/bin/sh

" Load fzf from homebrew
" This needs to happen before we load plugins so that the `fzf.vim` plugin can
" find it.
let &rtp .= ',' . $HOMEBREW_PREFIX . '/opt/fzf'

" Plugins
runtime! plugins.vim

" Basic UI
set visualbell
set shortmess=atIWs
set title
set numberwidth=1
set number
set relativenumber
set report=2
set showmode

if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%t " file name
  set titlestring+=%(\ %h%m%r%w%) " flags
endif

" Command-mode completion
set wildignore=*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
set wildmode=list:longest

" Clipboard
set clipboard=unnamed

" Soft/Hard Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

" History and backup
set viminfo='10,:20,\"100,h
set nobackup
set nowritebackup
set noswapfile

" Undo
if (v:version > 703)
  set undofile
  set undoreload=10000
endif

" Format
set formatprg=par
