let g:macvim_default_touchbar_fullscreen=0
let g:macvim_default_touchbar_characterpicker=0

if has("touchbar")
  aunmenu TouchBar.EnterFullScreen

  " Commenting
  nmenu TouchBar.// <leader>/

  " DevDocs
  nmenu icon=NSTouchBarBookmarksTemplate TouchBar.DevDocs :DevDocsUnderCursor<cr>

  anoremenu TouchBar.-flexspace1- <Nop>

  " Jump to definition
  nmenu icon=NSTouchBarRotateLeftTemplate TouchBar.JumpToDefinition <C-]>
  nmenu icon=NSTouchBarRotateRightTemplate TouchBar.JumpFromDefinition <C-T>

  anoremenu TouchBar.-flexspace2- <Nop>

  " Replay last macro
  nmenu TouchBar.@@ @@
  imenu TouchBar.@@ <esc>@@

  anoremenu TouchBar.-flexspace3- <Nop>

  " Buffer navigation
  nmenu icon=NSTouchBarGoUpTemplate TouchBar.Last <C-^>
  nmenu icon=NSTouchBarGoBackTemplate TouchBar.Back :bprevious<cr>
  nmenu icon=NSTouchBarGoForwardTemplate TouchBar.Forward :bnext<cr>
  nmenu icon=NSTouchBarListViewTemplate TouchBar.ShowList :ls<cr>:b<space>
endif

