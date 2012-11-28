"System
set nocompatible
set nobackup
set noswapfile
set autoread
set hidden

filetype off
syntax off
scriptencoding 'utf-8'

if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

""Windows
if has('win32')
  "let $LANG='ja_JP.UTF-8'
  set shellslash
  set runtimepath+=$HOME/.vim,$HOME/.vim/after
endif

"Terminal
set ttyfast

"Clipboard
set clipboard=unnamed

"Keyboards
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
""leader keys
if has('mac')
  let mapleader = ","
endif
""Move cursor
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up> gk
"" :<->;
noremap ; :
noremap : ;

""Move window
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j
""Buffer
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>

"Mouse
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"Status
set showcmd
set showmode
set laststatus=2
set modelines=0
set cmdheight=2

"Display
set number
set ruler
set showmatch " ()
set lazyredraw
"" Show undisplay chars
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<
"" Show cursor
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"Indent
set autoindent
set smartindent
set cindent
set expandtab

set tabstop=4
set softtabstop=0
set shiftwidth=4

"Completion
set wildmenu
set wildchar=<Tab>
set wildmode=list:full
set history=1000
set complete+=k
""Omni completion
imap <C-space> <C-x><C-o>
""Omni completion <tab>
function! InsertTabWrapper()
  if pumvisible()
    return "\<C-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col -1] !~ '\k\|<\|/'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<C-n>"
  else
    return "\<C-x>\<C-o>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
""Spacing after commma
inoremap , ,<Space>
"" Remove commma when close.
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\t/  /ge

"Search
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set iminsert=0
set imsearch=0
""Cancelling highlight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"Multi bytes
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif
set formatoptions=lmoq
if has('syntax')
  syntax enable
  function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
    silent! match ZenkakuSpace /Å@/
  endfunction
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif
""IME OFF
set noimdisable
set noimcmdline

"Plugin settings
""pathogen
call pathogen#infect()
""NERD_commenter
let NERDSpaceDelims = 1
""grep.vim
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'
""QuickBuf
""let g:qb_hotkey=';;'
""DumpBuf
let dumbbuf_hotkey = ';;'
""unite.vim
nnoremap <silent> :: :<C-u>Unite file_mru<CR>
""Zencoding
let g:user_zen_expandabbr_key='<<'
""PEP8
let g:pep8_map='<F5>'

syntax on
filetype plugin indent on
