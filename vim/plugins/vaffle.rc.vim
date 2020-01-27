nnoremap [Vaffle] <Nop>
nmap <Space>e [Vaffle]

nnoremap <silent> [Vaffle]e :<C-u>Vaffle<CR>

function! s:customize_vaffle_mappings() abort
  nmap <buffer> K        <Plug>(vaffle-mkdir)
  nmap <buffer> N        <Plug>(vaffle-new-file)
endfunction

augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END

" if has('nvim') && has('mac')
"   function! FloatingVaffle()
"     let width = float2nr(&columns * 0.6)
"     let height = float2nr(&lines * 0.6)
"     let opts = { 'relative': 'editor',
"           \ 'row': (&lines - height) / 2,
"           \ 'col': (&columns - width) / 2,
"           \ 'width': width,
"           \ 'height': height }

"     let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
"   endfunction
"   nnoremap <silent> [Vaffle]e :<C-u>call FloatingVaffle()<CR>&&:<C-u>Vaffle<CR>
" endif
