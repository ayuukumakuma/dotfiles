-- which-key.nvim で leader 配下のキーマップを見つけやすくします。
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file" },
      { "<leader>g", group = "git" },
      { "<leader>n", group = "notification" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "terminal" },
      { "<leader>u", group = "ui" },
      { "<leader>z", group = "zen" },
      { "<leader>?", desc = "バッファローカルキーマップ" },
    },
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
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      wo = {
        winblend = 10,
      },
    },
    layout = {
      width = { min = 20 },
      spacing = 3,
    },
    icons = {
      mappings = true,
    },
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        vim.defer_fn(function()
          require("which-key").show({ global = false })
        end, 0)
      end,
      desc = "バッファローカルキーマップ",
    },
  },
}
