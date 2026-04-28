local parsers = {
  "bash",
  "lua",
  "markdown",
  "markdown_inline",
  "regex",
  "vim",
  "vimdoc",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    require("nvim-treesitter").install(parsers, { force = true }):wait(300000)
  end,
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "bash", "lua", "markdown", "sh", "vim", "vimdoc" },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
