local wez = require("wezterm")
local colors = require("colors")
local util = require("util")

---@param title string
---@return string
local process_icon_gen = function(title)
  local icon = ""
  if title:match(".*zsh.*") then
    icon = wez.nerdfonts.fa_percent
  elseif title:match(".*nvim.*") then
    icon = wez.nerdfonts.custom_neovim
  elseif title:match(".*yazi.*") then
    icon = wez.nerdfonts.md_folder_multiple
  elseif title:match(".*lazygit.*") then
    icon = wez.nerdfonts.md_git
  elseif title:match(".*lua.*") then
    icon = wez.nerdfonts.md_language_lua
  elseif title:match(".*python.*") then
    icon = wez.nerdfonts.md_language_python
  elseif title:match(".*node.*") then
    icon = wez.nerdfonts.md_nodejs
  else
    icon = wez.nerdfonts.oct_terminal
  end
  return util.cat_icon(icon, title)
end

wez.on("format-tab-title", function(tab, _, _, config, hover, max_width)
  local pane = tab.active_pane
  local title = process_icon_gen(pane.title)
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
