nnoremap [Denite] <Nop>
nmap <Space>f [Denite]

nnoremap <silent> [Denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [Denite]f :<C-u>Denite file<CR>
nnoremap <silent> [Denite]g :<C-u>Denite grep<CR>
nnoremap <silent> [Denite]h :<C-u>Denite help<CR>
nnoremap <silent> [Denite]j :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [Denite]k :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
nnoremap <silent> [Denite]l :<C-u>Denite line<CR>
nnoremap <silent> [Denite]m :<C-u>Denite file_mru<CR>
nnoremap <silent> [Denite]n :<C-u>Denite file:new -highlight-matched-char=Underlined<CR>
nnoremap <silent> [Denite]o :<C-u>Denite outline<CR>
nnoremap <silent> [Denite]p :<C-u>DeniteProjectDir file/rec<CR>
nnoremap <silent> [Denite]r :<C-u>Denite file/rec<CR>
nnoremap <silent> [Denite]s :<C-u>Denite source<CR>
nnoremap <silent> [Denite]v :<C-u>Denite -resume<CR>
nnoremap <silent> [Denite]y :<C-u>Denite register<CR>

nnoremap <silent> [Denite]eh :<C-u>Denite defx/history<CR>
nnoremap <silent> [Denite]ed :<C-u>Denite defx/drive<CR>


autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> a
        \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> '
        \ denite#do_map('quick_move')
    nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> r
        \ denite#do_map('do_action', 'quickfix')
    nnoremap <silent><buffer><expr> <C-r>
        \ denite#do_map('restore_sources')
endfunction

call denite#custom#option('default', {
        \ 'highlight_matched_char': 'Special',
        \ 'vertical_preview': v:true,
        \ 'split': 'floating',
        \ 'winrow': 1
        \ })

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
        \ [ '.git/', '.ropeproject/', '__pycache__/',
        \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

let s:menus = {}
let s:menus.vimrc = {
        \ 'description': 'vimrc'
        \ }
let s:menus.vimrc.file_candidates = [
        \ ['init.vim', '~/nvimfiles/init.vim'],
        \ ['ginit.vim', '~/nvimfiles/ginit.vim'],
        \ ['dein.rc.vim', '~/nvimfiles/dein.rc.vim'],
        \ ['dein.toml', '~/nvimfiles/dein_lazy.toml'],
        \ ['dein_lazy.toml', '~/nvimfiles/dein_lazy.toml']
        \ ]

call denite#custom#var('menu', 'menus', s:menus)
