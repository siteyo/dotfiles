local M = {
  "vim-skk/skkeleton",
  event = "InsertEnter",
  dependencies = {
    "vim-denops/denops.vim",
  },
  config = function()
    vim.cmd([[
      imap <C-j> <Plug>(skkeleton-enable)
      cmap <C-j> <Plug>(skkeleton-enable)
      call skkeleton#config({
        \ 'globalJisyo': '~/.local/share/skk/SKK-JISYO.L'
        \ })
      call skkeleton#config({
        \ 'globalDictionaries': [
        \ '~/.local/share/skk/SKK-JISYO.L',
        \ '~/.local/share/skk/SKK-JISYO.jinmei',
        \ ]
        \ })
    ]])
  end,
}

return M
