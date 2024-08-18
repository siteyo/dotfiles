" ========================================================================
" BASIC SETTINGS
" ========================================================================
filetype plugin indent on
syntax enable

set autoindent
set smartindent
set lazyredraw
set laststatus=2
set showcmd
set cursorline
set tabstop=2
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
set hlsearch
set incsearch
set updatetime=300
set cmdheight=2
set shortmess+=c
set showtabline=2
set background=dark
set scrolloff=4
set signcolumn=yes
set nowrap

if has('nvim')
  set winblend=15
  set pumblend=15
endif

set tags=.tags;~

let &backupdir = expand(g:vim_data . '/backup')
let &directory = expand(g:vim_data . '/swap')

set noundofile
if has('persistent_undo')
  let &undodir = expand(g:vim_data . '/undo')
  set undofile
endif

if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif
