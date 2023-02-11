return {
  -- common animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
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
  },

  -- buffer Removing
  {
    "echasnovski/mini.bufremove",
    event = "BufReadPre",
    config = function()
      local mb = require("mini.bufremove")
      mb.setup()
      -- sd
      vim.keymap.set("n", "sd", function()
        mb.delete(0, false)
      end)
      -- sq
      vim.keymap.set("n", "sq", function ()
        mb.unshow()
      end)
    end,
  },
}
