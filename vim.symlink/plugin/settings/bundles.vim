colorscheme Tomorrow-Night-Bright

" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" NERDCommenter
let g:NERDCreateDefaultMappings = 0

" Syntastic
let g:syntastic_php_checkers=['php']
let g:syntastic_quiet_messages = {'level': 'warnings'}
