-- mini.animate でカーソル移動やウィンドウ操作に軽いアニメーションを追加します。
-- スクロールは snacks.nvim 側に任せ、二重に smooth scroll しないよう無効化します。
return {
  "nvim-mini/mini.animate",
  event = "VeryLazy",
  opts = function()
    local animate = require("mini.animate")
    local fast_timing = animate.gen_timing.linear({ duration = 90, unit = "total" })

    return {
      cursor = {
        timing = fast_timing,
        path = animate.gen_path.line({ max_output_steps = 120 }),
      },
      resize = {
        timing = fast_timing,
      },
      open = {
        timing = fast_timing,
        winconfig = animate.gen_winconfig.static({ n_steps = 12 }),
      },
      close = {
        timing = fast_timing,
        winconfig = animate.gen_winconfig.static({ n_steps = 12 }),
      },
      scroll = {
        enable = false,
      },
    }
  end,
}
