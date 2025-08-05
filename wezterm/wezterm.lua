-- Initialization
local wezterm = require('wezterm')
local config = wezterm.config_builder()
local action = wezterm.action

-- Color Scheme
config.color_scheme = 'Kanagawa (Gogh)'

-- Font Settings
config.font = wezterm.font {
  family = 'Google Sans Code',
  italic = true
}
config.line_height = 1.1

-- Cursor Settings
config.default_cursor_style = 'BlinkingBlock'

-- Window Settings
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

-- Background Settings
config.window_background_opacity = 0.8
config.macos_window_background_blur = 30

-- Tab Bar Settings
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false

return config
