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
