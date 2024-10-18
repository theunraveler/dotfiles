if (v:version > 703)
  set undofile
  set undoreload=10000
  set undodir=~/.local/share/vim/undo     | call mkdir(&undodir,   'p', 0700)
endif

