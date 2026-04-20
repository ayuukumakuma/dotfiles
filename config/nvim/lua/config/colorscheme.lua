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

local function apply_noice_highlights()
  local palette = diffview_palette()
  local popup_groups = {
    "NoiceCmdlinePopup",
    "NoiceCmdlinePopupBorder",
    "NoiceConfirm",
    "NoiceConfirmBorder",
    "NoicePopup",
    "NoicePopupBorder",
  }

  set_highlights(popup_groups, {
    bg = palette.base,
    fg = palette.text,
  })

  local border_groups = {
    NoiceCmdlinePopupBorderCmdline = palette.blue,
    NoiceCmdlinePopupBorderSearch = palette.green,
    NoiceCmdlinePopupBorderHelp = palette.mauve,
  }

  vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", {
    fg = palette.blue,
    bg = palette.base,
  })

  set_named_highlights(border_groups, palette.base)

  vim.api.nvim_set_hl(0, "NoiceMini", {
    bg = palette.mantle,
    fg = palette.text,
  })
  vim.api.nvim_set_hl(0, "NotifyBackground", {
    bg = palette.base,
  })

  local notify_highlights = {
    NotifyDEBUGBorder = palette.sky,
    NotifyDEBUGIcon = palette.sky,
    NotifyDEBUGTitle = palette.sky,
    NotifyINFOBorder = palette.blue,
    NotifyINFOIcon = palette.blue,
    NotifyINFOTitle = palette.blue,
  }

  set_named_highlights(notify_highlights, palette.base)
end

require("catppuccin").setup({
  flavour = "latte",
  term_colors = true,
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin")
apply_transparent_highlights()
apply_diffview_highlights()
apply_noice_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    apply_transparent_highlights()
    apply_diffview_highlights()
    apply_noice_highlights()
  end,
  group = vim.api.nvim_create_augroup("user-colorscheme-overrides", { clear = true }),
})
