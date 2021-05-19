" Search and replace

set gdefault      " Make regexp matches everything, instead of just the first one
set hlsearch      " Highlight matched regexp
set ignorecase
set smartcase     " Intelligent case-smart searching

set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
