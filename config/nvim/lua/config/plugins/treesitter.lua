local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
  },
}

function M.config()
  local treesitter_config = require("nvim-treesitter.configs")
  treesitter_config.setup({
    ensure_installed = {
      "lua",
      "dockerfile",
      "gitignore",
      "make",
      "markdown",
      "yaml",
      "vim",
    },
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  })
end

return M
