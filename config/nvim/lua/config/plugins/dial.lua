local M = {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "normal", "mygroup")
      end,
      mode = { "n" },
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "normal", "mygroup")
      end,
      mode = { "n" },
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gnormal", "mygroup")
      end,
      mode = { "n" },
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gnormal", "mygroup")
      end,
      mode = { "n" },
    },
    {
      "<C-a>",
      function()
        require("dial.map").manipulate("increment", "visual", "mygroup")
      end,
      mode = { "x" },
    },
    {
      "<C-x>",
      function()
        require("dial.map").manipulate("decrement", "visual", "mygroup")
      end,
      mode = { "x" },
      desc = "Dial decrement",
    },
    {
      "g<C-a>",
      function()
        require("dial.map").manipulate("increment", "gvisual", "mygroup")
      end,
      mode = { "x" },
    },
    {
      "g<C-x>",
      function()
        require("dial.map").manipulate("decrement", "gvisual", "mygroup")
      end,
      mode = { "x" },
    },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      mygroup = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.new({
          pattern = "%Y/%m/%d",
          default_kind = "day",
        }),
        augend.date.new({
          pattern = "%Y-%m-%d",
          default_kind = "day",
        }),
        augend.date.new({
          pattern = "%m/%d",
          default_kind = "day",
          only_valid = true,
        }),
        augend.date.new({
          pattern = "%H:%M",
          default_kind = "day",
          only_valid = true,
        }),
        augend.constant.alias.ja_weekday_full,
        augend.constant.alias.bool,
      },
    })
  end,
}

return M
