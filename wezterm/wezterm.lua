-- Initialization
local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Color Scheme
config.color_scheme = 'nord'

-- Font Settings
config.font = wezterm.font_with_fallback {
  'HackGen35 Console NF',
  'Noto Color Emoji',
}
config.font_size = 14
config.line_height = 1.1

config.use_ime = true

-- Cursor Settings
config.default_cursor_style = 'BlinkingBlock'

-- Window Settings
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

-- Background Settings
config.window_background_opacity = 0.7
config.macos_window_background_blur = 0

-- Tab Bar Settings
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "000" },
}
config.show_new_tab_button_in_tab_bar = false

config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
