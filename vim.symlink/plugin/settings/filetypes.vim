if has("autocmd")

  " Recognize
  autocmd BufRead,BufNewFile *.{module,install,inc,profile,test}  set filetype=php.drupal
  autocmd BufRead,BufNewFile *.{md,mkd,markdown}                  set filetype=markdown
  autocmd BufRead,BufNewFile {Rakefile,Capfile,Gemfile,Guardfile} set filetype=ruby

  autocmd FileType markdown                                       setlocal spell lbr

endif
