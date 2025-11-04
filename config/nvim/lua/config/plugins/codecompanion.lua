local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion" },
  opts = {
    adapters = {
      acp = {
        gemini_cli = function()
          return require("codecompanion.adapters").extend("gemini_cli", {
            defaults = {
              auth_method = "oauth-personal",
            },
          })
        end,
      },
    },
    strategies = {
      chat = {
        adapter = "gemini_cli",
        keymaps = {
          close = {
            modes = { n = "q", i = "<C-c>" },
          },
        },
      },
      inline = {
        adapter = "gemini_cli",
      },
      cmd = {
        adapter = "gemini_cli",
      },
    },
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
  keys = {
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat<cr>",
      desc = "CodeCompanion Chat",
    },
    {
      "<leader>ca",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Actions",
    },
  },
  enabled = false,
}

return M
