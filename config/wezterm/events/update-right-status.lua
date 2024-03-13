local wez = require("wezterm")
local color = require("color")

wez.on("update-status", function(window)
  local date = " " .. wez.strftime("%Y/%m/%d (%a) %H:%M:%S") .. " "
  local bat = ""
  for _, b in ipairs(wez.battery_info()) do
    bat = " " .. string.format("%.0f%%", b.state_of_charge * 100) .. " "
  end
  window:set_right_status(wez.format({
    { Background = { Color = color.background:lighten(0.2) } },
    { Foreground = { Color = color.foreground } },
    { Text = date },
    { Background = { Color = color.background:lighten(0.4) } },
    { Foreground = { Color = color.foreground } },
    { Text = bat },
  }))
end)
