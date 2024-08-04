" general
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-python',
  \ 'coc-stylelint',
  \ 'coc-tabnine',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ ]

" commands
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" mapping
inoremap <silent><expr> <C-y> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent> gD :call CocAction('jumpDefinition', v:false)<CR>
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
nmap <Space>l [Coc]
nnoremap <silent> [Coc]l :<C-u>CocFzfList<Cr>
nnoremap <silent> [Coc]e :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> [Coc]x :<C-u>CocFzfList extensions<CR>
nnoremap <silent> [Coc]c :<C-u>CocFzfList commands<CR>
nnoremap <silent> [Coc]o :<C-u>CocFzfListResume<CR>
nnoremap <silent> [Coc]d :<C-u>CocDiagnostics<CR>
nnoremap <silent> [Coc]a :<C-u>CocAction<CR>
nnoremap <silent> [Coc]p :<C-u>CocFzfList outline<CR>

" coc-snippets
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" color
hi! link CocErrorSign ErrorMsg
