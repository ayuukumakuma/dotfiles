-- nvim-lspconfig のサーバー定義を使い、Neovim 標準 LSP API で有効化します。
-- LSP サーバー本体は Nix/Home Manager 側で宣言的に管理します。
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.enable({ "nixd", "just" })
  end,
}
