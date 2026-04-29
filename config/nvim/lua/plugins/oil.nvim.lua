-- oil.nvim でディレクトリを通常のバッファのように編集できるようにします。
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "親ディレクトリを開く" },
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
