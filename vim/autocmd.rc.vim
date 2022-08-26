" ========================================================================
" AUTOCMD
" ========================================================================

" ------------------------------------------------------------------------
" vimrc
" ------------------------------------------------------------------------
augroup vimrc
  au FileType vim setlocal tabstop=2 foldlevel=0 foldmethod=marker
  au FileType python setlocal tabstop=4 foldmethod=indent foldlevel=1
  au FileType make setlocal tabstop=4 noexpandtab
augroup END

" ------------------------------------------------------------------------
" yank
" ------------------------------------------------------------------------
if system('uname -a | grep microsoft') != ''
  echo "Shared clipboard."
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

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


