set background=dark
colorscheme Tomorrow-Night-Bright

" Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
if has("autocmd")
  autocmd VimEnter * nested :call tagbar#autoopen(1)
  autocmd FileType * nested :call tagbar#autoopen(0)
  autocmd BufEnter * nested :call tagbar#autoopen(0)
endif

" NERDCommenter
let g:NERDCreateDefaultMappings = 0

" Syntastic
let g:syntastic_php_checkers=['php']
let g:syntastic_ruby_checkers=['rubocop']

" TaskList
let g:tlTokenList = ['FIXME', 'TODO', 'OPTIMIZE', 'XXX']

" Faster Ctrl+P
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
