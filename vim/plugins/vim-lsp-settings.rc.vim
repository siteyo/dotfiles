let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']

let g:lsp_settings = {
\   'pyls': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8'],
\         'plugins': {
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
\       }
\     }
\   },
\}
