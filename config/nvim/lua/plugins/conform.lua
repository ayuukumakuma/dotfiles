local disabled_format_filetypes = {
  markdown = true,
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = {
    "ConformInfo",
  },
  opts = {
    formatters_by_ft = {
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      nix = { "nixfmt" },
      sh = { "shfmt" },
      toml = { "taplo" },
      yaml = { "prettier" },
    },
    format_on_save = function(bufnr)
      local filetype = vim.bo[bufnr].filetype

      if disabled_format_filetypes[filetype] then
        return nil
      end

      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  },
}
