local transparent_groups = {
  "CursorLineNr",
  "EndOfBuffer",
  "FoldColumn",
  "LineNr",
  "Normal",
  "NormalNC",
  "SignColumn",
}

local function diffview_palette()
  return require("catppuccin.palettes").get_palette("latte")
end

local function apply_transparent_highlights()
  for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

local function apply_diffview_highlights()
  local palette = diffview_palette()

  vim.api.nvim_set_hl(0, "DiffviewNormal", {
    fg = palette.text,
    bg = "none",
  })
  vim.api.nvim_set_hl(0, "DiffviewFilePanelFileName", {
    fg = palette.text,
  })
  vim.api.nvim_set_hl(0, "DiffviewFilePanelPath", {
    fg = palette.overlay0,
  })
  vim.api.nvim_set_hl(0, "DiffviewFolderName", {
    fg = palette.blue,
  })
  vim.api.nvim_set_hl(0, "DiffviewFilePanelSelected", {
    fg = palette.blue,
    bold = true,
  })
end

require("catppuccin").setup({
  flavour = "latte",
  term_colors = true,
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin")
apply_transparent_highlights()
apply_diffview_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    apply_transparent_highlights()
    apply_diffview_highlights()
  end,
  group = vim.api.nvim_create_augroup("user-colorscheme-overrides", { clear = true }),
})
