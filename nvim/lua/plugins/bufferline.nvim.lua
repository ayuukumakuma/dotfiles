return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup {
      options = {
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
        indicator = {
          style = 'underline'
        },
      },
      highlights = {
        fill = { bg = 'NONE' },
        background = { bg = 'NONE' },

        buffer_selected = {
          bg = 'NONE',
          sp = '#ff00ff',
          underline = true,
          bold = true,
          italic = false,
        },
        buffer_visible = { bg = 'NONE' },

        -- 閉じるボタン周辺
        close_button = { bg = 'NONE' },
        close_button_visible = { bg = 'NONE' },
        close_button_selected = { bg = 'NONE' },

        -- セパレーター（区切り線）
        separator = { bg = 'NONE' },
        separator_visible = { bg = 'NONE' },
        separator_selected = { bg = 'NONE' },

        -- インジケーター（左端の棒やアイコン下線）
        indicator_visible = { bg = 'NONE' },
        indicator_selected = { bg = 'NONE' },

        -- 変更ありマーカー
        modified = { bg = 'NONE' },
        modified_visible = { bg = 'NONE' },
        modified_selected = { bg = 'NONE' },

        -- 重複ファイル名
        duplicate = { bg = 'NONE' },
        duplicate_visible = { bg = 'NONE' },
        duplicate_selected = { bg = 'NONE' },

        -- 診断（Diagnostic）系
        diagnostic = { bg = 'NONE' },
        diagnostic_visible = { bg = 'NONE' },
        diagnostic_selected = { bg = 'NONE' },

        hint = { bg = 'NONE' },
        hint_visible = { bg = 'NONE' },
        hint_selected = { bg = 'NONE' },
        hint_diagnostic = { bg = 'NONE' },
        hint_diagnostic_visible = { bg = 'NONE' },
        hint_diagnostic_selected = { bg = 'NONE' },

        info = { bg = 'NONE' },
        info_visible = { bg = 'NONE' },
        info_selected = { bg = 'NONE' },
        info_diagnostic = { bg = 'NONE' },
        info_diagnostic_visible = { bg = 'NONE' },
        info_diagnostic_selected = { bg = 'NONE' },

        warning = { bg = 'NONE' },
        warning_visible = { bg = 'NONE' },
        warning_selected = { bg = 'NONE' },
        warning_diagnostic = { bg = 'NONE' },
        warning_diagnostic_visible = { bg = 'NONE' },
        warning_diagnostic_selected = { bg = 'NONE' },

        error = { bg = 'NONE' },
        error_visible = { bg = 'NONE' },
        error_selected = { bg = 'NONE' },
        error_diagnostic = { bg = 'NONE' },
        error_diagnostic_visible = { bg = 'NONE' },
        error_diagnostic_selected = { bg = 'NONE' },

        -- 左端の余白やPickモード用
        pick_selected = { bg = 'NONE', bold = true, italic = true },
        pick_visible = { bg = 'NONE', bold = true, italic = true },
        pick = { bg = 'NONE', bold = true, italic = true },

        -- 切り詰めマーカーなど
        trunc_marker = { bg = 'NONE' },
      }
    }

    vim.keymap.set("n", "<leader><Tab>", "<Cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Next bufferline tab" })
    vim.keymap.set("n", "<leader><S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Previous bufferline tab" })
  end,
}
