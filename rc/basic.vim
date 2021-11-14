set fileencoding=utf-8
set encoding=utf-8

set nocompatible
set backspace=2

set number
set autoindent
set smartindent

set laststatus=2
set hlsearch
set ignorecase
set ruler
set cursorline

set laststatus=2
set t_Co=256

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tags=./.tags;,.tags
set redrawtime=10000
syntax sync minlines=256
set colorcolumn=120
" set mouse=a

" set foldmethod=syntax
" set foldlevelstart=99
set nobackup
set nowritebackup

if (has("termguicolors") && $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

"tell number row to be transparent
highlight clear LineNr
highlight clear SignColumn


