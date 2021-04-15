let g:macvim_default_touchbar_fullscreen=0
let g:macvim_default_touchbar_characterpicker=0

if has("gui_macvim")
  an TouchBar.EnterFullScreen <Nop>

  " Commenting
  nmenu TouchBar.// <leader>/
  vmenu TouchBar.// <leader>/

  " Replay last macro
  nmenu TouchBar.@@ @@
  imenu TouchBar.@@ <esc>@@

  " Buffer navigation
  nmenu icon=NSTouchBarGoUpTemplate TouchBar.Last <C-^>
  nmenu icon=NSTouchBarGoBackTemplate TouchBar.Back :bprevious<cr>
  nmenu icon=NSTouchBarGoForwardTemplate TouchBar.Forward :bnext<cr>
  nmenu icon=NSTouchBarListViewTemplate TouchBar.ShowList :ls<cr>:b<space>
endif

