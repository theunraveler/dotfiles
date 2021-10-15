" This is where we set all key mappings, regardless of if they come from vim
" core or a plugin (keymappings are easier to read and debug if they're all in
" the same place).

" This file has to be loaded before all other config so that the leader key and
" stuff get set right.

let mapleader = "\<space>"

" Fixing some vim defaults baddy
nnoremap j gj
nnoremap k gk

" Making Y behave like C and D
nnoremap Y y$

" Indent (while in visual mode)
vnoremap < <gv
vnoremap > >gv

" Search only in the selected block (visual mode)
vnoremap / <esc>/\%V

" Buffer management
nmap <leader>n :bnext<cr>
nmap <leader>p :bprev<cr>
nmap <leader>c :Bclose<cr>

" Easier buffer nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Splits
nmap <leader>sw<left>  :topleft vnew<cr>
nmap <leader>sw<right> :botright vnew<cr>
nmap <leader>sw<up>    :topleft new<cr>
nmap <leader>sw<down>  :botright new<cr>
nmap <leader>s<left>   :leftabove vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Commenting
nmap <leader>/ :call nerdcommenter#Comment("n", "Toggle")<cr>
vmap <leader>/ :call nerdcommenter#Comment("n", "Toggle")<cr>

" fern
nmap - :execute printf('Fern . -reveal=%% %s', g:fern#default_args) <cr>

" Ale
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
nmap <leader>f <Plug>(ale_fix)

" fzf
function! FZFOpen(command_str)
  if (expand('%') =~# 'fern://' && winnr('$') > 1)
    exe "normal! \<C-w>\<C-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
nmap <C-p> :call FZFOpen(':Files')<cr>
nmap <leader>h :call FZFOpen(':History')<cr>
nmap <leader>t :call FZFOpen(':Tags')<cr>
nmap <leader>l :call FZFOpen(':Buffers')<cr>

" Open docs in devdocs.io
nmap K <Plug>(devdocs-under-cursor)

" Show which git commit last changed the current line.
" https://www.reddit.com/r/vim/comments/i50pce/how_to_show_commit_that_introduced_current_line/
map <silent><leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges --no-patch -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "wrap": 0 })), "&filetype", "git")<CR>
