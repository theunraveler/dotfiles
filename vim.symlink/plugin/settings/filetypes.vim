if has("autocmd")

  autocmd BufRead,BufNewFile  *.{md,mkd,markdown}                   set filetype=markdown
  autocmd BufRead,BufNewFile  {Rakefile,Capfile,Gemfile,Guardfile}  set filetype=ruby
  autocmd FileType            markdown                              setlocal spell lbr
  autocmd Filetype            gitcommit                             setlocal spell textwidth=72
endif
