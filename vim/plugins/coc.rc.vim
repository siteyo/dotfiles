" general
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_global_extensions=[
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-python',
  \ 'coc-stylelint',
  \ 'coc-tabnine',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ ]

" mapping
inoremap <silent><expr> <C-y> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)

nnoremap [Coc] <Nop>
nmap <Space>o [Coc]
nnoremap <silent> [Coc]f :<C-u>call CocAction('format')<CR>
nnoremap <silent> [Coc]e :<C-u>CocList diagnostics<CR>
nnoremap <silent> [Coc]x :<C-u>CocList extensions<CR>
nnoremap <silent> [Coc]c :<C-u>CocList commands<CR>
nnoremap <silent> [Coc]d :<C-u>CocDiagnostics<CR>
nnoremap <silent> [Coc]a :<C-u>CocAction<CR>

" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" color
hi! link CocErrorSign ErrorMsg
