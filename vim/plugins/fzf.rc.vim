nnoremap [Fzf] <Nop>
nmap <Space>f [Fzf]

nnoremap <silent> [Fzf]f :<C-u>Files<CR>
nnoremap <silent> [Fzf]g :<C-u>GFiles<CR>
nnoremap <silent> [Fzf]s :<C-u>GFiles?<CR>
nnoremap <silent> [Fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [Fzf]c :<C-u>Commits<CR>
nnoremap <silent> [Fzf]l :<C-u>Lines<CR>
nnoremap <silent> [Fzf]m :<C-u>History<CR>
nnoremap <silent> [Fzf]a :<C-u>Ag<CR>
nnoremap <silent> [Fzf]t :call #vim#tags("'" . expand('<cword>'))<CR>
nnoremap <silent> [Fzf]h :<C-u>Helptags<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.nvim/fzf-history'

let g:fzf_buffers_jump = 1

if has('nvim') && has('mac')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
          \ 'row': (&lines - height) / 2,
          \ 'col': (&columns - width) / 2,
          \ 'width': width,
          \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
