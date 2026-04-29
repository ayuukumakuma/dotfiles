-- trouble.nvim で diagnostics / quickfix / LSP 結果を一覧ペインとして扱います。
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    icons = {
      indent = {
        middle = " ",
        last = " ",
        top = " ",
        ws = "│  ",
      },
    },
    modes = {
      diagnostics = {
        groups = {
          { "filename", format = "{file_icon} {basename:Title} {count}" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "診断一覧を切り替え",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
      desc = "現在バッファの診断一覧を切り替え",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "シンボル一覧を切り替え",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP一覧を切り替え",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle focus=true<cr>",
      desc = "Quickfix一覧を切り替え",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle focus=true<cr>",
      desc = "Location一覧を切り替え",
    },
  },
}
