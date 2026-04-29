-- staline.nvim で軽量なグローバル statusline を表示します。
return {
  "tamton-aquib/staline.nvim",
  event = "VeryLazy",
  config = function()
    local colors = require("config.colors").catppuccin_latte()

    local function save_state_text()
      if vim.bo.readonly then
        return "  "
      end

      if vim.bo.modified then
        return " ● "
      end

      return " ✓ "
    end

    local function language_icon_text()
      local filetype = vim.bo.filetype
      local ok, mini_icons = pcall(require, "mini.icons")

      if ok and filetype ~= "" then
        local icon = mini_icons.get("filetype", filetype)
        return icon .. " "
      end

      return "󰈙 "
    end

    local function file_name_text()
      local name = vim.fn.expand("%:t")

      if name == "" then
        return "[No Name] "
      end

      return name .. " "
    end

    local function save_state()
      return { "Staline", save_state_text() }
    end

    local function language_icon()
      return { "Staline", language_icon_text() }
    end

    local function file_name()
      return { "Staline", file_name_text() }
    end

    local function line()
      local left_width = vim.fn.strdisplaywidth(save_state_text() .. file_name_text() .. language_icon_text())
      local line_width = math.max(vim.o.columns - left_width - 1, 1)

      return { "Staline", ("▁"):rep(line_width) }
    end

    require("staline").setup({
      defaults = {
        expand_null_ls = false,
        left_separator = "",
        right_separator = "",
        full_path = false,
        line_column = " [%l/%L] :%c  ",

        fg = colors.text,
        bg = "none",
        inactive_color = colors.overlay0,
        inactive_bgcolor = "none",
        true_colors = true,
        font_active = "bold",

        mod_symbol = " ● ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 16,
        branch_symbol = " ",
        cool_symbol = " ",
        null_ls_symbol = "",
      },
      mode_colors = {
        n = colors.teal,
        i = colors.yellow,
        c = colors.green,
        v = colors.peach,
        V = colors.peach,
        [""] = colors.peach,
        R = colors.red,
        r = colors.red,
        t = colors.teal,
      },
      mode_icons = {
        n = " ",
        i = " ",
        c = " ",
        v = "󰈈 ",
        V = "󰈈 ",
        [""] = "󰈈 ",
        R = "󰑖 ",
        r = "󰑖 ",
        t = " ",
      },
      sections = {
        left = { save_state, file_name, language_icon, line },
        mid = {},
        right = {},
      },
      inactive_sections = {
        left = { save_state, file_name, language_icon, line },
        mid = {},
        right = {},
      },
      special_table = {
        NvimTree = { "NvimTree", " " },
        lazy = { "Lazy", "󰒲 " },
        snacks_dashboard = { "Dashboard", " " },
      },
      lsp_symbols = {
        Error = " ",
        Info = " ",
        Warn = " ",
        Hint = " ",
      },
    })

    require("stabline").setup({
      style = "bubble",
      bg = colors.surface0,
      fg = colors.text,
      inactive_bg = colors.mantle,
      inactive_fg = colors.overlay0,
      stab_bg = "none",
      font_active = "bold",
      exclude_fts = { "NvimTree", "help", "lazy", "snacks_dashboard" },
      numbers = "ordinal",
    })

    vim.o.statusline = "%!v:lua.require'staline'.get_statusline('active')"
    vim.o.showtabline = 2
  end,
}
