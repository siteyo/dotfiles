return {
  {
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
        call skkeleton#register_keymap('henkan', '<CR>', 'kakutei')
        ]])
    end,
  },
  {
    "delphinus/skkeleton_indicator.nvim",
    dependencies = {
      "vim-skk/skkeleton",
    },
    config = function()
      require("skkeleton_indicator").setup({
        eijiHlName = "Function",
        hiraHlName = "String",
        kataHlName = "Todo",
        hankataHlName = "Special",
        zenkakuHlName = "Search",
      })
    end,
    event = "InsertEnter",
  },
}
