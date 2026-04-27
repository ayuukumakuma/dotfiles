local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

local function capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok then
    return blink.get_lsp_capabilities()
  end

  return vim.lsp.protocol.make_client_capabilities()
end

return {
  "pmizio/typescript-tools.nvim",
  ft = filetypes,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = function()
    return {
      capabilities = capabilities(),
      settings = {
        expose_as_code_action = "all",
        publish_diagnostic_on = "insert_leave",
        tsserver_max_memory = "auto",
      },
    }
  end,
  keys = {
    {
      "<leader>co",
      "<cmd>TSToolsOrganizeImports<cr>",
      ft = filetypes,
      desc = "インポートを整理",
    },
    {
      "<leader>cf",
      "<cmd>TSToolsFixAll<cr>",
      ft = filetypes,
      desc = "利用可能な修正を適用",
    },
    {
      "<leader>cr",
      "<cmd>TSToolsRenameFile<cr>",
      ft = filetypes,
      desc = "ファイル名を変更",
    },
  },
}
