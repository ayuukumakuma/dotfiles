-- カラースキーム変更後も背景を透過するためのハイライト設定です。
local transparent_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "FoldColumn",
  "NonText",
  "EndOfBuffer",
}

local function apply_transparent_background()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end

  vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { bg = "#1f2335" })
  vim.api.nvim_set_hl(0, "SnacksTerminalBorder", { fg = "#7aa2f7", bg = "#1f2335" })
end

apply_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("transparent_background", { clear = true }),
  callback = apply_transparent_background,
})
