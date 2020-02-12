nnoremap [CtrlP] <Nop>
nmap <Space>f [CtrlP]

nnoremap [CtrlP]b :<C-u>CtrlPBuffer<CR>
nnoremap [CtrlP]f :<C-u>CtrlP<CR>
nnoremap [CtrlP]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [CtrlP]l :<C-u>CtrlPLine<CR>
nnoremap [CtrlP]u :<C-u>CtrlPUndo<CR>
nnoremap [CtrlP]o :<C-u>CtrlPBookmarkDir<CR>
nnoremap [CtrlP]r :<C-u>CtrlPRegister<CR>
nnoremap [CtrlP]c :<C-u>CtrlPChange<CR>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
let g:ctrlp_custom_ignore = {
      \ 'file': '\v(\.cpp|\.h|\.hh|\.cxx)@<!$'
      \ }
let g:ctrlp_custom_ignore = {
      \ 'func': 'some#custom#match_function'
      \ }
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
