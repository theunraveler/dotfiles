if has("autocmd")

  " Use Symfony2 coding style for the Cadre Portal.
  autocmd BufRead,BufNewFile /Users/Jake/Code/symfony/*                   setlocal tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile /Users/Jake/Code/work/cadre/cadre_portal/*   setlocal tabstop=4 shiftwidth=4

endif
