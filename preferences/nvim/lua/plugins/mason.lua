return {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("null-ls").setup()
      require("mason-null-ls").setup()
      require("mason-lspconfig").setup()
    end
}
