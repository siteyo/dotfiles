nnoremap [LSP] <Nop>
nmap <Space>l [LSP]
nnoremap <silent> [LSP]d :<C-u>LspDefinition<CR>
nnoremap <silent> [LSP]r :<C-u>LspReferences<CR>
nnoremap <silent> [LSP]n :<C-u>LspRename<CR>
nnoremap <silent> [LSP]i :<C-u>LspImplementation<CR>
nnoremap <silent> [LSP]h :<C-u>LspHover<CR>

let g:lsp_diagnostics_enabled = 0
