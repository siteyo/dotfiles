local wez = require("wezterm")
local color = require("color")

wez.on("update-status", function(window)
  local date = wez.strftime("%Y/%m/%d (%a) %H:%M:%S")
  window:set_right_status(wez.format({
    { Background = { Color = color.background:lighten(0.3) } },
    { Foreground = { Color = color.foreground } },
    { Text = date },
  }))
end)
