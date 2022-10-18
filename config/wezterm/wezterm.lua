local wezterm = require("wezterm")
local act = wezterm.action

-----------------------------------------------------------
--- Launch Menu
-----------------------------------------------------------
local launch_menu = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  -- Enumerate any WSL distributions that are installed and add those to the menu
  local success, wsl_list, wsl_err =
    wezterm.run_child_process { 'wsl.exe', '-l' }
  -- `wsl.exe -l` has a bug where it always outputs utf16:
  -- https://github.com/microsoft/WSL/issues/4607
  -- So we get to convert it
  wsl_list = wezterm.utf16_to_utf8(wsl_list)

  for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
    -- Skip the first line of output; it's just a header
    if idx > 1 then
      -- Remove the "(Default)" marker from the default line to arrive
      -- at the distribution name on its own
      local distro = line:gsub(' %(Default%)', '')

      -- Add an entry that will spawn into the distro with the default shell
      table.insert(launch_menu, {
        label = distro .. ' (WSL default shell)',
        args = { 'wsl.exe', '--distribution', distro },
      })

      -- Here's how to jump directly into some other program; in this example
      -- its a shell that probably isn't the default, but it could also be
      -- any other program that you want to run in that environment
      table.insert(launch_menu, {
        label = distro .. ' (WSL zsh login shell)',
        args = {
          'wsl.exe',
          '--distribution',
          distro,
          '--exec',
          '/bin/zsh',
          '-l',
        },
      })
    end
  end
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
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  default_prog = { '$SHELL', '-l' }
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
