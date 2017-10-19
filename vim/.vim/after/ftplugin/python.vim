" Python

nnoremap <buffer> <leader>wtf oprint("#" * 90)<c-m>import inspect<c-m>[print(l) for l in inspect.stack()]<c-m>print("#" * 90)<esc>
nnoremap <buffer> <leader>breakpoint oimport pdb<c-m>pdb.set_trace()<esc>
