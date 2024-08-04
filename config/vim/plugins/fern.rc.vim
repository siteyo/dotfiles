nnoremap [Fern] <Nop>
nmap <Space>e [Fern]

nnoremap <silent> [Fern]e :<C-u>Fern .<CR>
nnoremap <silent> [Fern]d :<C-u>Fern -drawer .<CR>

function! s:fern_settings() abort
  " change default mapping
  nmap <silent> <buffer> <S-s> <Plug>(fern-action-open:select)
  nmap <silent> <buffer> s Nop
  if has('unix')
    nmap <silent> <buffer> <S-d> <Plug>(fern-action-remove)
  endif
  " fern-preview
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
