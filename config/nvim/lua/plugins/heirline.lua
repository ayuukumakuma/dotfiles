return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    require("config.heirline").setup()
  end,
}
