" Python

let g:pymode_lint_ignore = "W0401,E501"

" Turn off rope cuz it's really slow.
let g:pymode_rope = 0

nnoremap <buffer> <leader>wtf oprint("#" * 90)<c-m>import inspect<c-m>[print(l) for l in inspect.stack()]<c-m>print("#" * 90)<esc>
