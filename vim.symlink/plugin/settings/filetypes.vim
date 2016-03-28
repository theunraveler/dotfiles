if has("autocmd")
  " Ruby
  autocmd BufRead,BufNewFile {Rakefile,Capfile,Gemfile,Guardfile} set filetype=ruby
  autocmd BufEnter *.rb syn match error contained "\<binding.pry\>"
  autocmd BufEnter *.rb syn match error contained "\<debugger\>"

  " Git
  autocmd Filetype gitcommit setlocal spell textwidth=72

  " Markdown
  autocmd BufRead,BufNewFile *.{md,mkd,markdown} set filetype=markdown
  autocmd Filetype markdown setlocal spell lbr

  " Go
  autocmd Filetype go set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

  " PHP
  autocmd BufRead,BufNewFile *.php set tabstop=4 softtabstop=4 shiftwidth=4
endif
