" Python

let g:pymode_lint_ignore = "W0401,E501"

" Turn off code completion on entering a `.` cuz it's really slow.
let g:pymode_rope_complete_on_dot = 0

if has("autocmd")
  autocmd Filetype python nnoremap <buffer> <leader>wtf oprint("#" * 90)<c-m>import inspect<c-m>[print(l) for l in inspect.stack()]<c-m>print("#" * 90)<esc>
endif
