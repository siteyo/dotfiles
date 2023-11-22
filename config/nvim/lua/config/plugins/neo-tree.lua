local M = {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  branch = "v3.x",
  keys = "[Filer]",
}

function M.config()
  local neo_tree = require("neo-tree")
  local cmds = require("neo-tree.sources.filesystem.commands")

  local open_or_setroot = function(state)
    local node = state.tree:get_node()
    if node and node.type == "file" then
      cmds.open(state)
    elseif node and node.type == "directory" then
      cmds.set_root(state)
    end
  end

  neo_tree.setup({
    use_default_mapping = false,
    source_selector = {
      winbar = true,
    },
    window = {
      mappings = {
        ["<Space>"] = { "toggle_node", nowait = false },
        ["<ESC>"] = "revert_preview",
        ["<CR>"] = open_or_setroot,
        ["v"] = { "toggle_preview", config = { use_float = true } },
        ["h"] = { "close_node" },
        ["l"] = { "open" },
        ["w"] = "open_with_window_picker",
        ["N"] = { "add" },
        ["K"] = { "add_directory" },
        ["r"] = "rename",
        ["d"] = "delete",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["<C-j>"] = "prev_source",
        ["<C-k>"] = "next_source",
        ["A"] = "",
        ["a"] = "",
        ["s"] = "",
        ["z"] = "",
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["<C-h>"] = { "navigate_up" },
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["f"] = "filter_on_submit",
          ["<C-x>"] = "clear_filter",
          ["."] = "set_root",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
      },
    },
    git_status = {
      window = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
  })

  --- Mappings
  local opts = { noremap = true, silent = true }
  local command = require("neo-tree.command")
  -- drawer
  vim.keymap.set("n", "[Filer]d", function()
    command.execute({
      action = "show",
      source = "filesystem",
      position = "left",
      toggle = true,
      reveal = true,
    })
  end, opts)
  -- vim.keymap.set("n", "[Filer]dg", function()
  --   command.execute({
  --     action = "show",
  --     source = "git_status",
  --     position = "left",
  --     toggle = true,
  --     reveal = true,
  --   })
  -- end, opts)
  -- vim.keymap.set("n", "[Filer]db", function()
  --   command.execute({
  --     action = "show",
  --     source = "buffers",
  --     position = "left",
  --     toggle = true,
  --     reveal = true,
  --   })
  -- end, opts)
  -- current
  -- vim.keymap.set("n", "[Filer]e", function()
  --   command.execute({
  --     action = "focus",
  --     source = "filesystem",
  --     position = "current",
  --     toggle = false,
  --     reveal = true,
  --   })
  -- end)
  -- vim.keymap.set("n", "[Filer]b", function()
  --   command.execute({
  --     action = "focus",
  --     source = "buffers",
  --     position = "current",
  --     toggle = false,
  --     reveal = true,
  --   })
  -- end)
  -- vim.keymap.set("n", "[Filer]g", function()
  --   command.execute({
  --     action = "focus",
  --     source = "git_status",
  --     position = "current",
  --     toggle = false,
  --     reveal = true,
  --   })
  -- end)
  -- -- float
  -- vim.keymap.set("n", "[Filer]f", function()
  --   command.execute({
  --     action = "focus",
  --     source = "filesystem",
  --     position = "float",
  --     toggle = false,
  --     reveal = true,
  --   })
  -- end)
end

return M
