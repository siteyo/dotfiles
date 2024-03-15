local wez = require("wezterm")
local colors = require("colors")

wez.on("update-status", function(window)
  local date = " " .. wez.strftime("%Y/%m/%d (%a) %H:%M:%S") .. " "
  local bat = ""
  for _, b in ipairs(wez.battery_info()) do
    bat = string.format("%.0f%%", b.state_of_charge * 100) .. " "
  end
  window:set_right_status(wez.format({
    { Background = { Color = colors.scheme.background } },
    { Foreground = { Color = colors.scheme.ansi[5] } },
    { Text = wez.nerdfonts.pl_right_hard_divider },
    { Background = { Color = colors.scheme.ansi[5] } },
    { Foreground = { Color = colors.scheme.ansi[1] } },
    { Text = window:active_pane():get_current_working_dir().file_path },
    { Text = wez.nerdfonts.pl_right_soft_divider },
    { Text = date },
    { Text = wez.nerdfonts.pl_right_soft_divider },
    { Text = bat },
  }))
end)
