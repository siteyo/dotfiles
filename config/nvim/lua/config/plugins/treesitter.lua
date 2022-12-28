local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
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
