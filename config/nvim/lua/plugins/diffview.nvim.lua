-- diffview.nvim で Git 差分とファイル履歴を専用タブで確認します。
return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewFocusFiles",
    "DiffviewLog",
    "DiffviewOpen",
    "DiffviewRefresh",
    "DiffviewToggleFiles",
  },
  keys = {
    {
      "<leader>gD",
      "<cmd>DiffviewOpen<cr>",
      desc = "Git差分ビューを開く",
    },
    {
      "<leader>gF",
      "<cmd>DiffviewOpen -- %<cr>",
      desc = "現在ファイルのGit差分",
    },
    {
      "<leader>gH",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "現在ファイルのGit履歴",
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "Git履歴ビューを開く",
    },
  },
  opts = function()
    local actions = require("diffview.actions")

    return {
      use_icons = true,
      keymaps = {
        file_panel = {
          {
            "n",
            "o",
            actions.goto_file_edit,
            { desc = "選択ファイルを通常バッファで開く" },
          },
        },
      },
    }
  end,
}
