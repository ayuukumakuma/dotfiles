return {
  "delphinus/md-render.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "delphinus/budoux.lua",
  },
  keys = {
    { "<leader>mp", "<Plug>(md-render-preview)", desc = "Markdownプレビューを切り替え" },
    { "<leader>mt", "<Plug>(md-render-preview-tab)", desc = "Markdownプレビューをタブで切り替え" },
    { "<leader>md", "<Plug>(md-render-demo)", desc = "Markdownレンダリングデモ" },
  },
}
