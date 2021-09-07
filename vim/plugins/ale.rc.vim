nnoremap [ALE] <Nop>
nmap <Space>a [ALE]
nnoremap <silent> [ALE]f :<C-u>ALEFix<CR>
nnoremap <silent> [ALE]r :<C-u>ALERename<CR>
nnoremap <silent> [ALE]d :<C-u>ALEGoToDefinition<CR>
nnoremap <silent> [ALE]t :<C-u>ALETypeDefinitions<CR>
nnoremap <silent> [ALE]l :<C-u>ALELint<CR>
nnoremap <silent> [ALE]i :<C-u>ALEDetail<CR>
nnoremap <silent> [ALE]n :<C-u>ALENextWrap<CR>
nnoremap <silent> [ALE]p :<C-u>ALEPreviousWrap<CR>

nmap <silent> [[e <Plug>(ale_previous_wrap_error)
nmap <silent> ]]e <Plug>(ale_next_wrap_error)
nmap <silent> [[w <Plug>(ale_previous_wrap)
nmap <silent> ]]w <Plug>(ale_next_wrap)

let g:ale_linters = {
    \ 'python': ['pydocstyle', 'pylint', 'pyright', 'flake8', 'mypy'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'markdown': ['textlint'],
    \ }

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['autopep8', 'black', 'isort', 'yapf'],
    \ 'javascript': ['prettier','eslint'],
    \ 'typescript': ['prettier','eslint'],
    \ 'javascriptreact': ['prettier','eslint'],
    \ 'typescriptreact': ['prettier','eslint'],
    \ 'json': ['prettier', 'jq'],
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
    \ 'html': ['prettier'],
    \ }

let g:ale_enabled = 1
let g:ale_fix_on_save = 0
" let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] (%code%)'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
"     \ 'priority': 10,
"     \ }))

" javascript
" let g:ale_javascript_eslint_options = '--fix'
