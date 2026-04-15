local transparent_groups = {
  "CursorLineNr",
  "EndOfBuffer",
  "FoldColumn",
  "LineNr",
  "Normal",
  "NormalNC",
  "SignColumn",
}

local function apply_transparent_highlights()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

require("catppuccin").setup({
  flavour = "latte",
  term_colors = true,
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin")
apply_transparent_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_transparent_highlights,
  group = vim.api.nvim_create_augroup("user-colorscheme-overrides", { clear = true }),
})
