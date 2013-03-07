if has("autocmd")

  " Removes trailing whitespace when saving a file or buffer
  function CleanupTrailingWhiteSpace()
    silent! %s/\s\+$//
  endfunction
  autocmd FileWritePre,BufWritePre * call CleanupTrailingWhiteSpace()
endif
