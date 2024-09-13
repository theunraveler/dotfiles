" Python

nnoremap <buffer> <leader>wtf oprint("#" * 90)<c-m>import inspect<c-m>[print(l) for l in inspect.stack()]<c-m>print("#" * 90)<esc>
