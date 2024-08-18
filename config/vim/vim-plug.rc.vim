" ========================================================================
" INSTALL VIM-PLUG
" ========================================================================
let s:plug_dir = expand(g:vim_data . '/vim-plug')
let s:plug_autoload_dir = expand(s:plug_dir . '/autoload')
let s:plug_repo_dir = expand(g:vim_data . '/plugins')

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

" ========================================================================
" LIST OF PLUGINS
" ========================================================================
call plug#begin(s:plug_repo_dir)

" ------------------------------------------------------------------------
" Filer
" ------------------------------------------------------------------------
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-mapping-project-top.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-mapping-git.vim'
Plug 'yuki-yano/fern-preview.vim'

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
Plug 'editorconfig/editorconfig-vim'
Plug 'machakann/vim-highlightedyank'

" ------------------------------------------------------------------------
" Completion
" ------------------------------------------------------------------------
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-emmet.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" ------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------
if has('win32')
  Plug 'ctrlpvim/ctrlp.vim' | Plug 'mattn/ctrlp-register'
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

" ------------------------------------------------------------------------
" Lint / Formatter
" ------------------------------------------------------------------------
" Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'

" ------------------------------------------------------------------------
" Language
" ------------------------------------------------------------------------
Plug 'vim-jp/vimdoc-ja'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color', {'for': ['css']}

" ------------------------------------------------------------------------
" Util
" ------------------------------------------------------------------------
Plug 'previm/previm' | Plug 'tyru/open-browser.vim'
Plug 'mattn/emmet-vim', {'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'html'] }
Plug 'mattn/vim-sonictemplate'
Plug 'mattn/vim-maketable'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'thinca/vim-quickrun'
Plug 'vim-test/vim-test'

" ------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------
Plug 'kana/vim-submode'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-edgemotion'
Plug 'schickling/vim-bufonly', {'on': 'BufOnly'}

" ------------------------------------------------------------------------
" Git
" ------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim', {'on': 'GV'}

" ------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------
Plug 'cocopon/iceberg.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'joshdick/onedark.vim'

" ------------------------------------------------------------------------
" Other
" ------------------------------------------------------------------------
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

" ========================================================================
" PLUGINS SETTING
" ========================================================================

" ------------------------------------------------------------------------
" Colorscheme
" ------------------------------------------------------------------------
" iceberg
if has_key(g:plugs, 'iceberg.vim')
  colorscheme iceberg

  if has_key(g:plugs, 'coc.nvim')
    hi! CocErrorFloat ctermfg=203 ctermbg=236 guifg=#e27878 guibg=#3d425b
  endif
endif

" ------------------------------------------------------------------------
" Filer
" ------------------------------------------------------------------------
" fern
if has_key(g:plugs, 'fern.vim')
  execute 'source' expand(g:vim_config . '/plugins/fern.rc.vim')
endif

" ------------------------------------------------------------------------
" Edit
" ------------------------------------------------------------------------
" easyalign
if has_key(g:plugs, 'vim-easy-align')
  execute 'source' expand(g:vim_config . '/plugins/easyalign.rc.vim')
endif

" auto-pairs
" if has_key(g:plugs, 'auto-pairs')
"   let g:AutoPairsFlyMode = 1
" endif

" Comment.nvim
if has_key(g:plugs, 'Comment.nvim')
  execute 'source' expand(g:vim_config . '/plugins/comment.rc.vim')
endif

" ------------------------------------------------------------------------
" Completion
" ------------------------------------------------------------------------
" coc
if has_key(g:plugs, 'coc.nvim')
  execute 'source' expand(g:vim_config . '/plugins/coc.rc.vim')
endif

" deoplete
if has_key(g:plugs, 'deoplete.nvim')
  execute 'source' expand(g:vim_config . '/plugins/deoplete.rc.vim')
endif

" asyncomplete
if has_key(g:plugs, 'asyncomplete.vim')
  execute 'source' expand(g:vim_config . '/plugins/asyncomplete.rc.vim')
endif

" asyncomplete-emmet
if has_key(g:plugs, 'asyncomplete-emmet.vim')
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
        \ 'name': 'emmet',
        \ 'priority': 4,
        \ 'whitelist': ['html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
        \ 'completor': function('asyncomplete#sources#emmet#completor'),
        \ }))
endif

" asyncomplete-buffer
if has_key(g:plugs, 'asyncomplete-buffer.vim')
  call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'priority': 5,
        \ 'allowlist': ['*'],
        \ 'blocklist': ['go'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ 'config': {
        \    'max_buffer_size': 5000000,
        \  },
        \ }))
