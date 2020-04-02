nnoremap [LSP] <Nop>
nmap <Space>l [LSP]

" nnoremap <silent> [LSP]i <Plug>(lsp-implementation)
nnoremap <silent> [LSP]f <Plug>(lsp-document-format)
" nnoremap <silent> [LSP]d <Plug>(lsp-definition)
" nnoremap <silent> [LSP]y <Plug>(lsp-implementation)
nnoremap <silent> [LSP]g <Plug>(lsp-document-diagnostics)

nmap <silent> gd <Plug>(lsp-peek-definition)
nmap <silent> gD <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-peek-type-definition)
nmap <silent> gY <Plug>(lsp-type-definition)
nmap <silent> gi <Plug>(lsp-peek-implementation)
nmap <silent> gI <Plug>(lsp-implementation)
nmap <silent> gn <Plug>(lsp-rename)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> ga <Plug>(lsp-hover)
nmap <silent> ]g <Plug>(lsp-next-diagnostic)
nmap <silent> [g <Plug>(lsp-previous-diagnostic)
nmap <silent> ]e <Plug>(lsp-next-error)
nmap <silent> [e <Plug>(lsp-previous-error)

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand(g:vim_home . '/vim-lsp.log')
