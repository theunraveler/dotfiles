let g:buffet_show_index = 1
let g:buffet_tab_icon = " \uf009 "
let g:buffet_new_buffer_name = ' [*]'
let g:buffet_modified_icon = ' [+]'

function! g:BuffetSetCustomColors()
  highlight! link BuffetCurrentBuffer CursorLine
  highlight! link BuffetActiveBuffer Comment
  highlight! link BuffetBuffer Comment
  highlight! link BuffetTab Comment
endfunction
