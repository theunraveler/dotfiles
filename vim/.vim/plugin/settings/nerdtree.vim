" Show dot files
" https://github.com/scrooloose/nerdtree/wiki/how-do-I-get-NERDTree-to-show-dot-files
let NERDTreeShowHidden = 1

" Keep NERDTree open all the time
" https://github.com/scrooloose/nerdtree/wiki/F.A.Q.#how-can-i-open-nerdtree-automatically-when-vim-starts-up-on-opening-a-directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" Highlight currently open buffer in NERDTree
" https://www.reddit.com/r/vim/comments/g47z4f/synchronizing_nerdtree_with_the_currently_opened/
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
autocmd BufEnter * call SyncTree()
