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
  set runtimepath+=$HOME/.vim
endif

"Terminal
set ttyfast

"Clipboard
set clipboard+=unnamed
set clipboard+=unnamedplus

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
if !has("nvim")
  set ttymouse=xterm2
endif
set guioptions+=a

"Status
set showcmd
set showmode
set laststatus=2
set modelines=0
set cmdheight=1
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
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"highlight clear CursorLine
"highlight CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black
"highlight DiffAdd    ctermfg=1 ctermbg=none
"highlight DiffChange ctermfg=3 ctermbg=none
"highlight DiffDelete ctermfg=4 ctermbg=none
"highlight DiffText   ctermfg=8 ctermbg=none

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

""Spacing after commma
inoremap , ,<Space>
"" Remove blank when close.
autocmd BufWritePre * :%s/\s\+$//ge

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
""Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
""Theme: solarized
if has('mac')
  let g:airline_theme = 'solarized'
  let g:airline_solarized_bg = 'dark'
endif
""ALE
let g:ale_completion_enabled = 1
let g:ale_python_flake8_change_directory = 'file'
let g:ale_sign_error = '**'
let g:ale_sign_warning = '!!'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s (%code%)'
let g:ale_javascript_prettier_use_local_config = 1
""" https://github.com/w0rp/ale/issues/925
let g:ale_linters = {}
let g:ale_linters['bash'] = ['shellcheck']
let g:ale_linters['css'] = ['eslint', 'stylelint']
let g:ale_linters['dockerfile'] = ['hadolint']
let g:ale_linters['go'] = ['gopls']
let g:ale_linters['html'] = ['eslint']
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['json'] = ['jsonlint']
let g:ale_linters['python'] = ['flake8']
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_linters['scss'] = ['stylelint']
let g:ale_linters['sql'] = ['sqlint']
let g:ale_linters['terraform'] = ['terraform']
let g:ale_linters['typescript'] = ['eslint']
let g:ale_linters['yaml'] = ['yamllint']
let g:ale_fixers = {}
let g:ale_fixers['bash'] = ['shfmt']
let g:ale_fixers['css'] = ['prettier', 'eslint']
let g:ale_fixers['go'] = ['gofmt']
let g:ale_fixers['html'] = ['prettier', 'eslint']
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['json'] = ['prettier', 'eslint']
let g:ale_fixers['python'] = ['autopep8', 'autoflake']
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_fixers['scss'] = ['prettier', 'stylelint']
let g:ale_fixers['sql'] = ['sqlfmt']
let g:ale_fixers['typescript'] = ['prettier', 'eslint']
let g:ale_fixers['terraform'] = ['terraform']
let g:ale_fixers['yaml'] = ['yamlfix']
let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200

""CtrlP
nnoremap <silent> ;; :CtrlPBuffer<CR>
nnoremap <silent> :: :CtrlP<CR>
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat^=%f:%l:%c:%m

  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
  let g:ctrlp_use_caching = 0
endif

""gitgutter
if has('mac')
  let g:gitgutter_override_sign_column_highlight = 0
endif

""indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

""LSP
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

""Shutup
function s:ale_eslint_format(...)
  if &ft !~ 'typescript'
    return ''
  endif
  let value = a:000[0]
  let position = a:000[1]
  if position == 'upper' " Insert ignore into above current line.
    return printf('// eslint-disable-next-line %s', value)
  endif
  " Insert ignore into same line
  return printf(' // eslint-disable-line %s', value)
endfunction
function s:ale_py_format(...)
  if &ft !~ 'python'
    return ''
  endif
  let value = a:000[0]
  return printf('  # noqa: %s', a:000[0])
endfunction

let g:shutup_patterns = {
\ '[eslint].*(\zs.*\ze)': function('s:ale_eslint_format'),
\ '(\zs.*\ze)': function('s:ale_py_format'),
\ }

""Terraform
let g:terraform_fmt_on_save = 1

"Colors
""solarized8
if has('mac')
  set background=dark
  colorscheme solarized8
endif
syntax on
filetype plugin indent on
