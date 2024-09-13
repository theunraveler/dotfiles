let g:macvim_default_touchbar_fullscreen=0
let g:macvim_default_touchbar_characterpicker=0

if has("touchbar")
  aunmenu TouchBar.EnterFullScreen

  anoremenu TouchBar.-flexspace1- <Nop>

  " Jump to definition
  nmenu icon=NSTouchBarRotateLeftTemplate TouchBar.JumpToDefinition <C-]>
  nmenu icon=NSTouchBarRotateRightTemplate TouchBar.JumpFromDefinition <C-T>

  anoremenu TouchBar.-space1- <Nop>

  " Buffer navigation
  nmenu icon=NSTouchBarGoUpTemplate TouchBar.Last <C-^>
  nmenu icon=NSTouchBarGoBackTemplate TouchBar.Back :bprevious<cr>
  nmenu icon=NSTouchBarGoForwardTemplate TouchBar.Forward :bnext<cr>
  nmenu icon=NSTouchBarListViewTemplate TouchBar.ShowList :ls<cr>:b<space>
endif

