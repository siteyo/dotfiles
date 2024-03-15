local wez = require("wezterm")
local colors = require("colors")

wez.on("format-tab-title", function(tab, _, _, config, hover, max_width)
  local pane = tab.active_pane
  local title = " " .. pane.title .. " "
  if tab.is_active then
    return {
      { Background = { Color = colors.scheme.ansi[5] } },
      { Foreground = { Color = colors.scheme.ansi[1] } },
      { Text = tab.tab_index == 0 and "" or wez.nerdfonts.pl_left_hard_divider },
      { Text = title },
      { Background = { Color = colors.scheme.background } },
      { Foreground = { Color = colors.scheme.ansi[5] } },
      { Text = wez.nerdfonts.pl_left_hard_divider },
    }
  end
  return {
    { Background = { Color = colors.scheme.ansi[1] } },
    { Foreground = { Color = colors.scheme.ansi[5] } },
    { Text = title },
  }
end)
