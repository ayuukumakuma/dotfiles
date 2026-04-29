-- flash.nvim で検索ラベル付きの高速ジャンプ操作を追加します。
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      function()
        require("flash").jump()
      end,
      desc = "Flash ジャンプ",
      mode = { "n", "x", "o" },
    },
    {
      "S",
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
      mode = { "n", "x", "o" },
    },
    {
      "r",
      function()
        require("flash").remote()
      end,
      desc = "Flash リモート",
      mode = "o",
    },
    {
      "R",
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter 検索",
      mode = { "o", "x" },
    },
    {
      "<C-s>",
      function()
        require("flash").toggle()
      end,
      desc = "Flash 検索切り替え",
      mode = "c",
    },
  },
}
