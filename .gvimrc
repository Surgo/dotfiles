"Display
set title
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

set guifont=VL\ Gothic\ 15

"Font
if has('mac')
  "Disable IME
  set imdisable
  "Fullscreen
  set fuoptions=maxvert,maxhorz
  autocmd GUIEnter * set fullscreen
  "Transparency
  set transparency=10
  "Font
  set guifont=Osaka-Mono:h18
elseif has("unix") " For linux machines (Ubuntu
  set guifont VL\ Gothic\ 14
elseif has('win32') || has('win64')
  "Fullscreen
  autocmd GUIEnter * :simalt ~x
  "Transparency
  set transparency=225
  "Font
  set guifont=VL_Gothic_Regular:h16
  set guifontwide=VL_Gothic_Regular:h16
  set printfont=VL_Gothic_Regular:h11
endif

colorscheme oceandeep

"Plugin settings
""Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
