nnoremap [LSP] <Nop>
nmap <Space>l [LSP]

nnoremap <silent> [LSP]f :<C-u>LspDocumentFormat<CR>
nnoremap <silent> [LSP]g :<C-u>LspDocumentDiagnostics<CR>

nmap <silent> gd <Plug>(lsp-peek-definition)
nmap <silent> gD <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-peek-type-definition)
nmap <silent> gY <Plug>(lsp-type-definition)
nmap <silent> gi <Plug>(lsp-peek-implementation)
nmap <silent> gI <Plug>(lsp-implementation)
nmap <silent> gn <Plug>(lsp-rename)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> ]w <Plug>(lsp-next-diagnostic)
nmap <silent> [w <Plug>(lsp-previous-diagnostic)
nmap <silent> ]e <Plug>(lsp-next-error)
nmap <silent> [e <Plug>(lsp-previous-error)
nmap <silent> K <Plug>(lsp-hover)

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_documentation_float = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand(g:vim_home . '/vim-lsp.log')

" python-language-server
if executable('pyls')
  au User lsp_setup call lsp#register_server({
        \   'name': 'pyls',
        \   'cmd': {server_info->['pyls']},
        \   'whitelist': ['python'],
        \   'workspace_config': {
        \     'pyls': {
        \       'configurationSources': ['flake8'],
        \       'plugins': {
        \         'pycodestyle': {
        \           'enabled': v:false
        \         },
        \         'pyls_mypy': {
        \           'enabled': v:true,
        \           'live_mode': v:false,
        \         },
        \         'pyls_isort': {
        \           'enabled': v:true,
        \         },
        \         'pyls_black': {
        \           'enabled': v:true,
        \         },
        \       },
        \     },
        \   },
        \ })
  au FileType python setlocal omnifunc=lsp#complete
endif
