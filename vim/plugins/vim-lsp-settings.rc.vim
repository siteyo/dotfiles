let g:lsp_settings_servers_dir = fnamemodify(g:vim_home . '/vim-lsp-settings/servers', ':p')
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']

let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8'],
\         'plugins': {
\           'pycodestyle': {
\             'enabled': v:false
\           },
\           'pyls_mypy': {
\             'enabled': v:true,
\             'live_mode': v:false,
\           },
\           'pyls_isort': {
\             'enabled': v:true,
\           },
\           'pyls_black': {
\             'enabled': v:true,
\           },
\         },
\       },
\     },
\   },
\}
