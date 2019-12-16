nnoremap [ALE] <Nop>
nmap <Space>a [ALE]
nnoremap <silent> [ALE]f :<C-u>ALEFindReferences<CR>
nnoremap <silent> [ALE]r :<C-u>ALERename<CR>
nnoremap <silent> [ALE]d :<C-u>ALEGoToDefinition<CR>
nnoremap <silent> [ALE]t :<C-u>ALETypeDefinitions<CR>
nnoremap <silent> [ALE]h :<C-u>ALEHover<CR>
nnoremap <silent> [ALE]n :<C-u>ALENext<CR>
nnoremap <silent> [ALE]p :<C-u>ALEPrevious<CR>
nnoremap <silent> [ALE]l :<C-u>ALELint<CR>
nnoremap <silent> [ALE]i :<C-u>ALEDetail<CR>

let g:ale_linters = {
    \ 'python': ['flake8', 'pyls', 'mypy'],
    \ 'javascript': ['eslint', 'tsserver'],
    \ 'typescript': ['eslint', 'tsserver'],
    \ 'javascriptreact': ['eslint', 'tsserver'],
    \ 'typescriptreact': ['eslint', 'tsserver'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ }

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ 'javascript': ['prettier'],
    \ 'typescript': ['prettier'],
    \ 'javascriptreact': ['prettier'],
    \ 'typescriptreact': ['prettier'],
    \ 'json': ['prettier'],
    \ 'css': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'html': ['prettier'],
    \ }

let g:ale_python_flake8_options = '--ignore=E501,W503,W504'

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

let g:ale_python_pyls_config = {
    \   'pyls': {
    \     'plugins': {
    \       'pycodestyle': {
    \         'ignore': ['E501', 'W503', 'W504']
    \       }
    \     }
    \   },
    \ }
