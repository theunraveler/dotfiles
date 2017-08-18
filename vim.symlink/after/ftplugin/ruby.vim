" Ruby

syn match error contained "\<binding.pry\>"
syn match error contained "\<debugger\>"

" Debugging: https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html
nnoremap <buffer> <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
