" ========================================================================
" AUTOCMD
" ========================================================================

" " ------------------------------------------------------------------------
" " pipenv(python)
" " ------------------------------------------------------------------------
" function! s:findRoot(target)
"   let dir = getcwd()
"   while 1
"     let files = split(globpath(l:dir, '*'), '\n')
"     for f in l:files
"       if a:target == fnamemodify(f, ':t')
"         return l:dir
"       endif
"     endfor
"     if l:dir == "/"
"       break
"     endif
"     let dir = fnamemodify(l:dir, ':h')
"   endwhile
"   return ""
" endfunction

" function! s:setVenv()
"   let dir = s:findRoot('Pipfile')
"   echo l:dir
"   if dir != ""
"     let $VIRTUAL_ENV = trim(system("cd " . l:dir . "; pipenv --venv"))
"   endif
" endfunction

" ------------------------------------------------------------------------
" vimrc
" ------------------------------------------------------------------------
augroup vimrc
  au FileType javascript setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType javascriptreact setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType typescript setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType typescriptreact setlocal tabstop=2 shiftwidth=0 expandtab
  au FileType vim setlocal tabstop=2 shiftwidth=0 expandtab foldlevel=0 foldmethod=marker
  " au FileType python call s:setVenv()
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
