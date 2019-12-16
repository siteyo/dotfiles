"""" vim-plug
let s:plug_dir = expand('~/.vim/vim-plug')
let s:plug_autoload_dir = s:plug_dir . '/autoload'
let s:plug_repo_dir = expand('~/.vim/plugins')

if has('vim_starting')
  let &runtimepath = s:plug_dir . ',' . &runtimepath
  if !isdirectory(s:plug_autoload_dir)
    echo 'install vim-plug...'
    call system('mkdir -p ' . s:plug_autoload_dir)
    call system('git clone https://github.com/junegunn/vim-plug.git ' . s:plug_autoload_dir)
  endif
  if !isdirectory(s:plug_repo_dir)
    call system('mkdir -p ' . s:plug_repo_dir)
  endif
endif

call plug#begin(s:plug_repo_dir)
  Plug 'junegunn/vim-plug', {'dir': '~/.vim/vim-plug/autoload'}
  Plug 'junegunn/vim-easy-align'
  if has('win32')
    Plug 'Shougo/denite.nvim' | Plug 'Shougo/neomru.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
  endif
  Plug 'Shougo/defx.nvim'
  " Plug 'Shougo/deoplete.nvim' | Plug 'tbodt/deoplete-tabnine'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/async.vim'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Plug 'prabirshrestha/asyncomplete-necovim.vim' | Plug 'Shougo/neco-vim'
  Plug 'cocopon/iceberg.vim', {'do': ':colorscheme iceberg'}
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kana/vim-submode'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  Plug 'kshenoy/vim-signature'
  Plug 'dense-analysis/ale'
  Plug 'easymotion/vim-easymotion'
  Plug 'lambdalisue/gina.vim'
  Plug 'andymass/vim-matchup'

  " Ondemand loading
  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/gv.vim', {'on': 'GV'}
  Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
  Plug 'mattn/emmet-vim', {'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html'] }
  " Plug 'Shougo/neco-vim', {'for': ['vim'] }
  Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
  Plug 'previm/previm', {'on': 'PrevimOpen'} | Plug 'tyru/open-browser.vim'
  Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
  Plug 'ap/vim-css-color', {'for': ['css']}
  Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
  Plug 'schickling/vim-bufonly', {'on': 'BufOnly'}
  Plug 'kien/rainbow_parentheses.vim', {'on': 'RainbowParenthesesToggle'}
call plug#end()

""" Plugins setting

" denite
if has_key(g:plugs, 'denite.nvim')
  source ~/dotfiles/vim/plugins/denite.rc.vim
endif

" defx
if has_key(g:plugs, 'defx.nvim')
  source ~/dotfiles/vim/plugins/defx.rc.vim
endif

" deoplete
if has_key(g:plugs, 'deoplete.nvim')
  source ~/dotfiles/vim/plugins/deoplete.rc.vim
endif

" fzf
if has_key(g:plugs, 'fzf.vim')
  source ~/dotfiles/vim/plugins/fzf.rc.vim
endif

" coc
if has_key(g:plugs, 'coc.nvim')
  source ~/dotfiles/vim/plugins/coc.rc.vim
endif

" onedark
" if has_key(g:plugs, 'onedark.vim')
"   colorscheme onedark
" endif
if has_key(g:plugs, 'iceberg.vim')
  colorscheme iceberg
endif


" vim-submode
if has_key(g:plugs, 'vim-submode')
  source ~/dotfiles/vim/plugins/submode.rc.vim
endif

" vim-fugitive
if has_key(g:plugs, 'vim-fugitive')
  source ~/dotfiles/vim/plugins/fugitive.rc.vim
endif

" vim-gitgutter
if has_key(g:plugs, 'vim-gitgutter')
  source ~/dotfiles/vim/plugins/gitgutter.rc.vim
endif

" indentLine
if has_key(g:plugs, 'indentLine')
  let g:indentLine_char_list = ['|', '¦']
endif

" vim-airline / vim-airline-themes
if has_key(g:plugs, 'vim-airline')
  source ~/dotfiles/vim/plugins/vim-airline.rc.vim
endif
if has_key(g:plugs, 'vim-airline-themes')
  let g:airline_theme='jellybeans'
endif

" ale
if has_key(g:plugs, 'ale')
  source ~/dotfiles/vim/plugins/ale.rc.vim
endif

" vim-easymotion
if has_key(g:plugs, 'vim-easymotion')
  source ~/dotfiles/vim/plugins/easymotion.rc.vim
endif

" emmet-vim
if has_key(g:plugs, 'emmet-vim')
  source ~/dotfiles/vim/plugins/emmet.rc.vim
endif

" vim-markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'

" undotree
if has_key(g:plugs, 'undotree')
  nnoremap U :UndotreeToggle<CR>
endif

" vim-table-mode
if has_key(g:plugs, 'vim-table-mode')
  let g:table_mode_corner = '|'
endif

" easyalign
if has_key(g:plugs, 'vim-easy-align')
  source ~/dotfiles/vim/plugins/easyalign.rc.vim
endif

" vim-lsp
if has_key(g:plugs, 'vim-lsp')
  source ~/dotfiles/vim/plugins/vim-lsp.rc.vim
endif

" asyncomplete
if has_key(g:plugs, 'asyncomplete.vim')
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
endif
