" Golang settings

let g:go_fmt_command = 'goimports'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

if has("autocmd")
  autocmd Filetype go set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
endif
