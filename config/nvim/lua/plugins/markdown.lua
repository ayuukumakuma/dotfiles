local markdown_parsers = {
  "markdown",
  "markdown_inline",
  "html",
  "yaml",
}

local markdown_augroup = vim.api.nvim_create_augroup("markdown_treesitter", { clear = true })

local function setup_markdown_buffer(args)
  vim.opt_local.foldenable = false
  vim.treesitter.start(args.buf, "markdown")
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
      treesitter.install(markdown_parsers)

      vim.api.nvim_create_autocmd("FileType", {
        group = markdown_augroup,
        pattern = "markdown",
        callback = setup_markdown_buffer,
      })
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = {},
  },
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    init = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
    end,
  },
}
