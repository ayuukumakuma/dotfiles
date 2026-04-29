-- Catppuccin Latte を透過背景で読み込みます。
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "latte",
    transparent_background = true,
    float = {
      transparent = true,
    },
    integrations = {
      noice = true,
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
      treesitter = true,
      trouble = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-latte")
  end,
}
