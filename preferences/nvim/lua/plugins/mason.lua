-- lsp

return {
  {
    -- lspのインストーラー
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          }
        end,
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup {
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                  },
                },
              },
            },
          }
        end
      }
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}
