nnoremap [LSP] <Nop>
nmap <Space>l [LSP]
nnoremap <silent> [LSP]i <Plug>(lsp-implementation)
nnoremap <silent> [LSP]f <Plug>(lsp-document-format)
nnoremap <silent> [LSP]d <Plug>(lsp-definition)
nnoremap <silent> [LSP]y <Plug>(lsp-implementation)
nnoremap <silent> [LSP]g <Plug>(lsp-document-diagnostics)

nmap <silent> gd <Plug>(lsp-peek-definition)
nmap <silent> gy <Plug>(lsp-peek-type-definition)
nmap <silent> gi <Plug>(lsp-peek-implementation)
nmap <silent> gn <Plug>(lsp-rename)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> ga <Plug>(lsp-hover)
nmap <silent> [g <Plug>(lsp-next-diagnostic)
nmap <silent> [g <Plug>(lsp-previous-diagnostic)
nmap <silent> [e <Plug>(lsp-next-error)
nmap <silent> ]e <Plug>(lsp-previous-error)

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose=1
let g:lsp_log_file = expand(g:vim_home . '/vim-lsp.log')

" autocmd! vimrc User lsp_setup call lsp#register_server({
"       \   'name': 'diagnostic-languageserver',
"       \   'cmd': { info -> ['diagnostic-languageserver', '--stdio'] },
"       \   'whitelist': [
"       \     'typescript',
"       \     'typescript.tsx',
"       \     'typescriptreact',
"       \     'javascript',
"       \     'javascript.jsx',
"       \     'javascriptreact',
"       \   ],
"       \   'initialization_options': {
"       \     'linters': {
"       \       'eslint': {
"       \         'sourceName': 'eslint',
"       \         'command': './node_modules/.bin/eslint',
"       \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
"       \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
"       \         'formatLines': 1,
"       \         'formatPattern': [
"       \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
"       \           {
"       \             'line': 1,
"       \             'column': 2,
"       \             'message': [4, ' [', 5, ']' ],
"       \             'security': 3
"       \           }
"       \         ],
"       \         'securities': {
"       \            'error': 'error',
"       \            'warning': 'warning'
"       \         },
"       \       },
"       \     },
"       \     'filetypes': {
"       \       'javascript': 'eslint',
"       \       'javascript.tsx': 'eslint',
"       \       'javascriptreact': 'eslint',
"       \       'typescript': 'eslint',
"       \       'typescript.tsx': 'eslint',
"       \       'typescriptreact': 'eslint',
"       \     },
"       \     'formatters': {
"       \       'eslint': {
"       \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
"       \         'command': 'eslint_d',
"       \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=%filename'],
"       \         'isStdout': v:true,
"       \         'isStderr': v:true,
"       \       }
"       \     },
"       \     'formatFiletypes': {
"       \       'javascript': 'eslint',
"       \       'javascript.tsx': 'eslint',
"       \       'javascriptreact': 'eslint',
"       \       'typescript': 'eslint',
"       \       'typescript.tsx': 'eslint',
"       \       'typescriptreact': 'eslint'
"       \     }
"       \   }
"       \ })
