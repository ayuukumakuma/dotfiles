local function noice_command(name)
  return function()
    require("noice").cmd(name)
  end
end

local center_popup = {
  position = {
    row = "40%",
    col = "50%",
  },
  size = {
    width = 60,
    height = "auto",
  },
}

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#eff1f5",
        render = "compact",
        timeout = 3000,
        top_down = false,
      },
    },
  },
  keys = {
    {
      "<leader>nh",
      noice_command("history"),
      desc = "通知履歴を開く",
    },
    {
      "<leader>nl",
      noice_command("last"),
      desc = "直近の通知を開く",
    },
    {
      "<leader>ne",
      noice_command("errors"),
      desc = "エラー通知を開く",
    },
    {
      "<leader>nd",
      noice_command("dismiss"),
      desc = "表示中の通知を閉じる",
    },
  },
  opts = {
    cmdline = {
      enabled = true,
    },
    messages = {
      enabled = true,
    },
    popupmenu = {
      enabled = true,
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = false,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = center_popup,
      cmdline_input = center_popup,
      popupmenu = {
        position = {
          row = "48%",
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
      },
    },
  },
}
