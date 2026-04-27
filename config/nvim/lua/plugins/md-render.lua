return {
  "delphinus/md-render.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "delphinus/budoux.lua",
  },
  keys = {
    { "<leader>mp", "<Plug>(md-render-preview)", desc = "マークダウンプレビューを切り替え" },
    { "<leader>mt", "<Plug>(md-render-preview-tab)", desc = "マークダウンプレビューをタブで切り替え" },
    { "<leader>md", "<Plug>(md-render-demo)", desc = "マークダウンレンダリングデモ" },
  },
}
