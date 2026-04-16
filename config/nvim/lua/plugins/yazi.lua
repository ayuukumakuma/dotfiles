return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    {
      "nvim-mini/mini.icons",
      opts = {},
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Oil<cr>",
      desc = "Open file explorer",
    },
  },
  opts = {
    default_file_explorer = true,
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