endif

" asyncomplete-file
if has_key(g:plugs, 'asyncomplete-file.vim')
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'priority': 3,
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#file#completor')
        \ }))
endif

" asyncomplete-emoji
if has_key(g:plugs, 'asyncomplete-emoji.vim')
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
      \ 'name': 'emoji',
      \ 'allowlist': ['md'],
      \ 'completor': function('asyncomplete#sources#emoji#completor'),
      \ }))
endif

" vim-lsp
if has_key(g:plugs, 'vim-lsp')
  execute 'source' expand(g:vim_config . '/plugins/vim-lsp.rc.vim')
endif

" vim-lsp-settings
if has_key(g:plugs, 'vim-lsp-settings')
  execute 'source' expand(g:vim_config . '/plugins/vim-lsp-settings.rc.vim')
endif

if has_key(g:plugs, 'vim-vsnip')
  execute 'source' expand(g:vim_config . '/plugins/vim-vsnip.rc.vim')
endif

" ------------------------------------------------------------------------
" Interface
" ------------------------------------------------------------------------
" fzf
if has_key(g:plugs, 'fzf.vim')
  execute 'source' expand(g:vim_config . '/plugins/fzf.rc.vim')
endif

" ctrlp
if has_key(g:plugs, 'ctrlp.vim')
  execute 'source' expand(g:vim_config . '/plugins/ctrlp.rc.vim')
endif

" vim-airline
if has_key(g:plugs, 'vim-airline')
  execute 'source' expand(g:vim_config . '/plugins/vim-airline.rc.vim')
endif

" vim-airline-themes
if has_key(g:plugs, 'vim-airline-themes')
  let g:airline_theme='iceberg'
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
  execute 'source' expand(g:vim_config . '/plugins/limelight.rc.vim')
endif

" ------------------------------------------------------------------------
" Lint / Formatter
" ------------------------------------------------------------------------
" ale
if has_key(g:plugs, 'ale')
  execute 'source' expand(g:vim_config . '/plugins/ale.rc.vim')
endif

" Neoformat
if has_key(g:plugs, 'neoformat')
  execute 'source' expand(g:vim_config . '/plugins/neoformat.rc.vim')
endif

" ------------------------------------------------------------------------
" Language
" ------------------------------------------------------------------------
if has_key(g:plugs, 'vim-polyglot')
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
endif

" nvim-treesitter
if has_key(g:plugs, 'nvim-treesitter')
  execute 'source' expand(g:vim_config . '/plugins/nvim-treesitter.rc.vim')
endif

" ------------------------------------------------------------------------
" Util
" ------------------------------------------------------------------------
" emmet-vim
if has_key(g:plugs, 'emmet-vim')
  execute 'source' expand(g:vim_config . '/plugins/emmet.rc.vim')
endif

" vim-table-mode
if has_key(g:plugs, 'vim-table-mode')
  let g:table_mode_corner = '|'
endif

if has_key(g:plugs, 'vim-sonictemplate')
  let g:sonictemplate_vim_template_dir = [
    \ expand(g:vim_data . '/plugins/vim-sonictemplate/template'),
    \ expand(g:vim_config . '/templates'),
    \ ]
endif

" ------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------
" vim-submode
if has_key(g:plugs, 'vim-submode')
  execute 'source' expand(g:vim_config . '/plugins/submode.rc.vim')
endif

" vim-easymotion
if has_key(g:plugs, 'vim-easymotion')
  execute 'source' expand(g:vim_config . '/plugins/easymotion.rc.vim')
endif

" vim-edgemotion
if has_key(g:plugs, 'vim-edgemotion')
  map <C-j> <Plug>(edgemotion-j)
  map <C-k> <Plug>(edgemotion-k)
endif

" ------------------------------------------------------------------------
" Git
" ------------------------------------------------------------------------
nnoremap [GitPlug] <Nop>
nmap <Space>g [GitPlug]

" vim-fugitive
if has_key(g:plugs, 'vim-fugitive')
  execute 'source' expand(g:vim_config . '/plugins/fugitive.rc.vim')
endif

" vim-gitgutter
if has_key(g:plugs, 'vim-gitgutter')
  execute 'source' expand(g:vim_config . '/plugins/gitgutter.rc.vim')
endif

" gv.vim
if has_key(g:plugs, 'gv.vim')
  nnoremap <silent> [GitPlug]v :<C-u>GV --all<CR>
endif

" ========================================================================
