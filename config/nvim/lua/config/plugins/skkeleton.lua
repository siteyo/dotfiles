return {
  {
    "vim-skk/skkeleton",
    event = "VeryLazy",
    dependencies = {
      "vim-denops/denops.vim",
    },
    config = function()
      vim.cmd([[
        inoremap <C-j> <Plug>(skkeleton-enable)
        cnoremap <C-j> <Plug>(skkeleton-enable)
        nnoremap <C-j> a<Plug>(skkeleton-enable)
        " call skkeleton#register_kanatable('azik', {}, v:true)
        call skkeleton#config({
          \ 'kanaTable': 'rom',
          \ 'globalDictionaries': [
          \   '~/.local/share/skk/SKK-JISYO.L',
          \   '~/.local/share/skk/SKK-JISYO.jinmei',
          \ ],
          \ 'globalKanaTableFiles': [
          \   '~/.local/share/skk/kana-rule.conf',
          \   '~/.local/share/skk/azik_us.rule',
          \ ],
          \ 'markerHenkan': '',
          \ 'markerHenkanSelect': '',
          \ })
        call skkeleton#register_keymap('henkan', '<CR>', 'kakutei')
        call skkeleton#register_keymap('input', '<S-l>', 'zenkaku')
        call skkeleton#register_keymap('input', 'q', '')
        call skkeleton#register_kanatable('rom', {
          \ ',': ['、'],
          \ '.': ['。'],
          \ 'z,': ['/'],
          \ 'x,': [','],
          \ '-': ['-'],
          \ ' ': 'henkanFirst',
          \ 'l': 'disable',
          \ '/': 'abbrev',
          \ ';': 'henkanPoint',
          \ ':': 'katakana',
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
      -- require("skkeleton_indicator").setup({
      --   eijiHlName = "Function",
      --   hiraHlName = "String",
      --   kataHlName = "Todo",
      --   hankataHlName = "Special",
      --   zenkakuHlName = "Search",
      -- })

      vim.api.nvim_set_hl(0, "SkkeletonIndicatorEiji", { fg = "#88c0d0", bg = "#2e3440", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorHira", { fg = "#2e3440", bg = "#a3be8c", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorKata", { fg = "#2e3440", bg = "#ebcb8b", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorHankata", { fg = "#2e3440", bg = "#b48ead", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorZenkaku", { fg = "#2e3440", bg = "#88c0d0", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorAbbrev", { fg = "#e5e9f0", bg = "#bf616a", bold = true })
      require("skkeleton_indicator").setup({})
    end,
    event = "VeryLazy",
    enabled = false,
  },
  {
    "siteyo/skkeleton_pointer.nvim",
    dependencies = {
      "vim-skk/skkeleton",
    },
    opts = {
      mode = {
        latin = "",
      },
      mode_win_opts = {
        zindex = 1050,
      },
      state_win_opts = {
        zindex = 1050,
      },
    },
    event = "VeryLazy",
    enabled = true,
  },
}
