if has('gui_macvim')
  macmenu Window.Show\ Previous\ Tab key=<Nop>
  macmenu Buffers.Previous key=<D-S-[>
  macmenu Window.Show\ Next\ Tab key=<Nop>
  macmenu Buffers.Next key=<D-S-]>

  macmenu &File.Close key=<nop>
  nmap <D-w> :CommandW<cr>
  imap <D-w> <Esc>:CommandW<cr>
endif
