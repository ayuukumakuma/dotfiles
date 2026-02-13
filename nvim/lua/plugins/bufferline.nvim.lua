return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup {
      options = {
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
        indicator = {
          style = 'underline'
        },
      },
      highlights = require("catppuccin.special.bufferline").get_theme(),
    }

    vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Next bufferline tab" })
    vim.keymap.set("n", "<leader><S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Previous bufferline tab" })
  end,
}
