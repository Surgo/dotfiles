"Display
set title

"Font
if has('mac')
  set guifont=Osaka-Mono:h16
endif
if has('gui_macvim')
  "Disable IME
  set imdisable
  "Disable toolbar
  set guioptions-=t
  set guioptions-=T
  "Disable menubar
  set guioptions-=m
  "Disable rightside scrollbar
  set guioptions-=r
  set guioptions-=R
  "Disable leftside scrollbar
  set guioptions-=l
  set guioptions-=L
  "Disable bottom scrollbar
  set guioptions-=b
  "Fullscreen
  set fuoptions=maxvert,maxhorz
  autocmd GUIEnter * set fullscreen
  "Transparency
  set transparency=10
  set guifont=Osaka-Mono:h18
endif
if has('win32')
  set guifont=VL_Gothic_Regular:h16
  set guifontwide=VL_Gothic_Regular:h16
  set printfont=VL_Gothic_Regular:h11
endif
if has("gui_win32")
  "Disable toolbar
  set guioptions-=t
  set guioptions-=T
  "Disable menubar
  set guioptions-=m
  "Disable rightside scrollbar
  set guioptions-=r
  set guioptions-=R
  "Disable leftside scrollbar
  set guioptions-=l
  set guioptions-=L
  "Disable bottom scrollbar
  set guioptions-=b
  "Fullscreen
  autocmd GUIEnter * :simalt ~x
  set guifont=VL_Gothic_Regular:h16
  set guifontwide=VL_Gothic_Regular:h16
endif

colorscheme oceandeep

"Plugin settings
""Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
