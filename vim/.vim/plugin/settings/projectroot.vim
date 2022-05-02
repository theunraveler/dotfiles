function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

augroup AutoProjectRoot
  autocmd BufEnter * call <SID>AutoProjectRootCD()
augroup END
