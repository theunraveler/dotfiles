set gdefault      " Make regexp matches everything, instead of just the first one
set hlsearch      " Highlight matched regexp

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
