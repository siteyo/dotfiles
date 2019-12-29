filetype plugin indent on
syntax enable

set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set cursorline
set tabstop=4
set shiftwidth=0
set backup
set number
set relativenumber
set autochdir
set clipboard=unnamed
set encoding=utf-8
set expandtab smarttab
set hidden
set autoread
set wildmenu
set wildignorecase
set ignorecase smartcase
set conceallevel=0
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set foldenable
set foldlevelstart=99
set noswapfile
set termguicolors
set virtualedit+=block
set nohlsearch
set updatetime=300
set signcolumn=yes
set cmdheight=2
set shortmess+=c
set showtabline=2

if has('nvim') && ( has('mac') || has('win32') )
  set winblend=15
  set pumblend=15
endif

set tags=.tags;~

let &backupdir = expand(g:vim_home . 'backup/')
let &directory = expand(g:vim_home . 'swap/')

set noundofile
if has('persistent_undo')
  let &undodir = expand(g:vim_home . 'undo/')
  set undofile
endif
