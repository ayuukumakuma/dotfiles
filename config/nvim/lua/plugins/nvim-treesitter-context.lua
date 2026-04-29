-- nvim-treesitter-context で現在位置の親スコープを上部に表示します。
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    max_lines = 3,
    multiline_threshold = 5,
    mode = "cursor",
  },
  keys = {
    {
      "[c",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Jump to treesitter context",
      silent = true,
    },
  },
}
