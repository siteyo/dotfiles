let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }
let g:ctrlp_custom_ignore = {
      \ 'file': '\v(\.cpp|\.h|\.hh|\.cxx)@<!$'
      \ }
let g:ctrlp_custom_ignore = {
      \ 'func': 'some#custom#match_function'
      \ }
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
