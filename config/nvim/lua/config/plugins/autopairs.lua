local M = {
  "windwp/nvim-autopairs",
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    local rule = require("nvim-autopairs.rule")
    autopairs.add_rule(rule("[[", "", "markdown"))
  end,
  event = "BufReadPost",
}

return M
