" ========================================================================
" PROVIDER CONFIGURATION
" ========================================================================

" ------------------------------------------------------------------------
" PYTHON PROVIDER
" ------------------------------------------------------------------------
" venv
if has('mac')
  let g:python3_host_prog = expand(g:vim_home . '/pynvim/bin/python')
elseif has('unix')
  let g:python3_host_prog =  expand(g:vim_home . '/pynvim/bin/python')
elseif has('win')
  let g:python3_host_prog = expand(g:vim_home . '/pynvim/Scripts/python')
endif

" ------------------------------------------------------------------------
" RUBY PROVIDER
" ------------------------------------------------------------------------
" if has('mac')
"   let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
" endif

" ------------------------------------------------------------------------
" NODEJS PROVIDER
" ------------------------------------------------------------------------
if has('mac')
  let g:node_host_prog = expand('~/.anyenv/envs/nodenv/versions/12.11.0/bin/neovim-node-host')
elseif has('unix')
  let g:node_host_prog = expand('~/.anyenv/envs/nodenv/versions/16.14.0/bin/neovim-node-host')
endif

" ========================================================================
