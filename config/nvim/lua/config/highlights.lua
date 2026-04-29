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

local function apply_transparent_background()
  local latte = require("config.colors").catppuccin_latte()

  for _, group in ipairs(transparent_groups) do
    local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
    highlight.bg = nil
    vim.api.nvim_set_hl(0, group, highlight)
  end

  vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { fg = latte.text, bg = latte.mantle })
  vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { fg = latte.lavender, bg = latte.mantle })
end

apply_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent_background", { clear = true }),
  callback = apply_transparent_background,
})
