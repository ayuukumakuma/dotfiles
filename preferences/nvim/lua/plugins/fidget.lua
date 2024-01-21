-- lspの読み込み進捗を表示

return {
  "j-hui/fidget.nvim",
  tag = 'legacy',
  config = function()
    require("fidget").setup {}
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
}
