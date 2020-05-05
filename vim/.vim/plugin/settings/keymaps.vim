" Keymaps
"
" This is where we set all key mappings, regardless of if they come from vim
" core or a plugin (keymappings are easier to read and debug if they're all in
" the same place).

let mapleader = "\<space>"

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

" Play macro with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Buffer management
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>c :Bclose<cr>
nmap <leader>l :ls<cr>

" Easier buffer nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Splits
nmap <leader>sw<left>  :topleft  vnew<cr>
nmap <leader>sw<right> :botright vnew<cr>
nmap <leader>sw<up>    :topleft  new<cr>
nmap <leader>sw<down>  :botright new<cr>
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Sudo save
cnoremap w!! w !sudo tee % >/dev/null

" Save the file with <Leader>w
nnoremap <Leader>w :w<cr>

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
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nnoremap <C-p> :call FZFOpen(':Files')<cr>
nnoremap <leader>h :call FZFOpen(':History')<cr>
nnoremap <leader>t :call FZFOpen(':BTags')<cr>
nnoremap <leader>T :call FZFOpen(':Tags')<cr>

" ctags
nmap <leader>ct :call s:Ctags()<cr>
