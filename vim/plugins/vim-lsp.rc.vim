nnoremap [LSP] <Nop>
nmap <Space>l [LSP]
nnoremap <silent> [LSP]d :<C-u>LspDefinition<CR>
nnoremap <silent> [LSP]r :<C-u>LspReferences<CR>
nnoremap <silent> [LSP]n :<C-u>LspRename<CR>
nnoremap <silent> [LSP]i :<C-u>LspImplementation<CR>
nnoremap <silent> [LSP]h :<C-u>LspHover<CR>

let g:lsp_diagnostics_enabled = 0

nnoremap <silent> gd <Plug>(lsp-definition)
nnoremap <silent> gy <Plug>(lsp-type-definition)
nnoremap <silent> gi <Plug>(lsp-implementation)
nnoremap <silent> gn <Plug>(lsp-rename)
nnoremap <silent> gr <Plug>(lsp-references)
nnoremap <silent> ga <Plug>(lsp-hover)
