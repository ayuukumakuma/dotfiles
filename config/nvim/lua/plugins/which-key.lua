return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "現在のバッファのキーマップ",
    },
  },
  opts = {
    preset = "modern",
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    spec = {
      { "<leader>g", group = "Git操作" },
      { "<leader>l", group = "LSP" },
      { "<leader>n", group = "通知・Noice" },
      { "<leader>z", group = "Zen" },
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
    },
    icons = {
      mappings = true,
      colors = true,
    },
  },
}
