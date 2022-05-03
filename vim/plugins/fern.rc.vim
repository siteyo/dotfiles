nnoremap [Fern] <Nop>
nmap <Space>e [Fern]

nnoremap <silent> [Fern]e :<C-u>Fern .<CR>
nnoremap <silent> [Fern]d :<C-u>Fern -drawer .<CR>

function! s:fern_settings() abort
  nmap <silent> <buffer> <S-s> <Plug>(fern-action-open:select)
  nmap <silent> <buffer> s Nop
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
