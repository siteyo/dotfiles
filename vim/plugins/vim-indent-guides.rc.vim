let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'git', 'nerdtree', 'denite', 'defx']

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd    guibg=#0000a5  ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven   guibg=#0041a5 ctermbg=140
