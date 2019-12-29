" ========================================================================
" INSTALL VIM-PLUG {{{
" ========================================================================

let s:plug_dir = expand(g:vim_home . 'vim-plug/')
let s:plug_autoload_dir = expand(s:plug_dir . 'autoload/')
let s:plug_repo_dir = expand(g:vim_home . 'plugins/')

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

" }}}
" ========================================================================
" LIST OF PLUGINS {{{
" ========================================================================
call plug#begin(s:plug_repo_dir)

" ------------------------------------------------------------------------
" Filer
" ------------------------------------------------------------------------
Plug 'Shougo/defx.nvim'
Plug 'cocopon/vaffle.vim'

" ------------------------------------------------------------------------
" Edit
" ------------------------------------------------------------------------
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/linediff.vim', {'on': 'Linediff'}
Plug 'tpope/vim-repeat'

" ------------------------------------------------------------------------
" Completion
" ------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" ------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------
if has('win32')
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/neomru.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
Plug 'kien/rainbow_parentheses.vim', {'on': 'RainbowParenthesesToggle'}

" ------------------------------------------------------------------------
" Lint
" ------------------------------------------------------------------------
Plug 'dense-analysis/ale'

" ------------------------------------------------------------------------
" Language
" ------------------------------------------------------------------------
Plug 'vim-jp/vimdoc-ja'
Plug 'sheerun/vim-polyglot'
Plug 'previm/previm', {'on': 'PrevimOpen'} | Plug 'tyru/open-browser.vim'
Plug 'mattn/emmet-vim', {'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html'] }
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'ap/vim-css-color', {'for': ['css']}

" ------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------
Plug 'kana/vim-submode'
Plug 'easymotion/vim-easymotion'
Plug 'schickling/vim-bufonly', {'on': 'BufOnly'}

" ------------------------------------------------------------------------
" Git
" ------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'
Plug 'junegunn/gv.vim', {'on': 'GV'}

" ------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'

" ------------------------------------------------------------------------
" Other
" ------------------------------------------------------------------------
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" }}}
" ========================================================================
" PLUGINS SETTING {{{
" ========================================================================

" ------------------------------------------------------------------------
" Filer
" ------------------------------------------------------------------------
" defx
if has_key(g:plugs, 'defx.nvim')
  source ~/dotfiles/vim/plugins/defx.rc.vim
endif

" ------------------------------------------------------------------------
" Edit
" ------------------------------------------------------------------------
" easyalign
if has_key(g:plugs, 'vim-easy-align')
  source ~/dotfiles/vim/plugins/easyalign.rc.vim
endif

" ------------------------------------------------------------------------
" Completion
" ------------------------------------------------------------------------
" coc
if has_key(g:plugs, 'coc.nvim')
  source ~/dotfiles/vim/plugins/coc.rc.vim
endif

" deoplete
if has_key(g:plugs, 'deoplete.nvim')
  source ~/dotfiles/vim/plugins/deoplete.rc.vim
endif

" asyncomplete
if has_key(g:plugs, 'asyncomplete.vim')
  source ~/dotfiles/vim/plugins/asyncomplete.rc.vim
endif

" vim-lsp
if has_key(g:plugs, 'vim-lsp')
  source ~/dotfiles/vim/plugins/vim-lsp.rc.vim
endif

" ------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------
" denite
if has_key(g:plugs, 'denite.nvim')
  source ~/dotfiles/vim/plugins/denite.rc.vim
endif

" fzf
if has_key(g:plugs, 'fzf.vim')
  source ~/dotfiles/vim/plugins/fzf.rc.vim
endif

" vim-airline
if has_key(g:plugs, 'vim-airline')
  source ~/dotfiles/vim/plugins/vim-airline.rc.vim
endif

" vim-airline-themes
if has_key(g:plugs, 'vim-airline-themes')
  let g:airline_theme='jellybeans'
endif

" indentLine
if has_key(g:plugs, 'indentLine')
  let g:indentLine_char_list = ['|', '¦']
endif

" undotree
if has_key(g:plugs, 'undotree')
  nnoremap U :UndotreeToggle<CR>
endif

" limelight
if has_key(g:plugs, 'limelight.vim')
  source ~/dotfiles/vim/plugins/limelight.rc.vim
endif

" ------------------------------------------------------------------------
" Lint
" ------------------------------------------------------------------------
" ale
if has_key(g:plugs, 'ale')
  source ~/dotfiles/vim/plugins/ale.rc.vim
endif

" ------------------------------------------------------------------------
" Language
" ------------------------------------------------------------------------
" emmet-vim
if has_key(g:plugs, 'emmet-vim')
  source ~/dotfiles/vim/plugins/emmet.rc.vim
endif

" vim-table-mode
if has_key(g:plugs, 'vim-table-mode')
  let g:table_mode_corner = '|'
endif

" previm
if has_key(g:plugs, 'previm')
  let g:previm_open_cmd = 'open -a Google\ Chrome'
endif

" ------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------
" vim-submode
if has_key(g:plugs, 'vim-submode')
  source ~/dotfiles/vim/plugins/submode.rc.vim
endif

" vim-easymotion
if has_key(g:plugs, 'vim-easymotion')
  source ~/dotfiles/vim/plugins/easymotion.rc.vim
endif

" ------------------------------------------------------------------------
" Git
" ------------------------------------------------------------------------
" vim-fugitive
if has_key(g:plugs, 'vim-fugitive')
  source ~/dotfiles/vim/plugins/fugitive.rc.vim
endif

" vim-gitgutter
if has_key(g:plugs, 'vim-gitgutter')
  source ~/dotfiles/vim/plugins/gitgutter.rc.vim
endif

" ------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------
" iceberg
if has_key(g:plugs, 'iceberg.vim')
  colorscheme iceberg
endif

" }}}
" ========================================================================
