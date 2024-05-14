local any_word = function(pattern)
  if pattern:sub(1, 1) == "." then
    pattern = pattern:sub(2)
  end
  return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
end

---@param opts Flash.Format
local two_chars_format = function(opts)
  return {
    ---@diagnostic disable-next-line: undefined-field
    { opts.match.label1, "Search" },
    ---@diagnostic disable-next-line: undefined-field
    { opts.match.label2, "Substitute" },
  }
end

local two_chars_action = function(match, state)
  state:hide()
  require("flash").jump({
    search = { max_length = 0 },
    label = { format = two_chars_format },
    matcher = function(win)
      -- limit matches to the current label
      return vim.tbl_filter(function(m)
        return m.label == match.label and m.win == win
      end, state.results)
    end,
    labeler = function(matches)
      for _, m in ipairs(matches) do
        ---@diagnostic disable-next-line: undefined-field
        m.label = m.label2 -- use the second label
      end
    end,
  })
end

local two_chars_labeler = function(matches, state)
  local labels = state:labels()
  for m, match in ipairs(matches) do
    match.label1 = labels[math.floor((m - 1) / #labels) + 1]
    match.label2 = labels[(m - 1) % #labels + 1]
    match.label = match.label1
  end
end

local M = {
  "folke/flash.nvim",
  event = { "BufReadPre", "BufNewFile" },
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
      search = {
        enabled = true,
      },
    },
    labels = "asdfghjklwertyuiopzxcvbnm",
    label = {
      uppercase = false,
    },
    highlight = {
      backdrop = true,
      matches = false,
      groups = {
        match = "Search",
        current = "IncSearch",
        backdrop = "Comment",
        label = "Substitute",
      },
    },
  },
  keys = {
    { "f", mode = { "n", "x", "o" }, "<Nop>" },
    {
      "fs",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
    },
    {
      "fS",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },

    {
      "fw",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = ".",
          label = { before = true, after = false },
          search = { forward = true, wrap = false, multi_window = false, mode = any_word },
        })
      end,
    },
    {
      "fb",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = ".",
          label = { before = true, after = false },
          search = { forward = false, wrap = false, multi_window = false, mode = any_word },
        })
      end,
    },
    {
      "fj",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = true, wrap = false, multi_window = false, mode = "search", max_length = 0 },
          label = { after = { 0, 0 }, before = false, format = two_chars_format },
          pattern = "^",
          action = two_chars_action,
          labeler = two_chars_labeler,
        })
      end,
    },
    {
      "fk",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { forward = false, wrap = false, multi_window = false, mode = "search", max_length = 0 },
          label = { after = { 0, 0 }, before = false, format = two_chars_format },
          pattern = "^",
          action = two_chars_action,
          labeler = two_chars_labeler,
        })
      end,
    },
  },
}

return M
