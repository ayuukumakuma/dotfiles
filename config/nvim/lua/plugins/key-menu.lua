local groups = {
  { "<leader>g", "Git" },
  { "<leader>l", "LSP" },
  { "<leader>m", "Markdown" },
  { "<leader>n", "通知" },
  { "<leader>s", "検索" },
  { "<leader>u", "切り替え" },
  { "<leader>c", "コード" },
  { "g", "移動" },
  { "<C-w>", "ウィンドウ" },
}

return {
  "emmanueltouzery/key-menu.nvim",
  event = "VeryLazy",
  config = function()
    local key_menu = require("key-menu")

    key_menu.set("n", "<leader>")

    for _, group in ipairs(groups) do
      key_menu.set("n", group[1], { desc = group[2] })
    end
  end,
}
