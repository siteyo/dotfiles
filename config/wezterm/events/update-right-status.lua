local wez = require("wezterm")
local colors = require("colors")

---@param icon string
---@param string string
---@return string
local cat_icon = function(icon, string)
  return " " .. icon .. " " .. string .. " "
end

---@return string
local file_path_gen = function(pane)
  local icon = wez.nerdfonts.cod_folder_opened
  local file_path = ""
  local url = pane:get_current_working_dir()
  if url then
    file_path = url.file_path
  end
  return cat_icon(icon, file_path)
end

---@return string
local date_gen = function()
  local icon = wez.nerdfonts.cod_calendar
  local date = wez.strftime("%m/%d(%a) %H:%M:%S")
  return cat_icon(icon, date)
end

---@param state string
---@param state_of_charge number
---@return string
local battery_icon_gen = function(state, state_of_charge)
  local icon = ""
  if state_of_charge > 0.98 then
    icon = wez.nerdfonts.md_battery
  elseif state_of_charge > 0.9 then
    icon = wez.nerdfonts.md_battery_90
  elseif state_of_charge > 0.8 then
    icon = wez.nerdfonts.md_battery_80
  elseif state_of_charge > 0.7 then
    icon = wez.nerdfonts.md_battery_70
  elseif state_of_charge > 0.6 then
    icon = wez.nerdfonts.md_battery_60
  elseif state_of_charge > 0.5 then
    icon = wez.nerdfonts.md_battery_50
  elseif state_of_charge > 0.4 then
    icon = wez.nerdfonts.md_battery_40
  elseif state_of_charge > 0.3 then
    icon = wez.nerdfonts.md_battery_30
  elseif state_of_charge > 0.2 then
    icon = wez.nerdfonts.md_battery_20
  elseif state_of_charge > 0.1 then
    icon = wez.nerdfonts.md_battery_10
  else
    icon = wez.nerdfonts.md_battery_alert_variant_outline
  end
  if state == "Charging" or state == "Full" then
    icon = icon .. wez.nerdfonts.md_lightning_bolt
  end
  return icon
end

---@return string
local battery_gen = function()
  local icon = ""
  local battery = ""
  for _, b in ipairs(wez.battery_info()) do
    icon = battery_icon_gen(b.state, b.state_of_charge)
    battery = string.format("%.0f%%", b.state_of_charge * 100)
    battery = cat_icon(icon, string.format("%.0f%%", b.state_of_charge * 100))
  end
  return battery
end

wez.on("update-status", function(window)
  local pane = window:active_pane()

  local fg = wez.color.parse(colors.scheme.ansi[1])
  local bg = wez.color.parse(colors.scheme.ansi[5])
  local bg_colors = { bg:lighten(0.25), bg:lighten(0.15), bg, bg:darken(0.15) }
  local tab_bg = wez.color.parse(colors.scheme.background)

  local file_path = file_path_gen(pane)
  local date = date_gen()
  local bat = battery_gen()

  local div_icon = wez.nerdfonts.pl_right_hard_divider

  window:set_right_status(wez.format({
    { Background = { Color = tab_bg } },
    { Foreground = { Color = bg_colors[1] } },
    { Text = div_icon },

    { Background = { Color = bg_colors[1] } },
    { Foreground = { Color = fg } },
    { Text = file_path },

    { Background = { Color = bg_colors[1] } },
    { Foreground = { Color = bg_colors[2] } },
    { Text = div_icon },

    { Background = { Color = bg_colors[2] } },
    { Foreground = { Color = fg } },
    { Text = date },

    { Background = { Color = bg_colors[2] } },
    { Foreground = { Color = bg_colors[3] } },
    { Text = div_icon },

    { Background = { Color = bg_colors[3] } },
    { Foreground = { Color = fg } },
    { Text = bat },
  }))
end)
