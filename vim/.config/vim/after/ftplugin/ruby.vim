" Ruby

syn match error contained "\<binding.pry\>"
syn match error contained "\<debugger\>"

nnoremap <buffer> <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
nnoremap <buffer> <leader>breakpoint opry.binding<esc>
