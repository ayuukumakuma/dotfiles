return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = false,
  keys = {
    {
      "<leader>zz",
      "<cmd>NoNeckPain<cr>",
      desc = "中央寄せを切り替える",
    },
    {
      "<leader>z=",
      "<cmd>NoNeckPainWidthUp<cr>",
      desc = "中央幅を広げる",
    },
    {
      "<leader>z-",
      "<cmd>NoNeckPainWidthDown<cr>",
      desc = "中央幅を狭める",
    },
  },
  opts = {
    autocmds = {
      enableOnVimEnter = "safe",
    },
    mappings = {
      enabled = false,
    },
  },
}
