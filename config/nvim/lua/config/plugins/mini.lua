return {
  -- common animation
  {
    "echasnovski/mini.animate",
    event = "BufReadPre",
    config = function()
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set("", key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")

      animate.setup({
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      })
    end,
    enabled = false,
  },

  -- visualize indent scope
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPre",
    config = function()
      require("mini.indentscope").setup({
        symbol = "│",
      })
    end,
    enabled = false,
  },

  -- buffer Removing
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "sd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        mode = { "n" },
        desc = "Delete Buffer(mini.bufremove)",
      },
    },
    config = false,
  },

  -- starter
  {
    "echasnovski/mini.starter",
    lazy = false,
    config = function()
      local starter = require("mini.starter")
      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.recent_files(10, false),
          starter.sections.recent_files(10, true),
          starter.sections.telescope(),
          starter.sections.builtin_actions(),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning("center", "center"),
        },
      })
    end,
    enabled = false,
  },
}
