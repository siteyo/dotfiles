nnoremap [LSP] <Nop>
nmap <Space>l [LSP]
nnoremap <silent> [LSP]d :<C-u>LspDefinition<CR>
nnoremap <silent> [LSP]r :<C-u>LspReferences<CR>
nnoremap <silent> [LSP]n :<C-u>LspRename<CR>
nnoremap <silent> [LSP]i :<C-u>LspImplementation<CR>
nnoremap <silent> [LSP]h :<C-u>LspHover<CR>


let g:lsp_diagnostics_enabled = 0

augroup MyJsLsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'javascript support using typescript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
            \ 'whitelist': ['javascript', 'javascriptreact', 'typescript', 'typescript.tsx'],
            \ })
augroup end

augroup MyPyLsp
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
            \ })
augroup END
