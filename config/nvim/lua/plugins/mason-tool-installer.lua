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
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    ensure_installed = mason_packages,
  },
}
