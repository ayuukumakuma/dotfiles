-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- color scheme
config.color_scheme = "nord"

-- other config
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBlock"
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 140
config.initial_rows = 50

-- 背景透過
config.window_background_opacity = 0.4
config.macos_window_background_blur = 20

-- font
config.font = wezterm.font("MonaspiceAr Nerd Font Mono", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font_size = 16
-- and finally, return the configuration to wezterm
return config
