local M = {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      win = {
        keys = {
          skkeleton = { "<C-j>", "<Plug>(skkeleton-enable)", mode = "nt" },
        },
      },
      prompts = {
        changes = "変更内容をレビューしてください。",
        diagnostics = "{file} のDiagnosticsを修正するのを手伝ってください。\n{diagnostics}",
        diagnostics_all = "これらのDiagnosticsを修正するのと手伝ってください。\n{diagnostics_all}",
        document = "{function|line} にドキュメントを追加してください。",
        explain = "{this} を説明してください。",
        fix = "{this} を修正してください。",
        optimize = "{this} の最適化はどのように行えばよいでしょうか？",
        review = "{file} に問題点や改善点がないか確認してください。",
        tests = "{this} のテストを書いてください。",
      },
    },
  },
  dependencies = {
    "vim-skk/skkeleton",
    "vim-denops/denops.vim",
  },
  config = function(_, opts)
    opts = require("config.private").merge("sidekick", opts)
    require("sidekick").setup(opts)
  end,
  cmd = { "SidekicSidekickk" },
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}

return M
