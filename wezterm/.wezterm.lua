local wezterm = require 'wezterm'

-- .envから環境変数を読み込む
local load_env = function(file)
  local env = {}

  for line in io.lines(file) do
    -- 行が空行やコメント行（#で始まる）でない場合
    if line:match("^%s*#") == nil and line:match("^%s*$") == nil then
      -- KEY=VALUEの形式を解析
      local key, value = line:match("^%s*([^=]+)%s*=%s*(.*)%s*$")

      if key and value then
        -- 環境変数として設定
        env[key] = value
      end
    end
  end

  return env
end

local dirName = os.getenv("HOME")
local env = load_env(string.format("%s/dotfiles/.env", dirName))

local config = wezterm.config_builder()
local act = wezterm.action

-- Color scheme
config.color_scheme = 'Kanagawa (Gogh)'

-- Background
config.background = {
  {
    source = {
      File = env.BACKGROUND_IMAGE_PATH
    },
    attachment = { Parallax = 0.05 },
    hsb = {
      brightness = 0.05,
    }
  }

}

-- Cursor
config.default_cursor_style = "BlinkingBlock"

-- TabBar
config.hide_tab_bar_if_only_one_tab = true -- タブが1つだけの場合はタブバーを非表示にする
config.show_tab_index_in_tab_bar    = false -- タブバーにインデックスを表示しない

-- Font
config.line_height                              = 1.1
config.treat_east_asian_ambiguous_width_as_wide = true -- 日本語を2文字分の幅で表示する
config.font                                     = wezterm.font "MonaspiceAr Nerd Font Mono"
config.font_size                                = 14

-- Window
config.window_decorations        = "RESIZE" -- タイトルバーを非表示にする
config.window_close_confirmation = "NeverPrompt" -- ウィンドウを閉じる際の確認を行わない
config.initial_rows              = 50 -- 初期の行数
config.initial_cols              = 150 -- 初期の列数

-- KeyConfig
config.keys =  {
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    key = 'h',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
}

return config
