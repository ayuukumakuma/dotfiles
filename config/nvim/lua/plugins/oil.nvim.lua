-- oil.nvim でディレクトリを通常のバッファのように編集できるようにします。
return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
