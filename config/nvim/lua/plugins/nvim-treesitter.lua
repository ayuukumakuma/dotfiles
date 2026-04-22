local markdown_augroup = vim.api.nvim_create_augroup("markdown_treesitter", { clear = true })

local markdown_parsers = {
  "markdown",
  "markdown_inline",
  "html",
  "yaml",
}

local function setup_markdown_buffer(args)
  vim.opt_local.foldenable = false
  vim.treesitter.start(args.buf, "markdown")
end

return {
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
}
