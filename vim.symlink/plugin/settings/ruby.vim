" Ruby

if has("autocmd")
  autocmd BufEnter *.rb syn match error contained "\<binding.pry\>"
  autocmd BufEnter *.rb syn match error contained "\<debugger\>"
endif

