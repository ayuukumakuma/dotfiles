return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      open_mapping = [[<leader>`]],
      shade_terminals = true,
      shading_factor = -30,
    })
  end,
}
