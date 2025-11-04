---@param fname string
---@return string
local file_read = function(fname)
  local file = assert(io.open(fname, "r"))
  local content = file:read("*a")
  file:close()
  return content
end

local M = {
  {
    "vim-skk/skkeleton",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "vim-denops/denops.vim",
    },
    keys = {
      { "<C-j>", "<Plug>(skkeleton-enable)", mode = { "i", "c", "t" } },
      { "<C-j>", "a<Plug>(skkeleton-enable)", mode = { "n" } },
    },
    config = function()
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
      mode = { latin = "" },
      mode_win_opts = { zindex = 1050 },
      state_win_opts = { zindex = 1050 },
    },
    event = { "InsertEnter", "CmdlineEnter", "TermOpen" },
    enabled = true,
  },
}

return M
