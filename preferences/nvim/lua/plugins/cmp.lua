return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require'cmp'
    local lspkind = require'lspkind'
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters
          ellipsis_char = '...', -- when popup menu exceed maxwidth, show this char
          before = function (entry, vim_item)
            -- ここにポップアップのカスタマイズを書ける
            return vim_item
          end
        })
      }
    }
  end
}

