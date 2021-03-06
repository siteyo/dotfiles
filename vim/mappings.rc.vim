" ========================================================================
" KEY MAPPING
" ========================================================================

" Disable arrow keys
" noremap <Up>    <Nop>
" noremap <Down>  <Nop>
" noremap <Left>  <Nop>
" noremap <Right> <Nop>
" inoremap <Up>    <Nop>
" inoremap <Down>  <Nop>
" inoremap <Left>  <Nop>
" inoremap <Right> <Nop>

" Jump in line
noremap <S-h>   ^
noremap <S-l>   $

" Jump in paragraph
" noremap <S-j>   }
" noremap <S-k>   {

" Disable s key
nnoremap s <Nop>

" Swap : and ;
nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;
vnoremap ; :
vnoremap : ;

" Window & Tab
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

" Quit
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>q!<CR>
nnoremap sd :<C-u>bd<CR>
nnoremap sD :<C-u>bd!<CR>

" Quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" Do not yank when deleting character with x
nnoremap x "_x
vnoremap x "_x

" ESC alias
inoremap <silent> jk <ESC>
inoremap <silent> j<Space> j

" Terminal
if has('nvim')
  tnoremap <C-n><C-n> <C-\><C-n>
endif

" Operator
onoremap [ i[
onoremap { i{

" Jump cursor position
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-e> <ESC>A
inoremap <silent> <C-a> <ESC>I
