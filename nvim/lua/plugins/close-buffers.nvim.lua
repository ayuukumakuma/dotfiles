return {
  "kazhala/close-buffers.nvim",
  config = function()
    require("close_buffers").setup({
      preserve_window_layout = { "this" },
      next_buffer_cmd = function(windows)
        require("bufferline").cycle(1)
        local bufnr = vim.api.nvim_get_current_buf()

        for _, window in ipairs(windows) do
          vim.api.nvim_win_set_buf(window, bufnr)
        end
      end,
    })

    vim.keymap.set("n", "<leader>ta", function()
      require("close_buffers").delete({ type = "all" })
    end, { silent = true, desc = "Close all buffers" })

    vim.keymap.set("n", "<leader>to", function()
      require("close_buffers").delete({ type = "other" })
    end, { silent = true, desc = "Close other buffers" })

    vim.keymap.set("n", "<leader>tc", function()
      require("close_buffers").delete({ type = "this" })
    end, { silent = true, desc = "Close current buffer" })
  end,
}
