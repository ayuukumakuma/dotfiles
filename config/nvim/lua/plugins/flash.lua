local function flash_key(lhs, action, desc, mode)
  return {
    lhs,
    mode = mode,
    function()
      require("flash")[action]()
    end,
    desc = desc,
  }
end

return {
  "folke/flash.nvim",
  opts = {},
  keys = {
    flash_key("s", "jump", "Flash", { "n", "x", "o" }),
    flash_key("S", "treesitter", "Flash Treesitter", { "n", "x", "o" }),
    flash_key("r", "remote", "Remote Flash", "o"),
    flash_key("R", "treesitter_search", "Treesitter Search", { "o", "x" }),
    flash_key("<C-s>", "toggle", "Toggle Flash Search", "c"),
  },
}
