let mapleader = ","

" Fixing some vim defaults baddy
nnoremap j gj
nnoremap k gk
inoremap <C-space> <esc>

" Making Y behave like C and D
nnoremap Y y$

" Indent (while in visual mode)
vnoremap < <gv
vnoremap > >gv

" New line when in insert mode
inoremap <C-cr> <esc>A<cr>

" Search only in the selected block (visual mode)
vnoremap / <esc>/\%V

" Space will toggle folds!
nnoremap <space> za

" Buffer stuff
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>c :bd<cr>
nmap <leader>o :Explore<cr>
nmap <leader>j :ls<cr>

" Easier buffer nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggline relative line numbering.
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


" Sudo save
cnoremap w!! w !sudo tee % >/dev/null

" Tagbar
nnoremap <leader>l :TagbarToggle<cr>

" Commenting
nnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>
vnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>

" Drupal stuff
nnoremap <Leader>d6 :execute "!open http://api.drupal.org/api/search/6/".shellescape(expand("<cword>"), 1)<cr>
nnoremap <Leader>d7 :execute "!open http://api.drupal.org/api/search/7/".shellescape(expand("<cword>"), 1)<cr>
