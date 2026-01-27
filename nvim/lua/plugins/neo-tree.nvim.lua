return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,         -- 非表示ファイルも表示
          hide_dotfiles = false,  -- ドットファイル（.で始まるファイル）を隠さない
          hide_gitignored = false,-- .gitignore で無視されたファイルも隠さない
        },
      },
    })

    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({
        action = "focus",
        source = "filesystem",
        position = "left",
      })
    end, { desc = "NeoTree: focus file tree" })
  end,
}

