return {
  {
    "vim-skk/skkeleton",
    event = { "InsertEnter", "BufReadPost" },
    dependencies = {
      "vim-denops/denops.vim",
    },
    config = function()
      vim.cmd([[
        inoremap <C-j> <Plug>(skkeleton-enable)
        cnoremap <C-j> <Plug>(skkeleton-enable)
        nnoremap <C-j> a<Plug>(skkeleton-enable)
        call skkeleton#register_kanatable('azik', {}, v:true)
        call skkeleton#config({
          \ 'kanaTable': 'rom',
          \ 'globalJisyo': '~/.local/share/skk/SKK-JISYO.L',
          \ 'globalDictionaries': [
          \   '~/.local/share/skk/SKK-JISYO.L',
          \   '~/.local/share/skk/SKK-JISYO.jinmei',
          \ ],
          \ 'globalKanaTableFiles': ['~/.local/share/skk/azik_us.rule'],
          \ })
        call skkeleton#register_keymap('henkan', '<CR>', 'kakutei')
        call skkeleton#register_keymap('input', '/', 'abbrev')
        call skkeleton#register_keymap('input', '<S-l>', 'zenkaku')
        call skkeleton#register_kanatable('azik', {
          \   ',': ['、', ''],
          \   '.': ['。', ''],
          \   'l': 'disable',
          \   'q': 'katakana',
          \   ';': 'henkanPoint',
          \   ' ': 'henkanFirst',
          \ })
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
    event = { "InsertEnter", "BufReadPost" },
  },
}
