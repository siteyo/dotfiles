local wezterm = require("wezterm")
local act = wezterm.action

-----------------------------------------------------------
--- Launch Menu
-----------------------------------------------------------
local launch_menu = {}
-- Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell 7",
    args = { "pwsh.exe", "-NoLogo" },
  })
end

-----------------------------------------------------------
--- Default Prog
-----------------------------------------------------------
local default_prog = {}
-- Windows(WSL)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  default_prog = { "wsl.exe", "--cd", "~" }
end
-- macOS
if wezterm.target_triple == "x86_64-apple-darwin" then
  default_prog = { os.getenv("SHELL"), "-l" }
end

-----------------------------------------------------------
--- Keybinds
-----------------------------------------------------------
local keybinds = {
  { key = "v",          mods = "LEADER",    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "s",          mods = "LEADER",    action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "Space",      mods = "LEADER",    action = act.QuickSelect },
  { key = "m",          mods = "LEADER",    action = act.ShowLauncher },
  { key = "h",          mods = "LEADER",    action = act.ActivatePaneDirection("Left") },
  { key = "l",          mods = "LEADER",    action = act.ActivatePaneDirection("Right") },
  { key = "j",          mods = "LEADER",    action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "LEADER",    action = act.ActivatePaneDirection("Up") },
  { key = "J",          mods = "LEADER",    action = act.ActivateTabRelative(-1) },
  { key = "K",          mods = "LEADER",    action = act.ActivateTabRelative(1) },
  { key = "u",          mods = "LEADER",    action = act.CharSelect },
  { key = "p",          mods = "LEADER",    action = act.PaneSelect },
  { key = "x",          mods = "LEADER",    action = act.ActivateCopyMode },
  { key = "w",          mods = "LEADER",    action = act.RotatePanes("Clockwise") },
  { key = "b",          mods = "LEADER",    action = act.RotatePanes("CounterClockwise") },
  { key = "n",          mods = "LEADER",    action = act.SpawnWindow },
  { key = "t",          mods = "LEADER",    action = act.SpawnTab("CurrentPaneDomain") },
  { key = "h",          mods = "ALT",       action = act.AdjustPaneSize({ "Left", 1 }) },
  { key = "j",          mods = "ALT",       action = act.AdjustPaneSize({ "Down", 1 }) },
  { key = "k",          mods = "ALT",       action = act.AdjustPaneSize({ "Up", 1 }) },
  { key = "l",          mods = "ALT",       action = act.AdjustPaneSize({ "Right", 1 }) },
  { key = "LeftArrow",  mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Right") },
  { key = "DownArrow",  mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Down") },
  { key = "UpArrow",    mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Up") },
}

-----------------------------------------------------------
--- Font
-----------------------------------------------------------
local font = {}
-- Windows(WSL)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  font = {
    -- "Fira Code",
    "0xProto",
    "HackGen Console NF",
  }
end
-- macOS
if wezterm.target_triple == "x86_64-apple-darwin" then
  font = {
    -- "Fira Code",
    "0xProto Nerd Font",
    "HackGen Console NF",
  }
end

return {
  font = wezterm.font_with_fallback(font),
  font_size = 11.0,
  default_prog = default_prog,
  window_background_opacity = 0.90,
  color_scheme = "iceberg-dark",
  launch_menu = launch_menu,
  leader = { key = ";", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = keybinds,
  use_ime = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
}
