local function toggle_diffview()
  local ok, lib = pcall(require, "diffview.lib")

  if ok and lib.get_current_view() then
    vim.cmd("DiffviewClose")
    return
  end

  vim.cmd("DiffviewOpen")
end

return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>gd",
      toggle_diffview,
      desc = "差分ビューを切り替え",
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "現在のファイルの履歴",
    },
    {
      "<leader>gH",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "リポジトリ履歴",
    },
  },
  opts = {
    use_icons = true,
    keymaps = {
      file_panel = {
        {
          "n",
          "o",
          function()
            require("diffview.actions").goto_file_edit()
          end,
          { desc = "選択したファイルを開く" },
        },
      },
    },
  },
}
