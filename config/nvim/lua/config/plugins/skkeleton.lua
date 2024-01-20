local uv = vim.loop

---@param fname string
---@return string
local file_read = function(fname)
  local fd = assert(uv.fs_open(fname, "r", 292))
  local stat = assert(uv.fs_fstat(fd))
  local buffer = assert(uv.fs_read(fd, stat.size, 0))
  assert(uv.fs_close(fd))
  return buffer
end

return {
  {
    "vim-skk/skkeleton",
    event = "VeryLazy",
    dependencies = {
      "vim-denops/denops.vim",
    },
    config = function()
      vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)")
      vim.keymap.set({ "n" }, "<C-j>", "a<Plug>(skkeleton-enable)")

      vim.fn["skkeleton#register_keymap"]("henkan", "<CR>", "kakutei")
      vim.fn["skkeleton#register_keymap"]("input", "<S-l>", "zenkaku")
      vim.fn["skkeleton#register_keymap"]("input", "q", "")

      local path = vim.fn.stdpath("config") .. "/etc/azik_skkeleton.json"
      local buffer = file_read(path)
      local kanaTable = vim.json.decode(buffer)
      kanaTable[" "] = "henkanFirst"
      kanaTable["l"] = "disable"
      kanaTable["/"] = "abbrev"
      kanaTable[";"] = "henkanPoint"
      kanaTable[":"] = "katakana"
      vim.fn["skkeleton#register_kanatable"]("azik", kanaTable, true)

      vim.fn["skkeleton#config"]({
        kanaTable = "azik",
        globalDictionaries = {
          "~/.local/share/skk/SKK-JISYO.L",
          "~/.local/share/skk/SKK-JISYO.jinmei",
        },
        markerHenkan = "",
        markerHenkanSelect = "",
      })
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
