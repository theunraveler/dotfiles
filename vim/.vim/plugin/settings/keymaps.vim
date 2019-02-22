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
nmap <leader>b :buffers<cr>:buffer<space>
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

" Tagbar
nnoremap <leader>t :TagbarToggle<cr>

" Commenting
nnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>
vnoremap <leader>/ :call NERDComment("n", "Toggle")<cr>

" NERDTree
nmap <leader>o :NERDTreeToggle<cr>
nmap - :NERDTreeFocus<cr>

" Inserts a UUID at the current position
inoremap <C-b> <C-r>=substitute(substitute(system("uuidgen"), '.$', '', 'g'), '[A-Z]', '\L&', 'g')<CR>
