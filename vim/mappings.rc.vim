"""" Key mapping

" Normal mode
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>
noremap <S-h>   ^
" noremap <S-j>   }
" noremap <S-k>   {
noremap <S-l>   $
nnoremap s <Nop>
" noremap j gj
" noremap k gk
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap s= <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>q!<CR>
nnoremap sd :<C-u>bd<CR>
nnoremap sD :<C-u>bd!<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap x "_x

" Insert mode
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <silent> jj <ESC>
inoremap <silent> j<Space> j

" Terminal mode
tnoremap <C-n><C-n> <C-\><C-n>

" Visual mode
vnoremap x "_x

" Operator
onoremap 8 i(
onoremap 2 i"
onoremap 7 i'
onoremap @ i`
onoremap [ i[
onoremap { i{
onoremap a8 a(
onoremap a2 a"
onoremap a7 a'
onoremap a@ a`
