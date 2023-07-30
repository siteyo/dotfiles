local any_word = function(pattern)
  if pattern:sub(1, 1) == "." then
    pattern = pattern:sub(2)
  end
  return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
end

local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        keys = {
          ["f"] = "ff",
          "F",
          "t",
          "T",
          [";"] = ":",
          ",",
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "f",  mode = { "n", "x", "o" }, "<Nop>" },
    { "fs", mode = { "n", "x", "o" }, function() require("flash").jump() end },
    { "fS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
    {
      "fw",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = ".",
          search = { forward = true, wrap = false, multi_window = false, mode = any_word },
        })
      end
    },
    {
      "fb",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = ".",
          search = { forward = false, wrap = false, multi_window = false, mode = any_word },
        })
      end
    },
    {
      "fj",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = { forward = true, wrap = false, multi_window = false, mode = "search", max_length = 0 },
        })
      end,
    },
    {
      "fk",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = { forward = false, wrap = false, multi_window = false, mode = "search", max_length = 0 },
        })
      end,
    },
  },
}

return M
