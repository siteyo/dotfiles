" Clipboard
set clipboard=unnamed

" Utility
nunmap s
vunmap s
vunmap S
unmap <Space>

" Swap : and ;
nnoremap ; :
nnoremap : :

" Jump in line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Split window
nnoremap sv :obcommand<Space>workspace:split-vertical<CR>
nnoremap ss :obcommand<Space>workspace:split-horizontal<CR>

" Move to window
nnoremap sh :obcommand<Space>editor:focus-left<CR>
nnoremap sj :obcommand<Space>editor:focus-bottom<CR>
nnoremap sk :obcommand<Space>editor:focus-top<CR>
nnoremap sl :obcommand<Space>editor:focus-right<CR>
nnoremap sn :obcommand<Space>workspace:next-tab<CR>
nnoremap sp :obcommand<Space>workspace:previous-tab<CR>

" Close
exmap q obcommand workspace:close
nnoremap sq :q<CR>
nnoremap <Space>qq :obcommand<Space>workspace:close-tab-group<CR>
nnoremap <Space>qo :obcommand<Space>workspace:close-others<CR>
nnoremap <Space>qg :obcommand<Space>workspace:close-others-tab-group<CR>

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quote surround " "
exmap surround_single_quote surround ' '
exmap surround_backticks ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
vmap Sl :surround_wiki<CR>
vmap S" :surround_double_quote<CR>
vmap S' :surround_single_quote<CR>
vmap S` :surround_backticks<CR>
vmap Sb :surround_brackets<CR>
vmap S( :surround_brackets<CR>
vmap Sr :surround_square_brackets<CR>
vmap S[ :surround_square_brackets<CR>
vmap SB :surround_curly_brackets<CR>
vmap S{ :surround_curly_brackets<CR>

" Follow link
nnoremap <CR> :obcommand<Space>editor:follow-link<CR>

" Sidebar
nnoremap <Space>e :obcommand<Space>file-explorer:open<CR>
nnoremap <Space>h :obcommand<Space>app:toggle-left-sidebar<CR>
nnoremap <Space>l :obcommand<Space>app:toggle-right-sidebar<CR>

" Obsidian
nnoremap <Space>oj :obcommand<Space>daily-notes<CR>
nnoremap <Space>or :obcommand<Space>workspace:edit-file-title<CR>
nnoremap <Space>oq :obcommand<Space>switcher:open<CR>
nnoremap <Space>od :obcommand<Space>insert-current-date<CR>
nnoremap <Space>om :obcommand<Space>insert-template<CR>

" QuickAdd
nnoremap <Space>oe :obcommand<Space>quickadd:runQuickAdd<CR>

" Clear search
nnoremap <C-l> :noh<CR><C-l>

" Command palette
nnoremap <Space>; :obcommand<Space>command-palette:open<CR>

" Stacked tabs
nnoremap <Space>t :obcommand<Space>workspace:toggle-stacked-tabs<CR>

" Delete current file
nnoremap <Space>dd :obcommand<Space>app:delete-file<CR>

" Search
nnoremap <Space>/ :obcommand<Space>global-search:open<CR>

" Source
nnoremap <Space>s :obcommand<Space>editor:toggle-source<CR>
