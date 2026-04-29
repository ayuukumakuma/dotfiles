-- sunglasses.nvim で非アクティブウィンドウを控えめに暗くします。
return {
  "miversen33/sunglasses.nvim",
  opts = {
    filter_type = "SHADE",
    filter_percent = 0.5,
  },
  config = function(_, opts)
    require("sunglasses").setup(opts)

    local function restore_current_window()
      local ok, window = pcall(require, "sunglasses.window")
      if not ok then
        return
      end

      local current = window.get(-1)
      if current then
        current:unshade({ force = true })
      end
    end

    local function schedule_restore()
      vim.schedule(restore_current_window)
      vim.defer_fn(restore_current_window, 50)
    end

    vim.api.nvim_create_autocmd({ "TermClose", "WinClosed" }, {
      group = vim.api.nvim_create_augroup("sunglasses_float_restore", { clear = true }),
      desc = "Restore sunglasses highlight after closing floating windows",
      callback = schedule_restore,
    })
  end,
}
