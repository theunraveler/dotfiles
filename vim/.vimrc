" Fix vim defaults
set nocompatible
set lazyredraw
set ttyfast
set nostartofline           " Make j/k respect the columns (after all, this is not a freaking typewriter)
set modeline                " Respect modeline of the file (the famous "vi:noai:sw=3 ts=6" on the beginning of the files)
set hidden                  " Avoid asking to save before hiding

filetype on
filetype off

" Load fzf from homebrew
" This needs to happen before we load plugins so that the `fzf.vim` plugin can
" find it.
let &rtp .= ',' . $HOMEBREW_PREFIX . '/opt/fzf'

" Plugins
runtime! plugins.vim

" Basic UI
set visualbell
set shortmess=atIWswxrnmlf
set title
set titlestring=%f%(\ [%M]%)   " Show file name at the title
set numberwidth=1
set number
set relativenumber
set report=2
set showmode

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
set viminfo='10,:20,\"100,%,n~/.viminfo
set nobackup
set nowritebackup
set noswapfile

" Format
set formatprg=par
