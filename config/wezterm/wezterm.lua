local wez = require("wezterm")
local colors = require("colors")
local keybinds = require("keybinds")

local config = {}
if wez.config_builder then
  config = wez.config_builder()
end

-- Events
require("events")

-- Keybinds
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.leader = {
  key = ";",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}

-- Appearance
config.color_scheme = colors.scheme_name
-- Font
config.font = wez.font_with_fallback({
  "0xProto Nerd Font",
  "HackGen Console NF",
})
config.font_size = 12.0
config.line_height = 1.0

-- Window
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_padding = { left = 2, top = 10, bottom = 2, right = 2 }
config.adjust_window_size_when_changing_font_size = false
config.window_frame = {
  font = wez.font_with_fallback({
    { family = "0xProto Nerd Font", weight = "Bold" },
    { family = "HackGen Console NF", weight = "Bold" },
  }),
  active_titlebar_bg = colors.background,
  inactive_titlebar_bg = colors.background,
  font_size = 10.0,
}

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.colors = {
  tab_bar = {
    background = wez.color.parse(colors.scheme.background),
  },
}

-- Inactive panes
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.6,
}

-- Other
config.use_ime = true

-- Default Prog
-- local default_prog = {}
-- Windows(WSL)
-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
--   default_prog = { "wsl.exe", "--cd", "~" }
-- end
-- -- macOS
-- if wezterm.target_triple == "x86_64-apple-darwin" then
--   default_prog = { os.getenv("SHELL"), "-l" }
-- end
-- if wezterm.target_triple == "aarch64-apple-darwin" then
--   default_prog = { os.getenv("SHELL"), "-l" }
-- end
-- config.default_prog = default_prog

return config
