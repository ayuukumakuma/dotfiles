-- noice.nvim でコマンドラインとメッセージ表示を整える設定です。
-- 通知表示は snacks.nvim の notifier に任せます。
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },
    notify = {
      enabled = false,
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    popupmenu = {
      backend = "nui",
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
