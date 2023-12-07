local wezterm = require("wezterm")
local keybinds = require("keybinds")

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
  keys = keybinds.keys,
  key_tables = keybinds.key_tables,
  disable_default_key_bindings = true,
  use_ime = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
}
