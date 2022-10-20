local wezterm = require("wezterm")
local act = wezterm.action

-----------------------------------------------------------
--- Launch Menu
-----------------------------------------------------------
local launch_menu = {}
-- Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  table.insert(launch_menu, {
    label = 'PowerShell 7',
    args = { 'pwsh.exe', '-NoLogo' },
  })
end

-----------------------------------------------------------
--- Default Prog
-----------------------------------------------------------
local default_prog = {}
-- Windows
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  default_prog = { 'wsl.exe', '--cd', '~' }
end
-- macOS
if wezterm.target_triple == 'x86_64-apple-darwin' then
  default_prog = { os.getenv("SHELL"), '-l' }
end
-----------------------------------------------------------
--- Keybinds
-----------------------------------------------------------
local keybinds = {
  { key = 'v', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 's', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'Space', mods = 'LEADER', action = act.QuickSelect },
  { key = 'm', mods = 'LEADER', action = act.ShowLauncher },
  { key = 'j', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
  { key = 'k', mods = 'LEADER', action = act.ActivateTabRelative(1) },
  { key = 'u', mods = 'LEADER', action = act.CharSelect },
  { key = 'p', mods = 'LEADER', action = act.PaneSelect },
  { key = 'x', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 'w', mods = 'LEADER', action = act.RotatePanes 'Clockwise' },
  { key = 'b', mods = 'LEADER', action = act.RotatePanes 'CounterClockwise' },
  { key = 'n', mods = 'LEADER', action = act.SpawnWindow },
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = '[', mods = 'ALT', action = act.ActivateTabRelative(-1) },
  { key = ']', mods = 'ALT', action = act.ActivateTabRelative(1) },
  { key = 'h', mods = 'ALT', action = act.AdjustPaneSize {"Left", 1} },
  { key = 'j', mods = 'ALT', action = act.AdjustPaneSize {"Down", 1} },
  { key = 'k', mods = 'ALT', action = act.AdjustPaneSize {"Up", 1} },
  { key = 'l', mods = 'ALT', action = act.AdjustPaneSize {"Right", 1} },
}

return {
  font = wezterm.font_with_fallback {
    'Fira Code',
    'HackGen Console NFJ',
  },
  default_prog = default_prog,
  window_background_opacity = 0.9,
  color_scheme = "iceberg-dark",
  launch_menu = launch_menu,
  leader = { key = 'i', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = keybinds,
  use_ime = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}
