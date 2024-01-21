local options = {
  number = true,
  clipboard = "unnamedplus",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  cursorline = true,
  termguicolors = true,
  expandtab = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
