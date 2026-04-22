local lsp_servers = {
  "bashls",
  "jsonls",
  "lua_ls",
  "marksman",
  "taplo",
  "yamlls",
}

return {
  "mason-org/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = lsp_servers,
    automatic_enable = false,
  },
}
