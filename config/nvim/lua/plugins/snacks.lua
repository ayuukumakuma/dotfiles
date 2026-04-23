local terminal_id = 1
local default_terminal_position = "float"
local alternate_terminal_position = "bottom"
local current_terminal_position = default_terminal_position

local function picker_preview()
  return require("md-render.snacks").preview()
end

local function picker_files()
  Snacks.picker.files()
end

local function picker_smart()
  Snacks.picker.smart()
end

local function picker_grep()
  Snacks.picker.grep()
end

local function notification_history()
  Snacks.notifier.show_history()
end

local function dismiss_notifications()
  Snacks.notifier.hide()
end

local function terminal_win(position)
  local win = Snacks.win.resolve("terminal", { position = position }, { show = false })

  if position == "float" then
    win.border = "rounded"
    return win
  end

  win.height = 0.3
  return win
end

local function terminal_winbar(position)
  if position == "float" then
    return ""
  end

  return ("%s: %%{get(b:, 'term_title', '')}"):format(terminal_id)
end

local function terminal_opts(position)
  return {
    count = terminal_id,
    win = terminal_win(position),
  }
end

local function apply_terminal_layout(terminal, position)
  local layout = terminal_win(position)

  terminal.opts = vim.tbl_deep_extend("force", terminal.opts, layout)
  terminal.opts.position = layout.position
  terminal.opts.border = layout.border
  terminal.opts.height = layout.height
  terminal.opts.width = layout.width
  terminal.opts.backdrop = layout.backdrop
  terminal.opts.relative = layout.relative
  terminal.opts.wo = vim.tbl_deep_extend("force", terminal.opts.wo or {}, layout.wo or {})
  terminal.opts.wo.winbar = terminal_winbar(position)
end

local function toggle_terminal()
  Snacks.terminal.toggle(nil, terminal_opts(current_terminal_position))
end

local function next_terminal_position(position)
  if position == alternate_terminal_position then
    return default_terminal_position
  end

  return alternate_terminal_position
end

local function cycle_terminal_direction()
  local terminal = Snacks.terminal.get(nil, terminal_opts(current_terminal_position))
  local next_position = next_terminal_position(current_terminal_position)

  current_terminal_position = next_position

  if not terminal then
    Snacks.terminal.toggle(nil, terminal_opts(next_position))
    return
  end

  apply_terminal_layout(terminal, next_position)

  if terminal:valid() then
    terminal:hide()
  end

  terminal:show():focus()
end

local function exit_terminal_mode()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)

  vim.api.nvim_feedkeys(keys, "n", false)
end

local function from_terminal(action)
  return function()
    exit_terminal_mode()
    vim.schedule(action)
  end
end

return {
  "folke/snacks.nvim",
  priority = 900,
  lazy = false,
  dependencies = {
    "delphinus/md-render.nvim",
  },
  keys = {
    {
      "<leader>p",
      picker_files,
      desc = "ファイルを検索",
    },
    {
      "<leader>P",
      picker_smart,
      desc = "最近使ったファイルを検索",
    },
    {
      "<leader>f",
      picker_grep,
      desc = "文字列を検索",
    },
    {
      "<leader>nh",
      notification_history,
      desc = "通知履歴を開く",
    },
    {
      "<leader>nd",
      dismiss_notifications,
      desc = "表示中の通知を閉じる",
    },
    {
      "<leader>t",
      toggle_terminal,
      desc = "ターミナルを切り替え",
    },
    {
      "<leader>t",
      from_terminal(toggle_terminal),
      mode = "t",
      desc = "ターミナルを切り替え",
    },
    {
      "<S-Esc>",
      cycle_terminal_direction,
      desc = "ターミナル配置を切り替え",
    },
    {
      "<S-Esc>",
      from_terminal(cycle_terminal_direction),
      mode = "t",
      desc = "ターミナル配置を切り替え",
    },
  },
  ---@type snacks.Config
  opts = function()
    local preview = picker_preview()

    return {
      explorer = {
        enabled = false,
      },
      input = {
        enabled = false,
      },
      notifier = {
        enabled = true,
        style = "compact",
        timeout = 3000,
        top_down = false,
      },
      picker = {
        enabled = true,
        sources = {
          files = {
            hidden = true,
            preview = preview,
          },
          grep = {
            hidden = true,
            preview = preview,
          },
          smart = {
            preview = preview,
          },
        },
      },
      terminal = {
        enabled = true,
      },
      zen = {
        enabled = false,
      },
    }
  end,
}
