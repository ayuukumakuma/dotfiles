-- Neovim 標準 diagnostics の表示を明示します。
vim.diagnostic.config({
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = {
    prefix = "●",
    spacing = 2,
    source = "if_many",
  },
  virtual_lines = false,
  float = {
    border = "rounded",
    source = true,
  },
})
