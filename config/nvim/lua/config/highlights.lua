-- カラースキーム変更後も背景を透過するためのハイライト設定です。
local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "FoldColumn",
  "NonText",
  "EndOfBuffer",
}

local function hex_to_rgb(hex)
  return {
    tonumber(hex:sub(2, 3), 16),
    tonumber(hex:sub(4, 5), 16),
    tonumber(hex:sub(6, 7), 16),
  }
end

local function rgb_to_hex(rgb)
  return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

local function interpolate_color(from, to, progress)
  local start = hex_to_rgb(from)
  local finish = hex_to_rgb(to)

  return rgb_to_hex({
    math.floor(start[1] + (finish[1] - start[1]) * progress + 0.5),
    math.floor(start[2] + (finish[2] - start[2]) * progress + 0.5),
    math.floor(start[3] + (finish[3] - start[3]) * progress + 0.5),
  })
end

local function apply_transparent_background()
  local latte = require("config.colors").catppuccin_latte()

  for _, group in ipairs(transparent_groups) do
    local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
    highlight.bg = nil
    vim.api.nvim_set_hl(0, group, highlight)
  end

  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#ff9a9e" })
  for index = 1, 68 do
    vim.api.nvim_set_hl(0, ("SnacksDashboardHeaderGradient%d"):format(index), {
      fg = interpolate_color("#ff9a9e", "#fecfef", (index - 1) / 67),
    })
  end
  vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { fg = latte.text, bg = latte.mantle })
  vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { fg = latte.lavender, bg = latte.mantle })
end

apply_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent_background", { clear = true }),
  callback = apply_transparent_background,
})
