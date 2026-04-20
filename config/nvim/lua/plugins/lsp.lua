local lsp_servers = {
  "bashls",
  "jsonls",
  "lua_ls",
  "marksman",
  "nixd",
  "taplo",
  "yamlls",
}

local mason_packages = {
  "bash-language-server",
  "json-lsp",
  "just-lsp",
  "lua-language-server",
  "marksman",
  "nixd",
  "prettier",
  "shellcheck",
  "shfmt",
  "stylua",
  "taplo",
  "yaml-language-server",
  "nixfmt",
}

return {
  {
    "mason-org/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonLog",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonUpdate",
    },
    opts = {},
  },
  {
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
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = mason_packages,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      require("config.lsp").setup()
    end,
  },
}
