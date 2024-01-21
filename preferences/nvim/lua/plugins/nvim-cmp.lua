-- 補完
return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("cmp").setup {
      sources = require("cmp").config.sources {
        { name = 'nvim_lsp' }
      },
    }
  end,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

