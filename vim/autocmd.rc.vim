" ========================================================================
" AUTOCMD
" ========================================================================

" ------------------------------------------------------------------------
" vimrc
" ------------------------------------------------------------------------
augroup vimrc
  " au FileType javascript setlocal tabstop=2 shiftwidth=0 expandtab
  " au FileType javascriptreact setlocal tabstop=2 shiftwidth=0 expandtab
  " au FileType typescript setlocal tabstop=2 shiftwidth=0 expandtab
  " au FileType typescriptreact setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType vim setlocal foldlevel=0 foldmethod=marker
  " au FileType json setlocal tabstop=2 shiftwidth=0 expandtab
  " au FileType css setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType python setlocal tabstop=4
augroup END

" ------------------------------------------------------------------------
" ctags
" ------------------------------------------------------------------------
function! s:execute_ctags() abort
  let tag_name = '.tags'
  let tags_path = findfile(tag_name, '.;')
  if tags_path ==# ''
    return
  endif

  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  execute 'silent cd' tags_dirpath
  execute 'silent !ctags -R -f' tag_name
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END
