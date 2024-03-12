local wez = require("wezterm")
local color = require("color")

wez.on("format-tab-title", function(tab, _, _, config, hover, max_width)
  local pane = tab.active_pane
  local title = " " .. pane.title .. " "
  if tab.is_active then
    return {
      { Background = { Color = color.background:lighten(0.1) } },
      { Foreground = { Color = color.foreground } },
      { Text = title },
    }
  end
  return title
end)
