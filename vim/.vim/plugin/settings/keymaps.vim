" Keymaps
"
" This is where we set all key mappings, regardless of if they come from vim
" core or a plugin (keymappings are easier to read and debug if they're all in
" the same place).

let mapleader = "\<Space>"

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

" Buffer stuff
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>c :Bclose<cr>
nmap <leader>l :ls<cr>

" Easier buffer nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Sudo save
cnoremap w!! w !sudo tee % >/dev/null

" Save the file with <Leader>w
nnoremap <Leader>w :w<CR>

" Commenting
nnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>
vnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>

" NERDTree
nmap <leader>o :NERDTreeToggle<cr>
nmap - :NERDTreeFocus<cr>

" Ale
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
nmap <leader>f <Plug>(ale_fix)

" fzf
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<C-w>\<C-w>"
    echom 'NEW WINDOW IS ' . expand('%')
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nnoremap <C-p> :call FZFOpen(':Files')<cr>
nnoremap <Leader>b :call FZFOpen(':Buffers')<cr>
nnoremap <Leader>h :call FZFOpen(':History')<cr>
nnoremap <Leader>t :call FZFOpen(':BTags')<cr>
nnoremap <Leader>T :call FZFOpen(':Tags')<cr>
