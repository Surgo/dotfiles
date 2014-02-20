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
if has('win32') || has('win64')
  "let $LANG='ja_JP.UTF-8'
  set shellslash
  set runtimepath+=$HOME/.vim,$HOME/.vim/after
endif

"Terminal
set ttyfast

"Clipboard
set clipboard+=unnamed
set clipboard+=autoselect

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
if has("mouse")
  set mouse=a
endif
set guioptions+=a
set ttymouse=xterm2

"Status
set showcmd
set showmode
set laststatus=2
set modelines=0
set cmdheight=2
"Status line
if has("statusline") && exists('*fugitive#statusline')
  set statusline=%<%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%{fugitive#statusline()}[%l,%c%V]\ %P
endif
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
"" Color
highlight clear CursorLine
highlight CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
highlight DiffAdd    ctermfg=1 ctermbg=none
highlight DiffChange ctermfg=3 ctermbg=none
highlight DiffDelete ctermfg=4 ctermbg=none
highlight DiffText   ctermfg=8 ctermbg=none

"Indent
set autoindent
set smartindent
set cindent
set expandtab

set tabstop=4
set softtabstop=4
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
"autocmd BufWritePre * :%s/\t/  /ge

"Search
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set iminsert=0
set imsearch=0
""Cancelling highlight
nnoremap <ESC><ESC> :nohlsearch<CR>

"Multi bytes
set fileencodings=utf-8,cp932,euc-jp,default,latin
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif
set formatoptions=lmoq
if has('syntax')
  syntax enable
  function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
    silent! match ZenkakuSpace /　/
  endfunction
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif
""IME off
set noimdisable
set noimcmdline
set iminsert=0
set imsearch=0
inoremap :set iminsert=0
"Disable IME in normal mode
augroup InsModeAu
  autocmd!
  autocmd InsertEnter,CmdwinEnter * set noimdisable
  autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

"Plugin settings
""pathogen
call pathogen#infect()
""NERD_tree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeShowHidden=0
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
""NERD_commenter
let NERDSpaceDelims = 1
""grep.vim
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'
""QuickBuf
""let g:qb_hotkey=';;'
""DumpBuf
""let dumbbuf_hotkey = ''
""unite.vim
autocmd FileType unite nnoremap <silent> <buffer> ;q :q<CR>
autocmd FileType unite inoremap <silent> <buffer> ;q <ESC>:q<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer> <C-k> <C-p>
  imap <silent><buffer> <C-j> <C-n>
endfunction
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('line_migemo', 'matchers', 'matcher_migemo')
call unite#custom#source('file_rec', 'sorters', 'sorter_reverse')
call unite#custom#source('buffer,file_rec,file_rec/async', 'matchers',
  \ ['converter_tail', 'matcher_fuzzy'])
call unite#custom#source('file_mru', 'matchers',
  \ ['matcher_project_files', 'matcher_hide_hidden_files'])
call unite#custom#source('file', 'matchers',
  \ ['matcher_fuzzy', 'matcher_hide_hidden_files'])
call unite#custom#source('file_rec/async,file_mru', 'converters',
  \ ['converter_file_directory'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_grep_max_candidates = 200
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
    \ '--line-numbers --nocolor --nogroup --hidden ' .
    \ '--ignore ''.hg'' ' .
    \ '--ignore ''.svn'' ' .
    \ '--ignore ''.git'' ' .
    \ '--ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent> ;g :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ;cg :<C-u>Unite<Space>grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ;; :<C-u>Unite<Space>buffer_tab -buffer-name=search-buffer<CR>
nnoremap <silent> ;<Space> :<C-u>Unite<Space>-no-split buffer file_mru file_rec:! file_rec/async:! -buffer-name=files<CR>
nnoremap <silent> ;la :<C-u>:Unite<Space>file_rec/async -buffer-name=files<CR>
nnoremap <silent> ;l :<C-u>Unite<Space>file -buffer-name=files file<CR>
nnoremap <silent> ;h :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> ;n :<C-u>Unite<Space>file/new<CR>
""Zencoding
let g:user_zen_expandabbr_key='<<'
""PEP8
let g:pep8_map='<F5>'
""pyflakes
let pyflakes_use_quickfix = 0

syntax on
filetype plugin indent on
