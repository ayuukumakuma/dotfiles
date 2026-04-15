return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = function()
    local C = require("catppuccin.palettes").get_palette("frappe")
    local transparent_bg = "NONE"

    return {
      flavour = "frappe",
      transparent_background = true,
      integrations = {
        neotree = true,
        gitsigns = true,
        nvim_surround = false,
        telescope = {
          enabled = true
        },
        lualine = {
          normal = {
            a = { bg = C.blue, fg = C.mantle, gui = "bold" },
            b = { bg = C.surface0, fg = C.blue },
            c = { bg = transparent_bg, fg = C.text },
          },
          insert = {
            a = { bg = C.green, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.green },
          },
          terminal = {
            a = { bg = C.green, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.green },
          },
          command = {
            a = { bg = C.peach, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.peach },
          },
          visual = {
            a = { bg = C.mauve, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.mauve },
          },
          replace = {
            a = { bg = C.red, fg = C.base, gui = "bold" },
            b = { bg = C.surface0, fg = C.red },
          },
          inactive = {
            a = { bg = transparent_bg, fg = C.blue },
            b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
            c = { bg = transparent_bg, fg = C.overlay0 },
          },
        },
      },
      custom_highlights = function()
        return {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          CursorLineNr = { bg = "NONE" },
          VertSplit = { bg = "NONE" },
          StatusLine = { bg = "NONE" },
          TabLineFill = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          Pmenu = { bg = "NONE" },
          EndOfBuffer = { bg = "NONE" },
        }
      end,
    }
  end,
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
