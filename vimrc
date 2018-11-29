" =============== plugins ============= "
" enable pathogen
execute pathogen#infect()
filetype plugin indent on


" =============== general ============= "
if filereadable('/bin/zsh')
  set shell=/bin/zsh
endif

syntax on					" syntax highligting
set nocompatible

set ruler					" show row/col info
set number					" show line numbers

" indentation
set backspace=eol,start,indent
set autoindent
set smartindent

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" search
set ignorecase              " case-insensitive by default
set smartcase               " case-sensitive if keyword contains both uppercase and lowercase
set incsearch				" incremental search
set hlsearch				" highlight search keyword

" color settings
set t_Co=256
set background=dark
colorscheme xoria256

" copy-paste
set pastetoggle=<F8>		" this will disable auto indent when pasting
autocmd InsertLeave * silent! set nopaste " unset paste when leaving insert mode

" misc
set visualbell
set history=1000
set undolevels=1000
set noswapfile
set nobackup


" =============== functional ============= "
let mapleader=","           " comma is the <Leader> key.
let maplocalleader=","      " comma : <LocalLeader>

" nerdtree
" " browse file tree
map <Leader>N :NERDTreeToggle<CR>

" ipdb
:nnoremap <Leader>b Oimport ipdb; ipdb.set_trace()<Esc>
ab abip import ipdb; ipdb.set_trace()