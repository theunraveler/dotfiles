let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1

" Keep NERDTree open all the time
" https://github.com/scrooloose/nerdtree/wiki/F.A.Q.#how-can-i-open-nerdtree-automatically-when-vim-starts-up-on-opening-a-directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
