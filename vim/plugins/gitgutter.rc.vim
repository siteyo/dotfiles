nnoremap [GitPlug] <Nop>
nmap <Space>g [GitPlug]

nnoremap <silent> [GitPlug]n :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [GitPlug]p :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent> [GitPlug]g :<C-u>GitGutter<CR>
nnoremap <silent> [GitPlug]a :<C-u>GitGutterStageHunk<CR>
nnoremap <silent> [GitPlug]l :<C-u>GitGutterPreviewHunk<CR>

omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
