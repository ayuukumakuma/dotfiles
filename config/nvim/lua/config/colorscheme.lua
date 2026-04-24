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

local function palette()
  return require("catppuccin.palettes").get_palette("latte")
end

local function set_highlights(groups, options)
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, options)
  end
end

local function set_named_highlights(groups, background)
  for group, fg in pairs(groups) do
    vim.api.nvim_set_hl(0, group, {
      fg = fg,
      bg = background,
    })
  end
end

local function apply_noice_highlights()
  local colors = palette()
  local popup_groups = {
    "NoiceCmdlinePopup",
    "NoiceCmdlinePopupBorder",
    "NoiceConfirm",
    "NoiceConfirmBorder",
    "NoicePopup",
    "NoicePopupBorder",
  }

  set_highlights(popup_groups, {
    bg = colors.base,
    fg = colors.text,
  })

  set_named_highlights({
    NoiceCmdlinePopupBorderCmdline = colors.blue,
    NoiceCmdlinePopupBorderSearch = colors.green,
    NoiceCmdlinePopupBorderHelp = colors.mauve,
  }, colors.base)

  vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", {
    fg = colors.blue,
    bg = colors.base,
  })
  vim.api.nvim_set_hl(0, "NoiceMini", {
    bg = colors.mantle,
    fg = colors.text,
  })
end

require("catppuccin").setup({
  flavour = "latte",
  term_colors = true,
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin")
apply_transparent_highlights()
apply_noice_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    apply_transparent_highlights()
    apply_noice_highlights()
  end,
  group = vim.api.nvim_create_augroup("user-colorscheme-overrides", { clear = true }),
})
