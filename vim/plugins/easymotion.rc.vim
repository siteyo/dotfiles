" s2
nmap fs <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)
omap s <Plug>(easymotion-s2)

" f
nmap ff <Plug>(easymotion-f)
vmap f <Plug>(easymotion-fl)
omap f <Plug>(easymotion-fl)

" F
nmap fF <Plug>(easymotion-F)
vmap F <Plug>(easymotion-Fl)
omap F <Plug>(easymotion-Fl)

" t
nmap ft <Plug>(easymotion-t)
vmap t <Plug>(easymotion-tl)
omap t <Plug>(easymotion-tl)

" t
nmap fT <Plug>(easymotion-T)
vmap T <Plug>(easymotion-Tl)
omap T <Plug>(easymotion-Tl)

" j
nmap fj <Plug>(easymotion-j)
vmap fj <Plug>(easymotion-j)

" k
nmap fk <Plug>(easymotion-k)
vmap fk <Plug>(easymotion-k)

" /
nmap / <Plug>(easymotion-sn)
nmap n <Plug>(easymotion-next)
nmap N <Plug>(easymotion-prev)
nmap * <Plug>(easymotion-sn)<C-r><C-w><CR>

" w
nmap fw <Plug>(easymotion-w)
vmap w <Plug>(easymotion-w)
omap w <Plug>(easymotion-wl)

" W
nmap fW <plug>(easymotion-W)
vmap W <plug>(easymotion-W)
omap W <plug>(easymotion-Wl)

" b
nmap fb <Plug>(easymotion-b)
vmap b <Plug>(easymotion-b)
omap b <Plug>(easymotion-bl)

" B
nmap fB <Plug>(easymotion-B)
vmap B <Plug>(easymotion-B)
omap B <Plug>(easymotion-Bl)

" e
nmap fe <plug>(easymotion-e)
vmap e <plug>(easymotion-e)
omap e <plug>(easymotion-el)

" E
nmap fE <plug>(easymotion-E)
vmap E <plug>(easymotion-E)
omap E <plug>(easymotion-El)

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'ASDFGHJKL'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#80a0ff ctermfg=81
