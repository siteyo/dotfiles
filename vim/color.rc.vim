" ========================================================================
" COLOR
" ========================================================================
set t_Co=256
hi clear CursorLine

if has_key(g:plugs, 'vim-easymotion')
  hi EasyMotionTarget guifg=#00a0f0 guibg=NONE
  hi EasyMotionTarget2First guifg=#00a0f0 guibg=NONE
  hi EasyMotionTarget2Second guifg=#f0a000 guibg=NONE
  hi EasyMotionShade guifg=#aaaaaa guibg=NONE
endif
