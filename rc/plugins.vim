" ==============================
"           Plugins
" ==============================
" set rtp+=~/.vim/

call plug#begin(g:vimrc_root_dir."/bundle")
    " start page
    " Plug 'mhinz/vim-startify'
    " scroll smoothly
    Plug 'psliwka/vim-smoothie'
    " window manager
    " Plug 'dstein64/vim-win'
    " calendar
    " Plug 'itchyny/calendar.vim'
    " highlight mutiword, <leader>k <leader>K
    Plug 'lfv89/vim-interestingwords'
    " a beautiful stats bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " show tags in sidebar
    Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
    " show file tree in sidebar
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    " LeaderF
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    " git 
    Plug 'tpope/vim-fugitive'
    " show modification
    Plug 'airblade/vim-gitgutter'
    " like gitlens in vscode
    " Plug 'APZelos/blamer.vim'
    " auto pair
    Plug 'jiangmiao/auto-pairs'
    " move fastly
    Plug 'easymotion/vim-easymotion'
    " comment
    Plug 'preservim/nerdcommenter'
    Plug 'mg979/vim-visual-multi'
    Plug 'junegunn/vim-easy-align'
    " a spacevim theme
    " Plug 'liuchengxu/space-vim-dark'
    Plug 'morhetz/gruvbox'
    " debug
    Plug 'puremourning/vimspector'
    " gtest
    Plug 'alepez/vim-gtest'
    " rust
    Plug 'rust-lang/rust.vim'

    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " tag using lsp
    " Plug 'liuchengxu/vista.vim'
    " use ALE for lint
    Plug 'dense-analysis/ale'
    " Plug 'prabirshrestha/vim-lsp'
    Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['cpp', 'c'] }
    " switch header and execute 'source' files
    " Plug 'vim-scripts/a.vim', { 'for': ['cpp', 'c'] }

    " install gotags for tagbar
    " go get -u github.com/jstemmer/gotags
    " or brew install gotags
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " manage snips
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    " Install a Nerd Font compatible font or patch your own
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'octol/vim-cpp-enhanced-highlight'
    " replacement for octol/vim-cpp-enhanced-highlight
    " Plug 'bfrg/vim-cpp-modern' 
    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'skywind3000/asyncrun')
    " Plug 'frazrepo/vim-rainbow'
    " Plug 'vim-scripts/c')
    " Plug 'ycm-core/YouCompleteMe'
    " clang-format not good
    " Plugin 'rhysd/vim-clang-format'
    
    Plug 'godlygeek/tabular'
    " tex
    Plug 'lervag/vimtex'
    " markdown
    Plug 'ferrine/md-img-paste.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'joker1007/vim-markdown-quote-syntax'
    Plug 'vimwiki/vimwiki'
    Plug 'sotte/presenting.vim'
    " like vscode's zen mode
    Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

    Plug 'ianding1/leetcode.vim'
call plug#end()

let s:path = fnamemodify(resolve(expand('<sfile>:p')),':h')

call utils#source(s:path, 'plugins/airline')
call utils#source(s:path, 'plugins/ale')
call utils#source(s:path, 'plugins/autopair')
call utils#source(s:path, 'plugins/gitgutter')
call utils#source(s:path, 'plugins/leaderf')
call utils#source(s:path, 'plugins/lsp-cxx-highlight')
call utils#source(s:path, 'plugins/mdimgpaste')
call utils#source(s:path, 'plugins/nerdcommenter')
call utils#source(s:path, 'plugins/nerdtree')
call utils#source(s:path, 'plugins/tagbar')
call utils#source(s:path, 'plugins/ultisnips')
call utils#source(s:path, 'plugins/vim-markdown')
call utils#source(s:path, 'plugins/vim-markdown-toc')
call utils#source(s:path, 'plugins/vimtex')
call utils#source(s:path, 'plugins/vimwiki')
call utils#source(s:path, 'plugins/vim-go')
" call utils#source(s:path, 'plugins/vim-win')

let g:interestingWordsGUIColors = ['#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b', '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']

