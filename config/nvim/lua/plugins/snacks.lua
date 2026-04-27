local terminal_state = {
  id = 1,
  default_position = "float",
  alternate_position = "bottom",
  current_position = "float",
}

local supported_image_terminals = {
  ghostty = true,
  wezterm = true,
}

local function has_executable(binary)
  return vim.fn.executable(binary) == 1
end

local function picker_preview()
  return require("md-render.snacks").preview()
end

local function picker(name, opts)
  return function()
    Snacks.picker[name](opts)
  end
end

local function picker_word()
  Snacks.picker.grep_word()
end

local function notification_history()
  Snacks.notifier.show_history()
end

local function notification_picker()
  Snacks.picker.notifications()
end

local function dismiss_notifications()
  Snacks.notifier.hide()
end

local function explorer_open()
  Snacks.explorer.open()
end

local function explorer_reveal()
  Snacks.explorer.reveal()
end

local function gitbrowse_open()
  Snacks.gitbrowse()
end

local function lazygit_open()
  Snacks.lazygit()
end

local function lazygit_log()
  Snacks.lazygit.log()
end

local function lazygit_log_file()
  Snacks.lazygit.log_file()
end

local function profiler_scratch()
  Snacks.profiler.scratch()
end

local function debug_metrics()
  Snacks.debug.metrics()
end

local function scratch_toggle()
  Snacks.scratch()
end

local function scratch_select()
  Snacks.scratch.select()
end

local function buffer_delete()
  Snacks.bufdelete()
end

local function rename_file()
  Snacks.rename.rename_file()
end

local function zen_toggle()
  Snacks.zen()
end

local function zen_zoom_toggle()
  Snacks.zen.zoom()
end

local function image_enabled()
  if not has_executable("magick") then
    return false
  end

  if vim.env.KITTY_PID or vim.env.KITTY_WINDOW_ID then
    return true
  end

  return supported_image_terminals[(vim.env.TERM_PROGRAM or ""):lower()] == true
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

  return ("%s: %%{get(b:, 'term_title', '')}"):format(terminal_state.id)
end

local function terminal_opts(position)
  return {
    count = terminal_state.id,
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
  Snacks.terminal.toggle(nil, terminal_opts(terminal_state.current_position))
end

local function next_terminal_position(position)
  if position == terminal_state.alternate_position then
    return terminal_state.default_position
  end

  return terminal_state.alternate_position
end

local function cycle_terminal_direction()
  local terminal = Snacks.terminal.get(nil, terminal_opts(terminal_state.current_position))
  local next_position = next_terminal_position(terminal_state.current_position)

  terminal_state.current_position = next_position

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

local function dashboard_keys()
  return {
    { icon = " ", key = "p", desc = "ファイルを検索", action = picker("files") },
    { icon = "󰱼 ", key = "g", desc = "文字列を検索", action = picker("grep") },
    { icon = " ", key = "r", desc = "最近使ったファイル", action = picker("recent") },
    { icon = "󰒲 ", key = "l", desc = "プラグイン管理を開く", action = ":Lazy" },
    { icon = " ", key = "q", desc = "終了", action = ":qa" },
  }
end

local function dashboard_section(item)
  return vim.tbl_extend("force", {
    align = "center",
  }, item)
end

local function picker_sources(preview)
  return {
    buffers = {
      preview = preview,
    },
    explorer = {
      hidden = true,
      ignored = true,
      preview = preview,
    },
    files = {
      hidden = true,
      ignored = true,
      preview = preview,
    },
    git_files = {
      preview = preview,
    },
    git_status = {
      preview = preview,
    },
    grep = {
      hidden = true,
      preview = preview,
    },
    recent = {
      preview = preview,
    },
    smart = {
      preview = preview,
    },
  }
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
      picker("files"),
      desc = "ファイルを検索",
    },
    {
      "<leader>P",
      picker("smart"),
      desc = "最近使ったファイルを検索",
    },
    {
      "<leader>f",
      picker("grep"),
      desc = "文字列を検索",
    },
    {
      "<leader>b",
      picker("buffers"),
      desc = "バッファを検索",
    },
    {
      "<leader>/",
      picker_word,
      mode = { "n", "x" },
      desc = "カーソル語句を検索",
    },
    {
      "<leader>nh",
      notification_history,
      desc = "通知履歴を開く",
    },
    {
      "<leader>nn",
      notification_picker,
      desc = "通知を検索",
    },
    {
      "<leader>nd",
      dismiss_notifications,
      desc = "表示中の通知を閉じる",
    },
    {
      "<leader>sb",
      picker("lines"),
      desc = "バッファ行を検索",
    },
    {
      "<leader>sB",
      picker("grep_buffers"),
      desc = "開いているバッファを横断検索",
    },
    {
      "<leader>sc",
      picker("command_history"),
      desc = "コマンド履歴を検索",
    },
    {
      "<leader>sC",
      picker("commands"),
      desc = "コマンドを検索",
    },
    {
      "<leader>sd",
      picker("diagnostics"),
      desc = "診断を検索",
    },
    {
      "<leader>sD",
      picker("diagnostics_buffer"),
      desc = "現在バッファの診断を検索",
    },
    {
      "<leader>sh",
      picker("help"),
      desc = "ヘルプを検索",
    },
    {
      "<leader>sj",
      picker("jumps"),
      desc = "ジャンプリストを検索",
    },
    {
      "<leader>sk",
      picker("keymaps"),
      desc = "キーマップを検索",
    },
    {
      "<leader>sl",
      picker("loclist"),
      desc = "ロケーションリストを開く",
    },
    {
      "<leader>sm",
      picker("marks"),
      desc = "マークを検索",
    },
    {
      "<leader>sp",
      picker("lazy"),
      desc = "プラグイン定義を検索",
    },
    {
      "<leader>sq",
      picker("qflist"),
      desc = "クイックフィックスリストを開く",
    },
    {
      "<leader>sr",
      picker("resume"),
      desc = "直前のピッカーを再開",
    },
    {
      "<leader>su",
      picker("undo"),
      desc = "元に戻す履歴を検索",
    },
    {
      "<leader>gb",
      picker("git_branches"),
      desc = "ブランチを検索",
    },
    {
      "<leader>gd",
      picker("git_diff"),
      desc = "変更差分を検索",
    },
    {
      "<leader>gf",
      picker("git_log_file"),
      desc = "現在ファイルの変更履歴を検索",
    },
    {
      "<leader>gl",
      picker("git_log"),
      desc = "変更履歴を検索",
    },
    {
      "<leader>gL",
      picker("git_log_line"),
      desc = "現在行の変更履歴を検索",
    },
    {
      "<leader>gs",
      picker("git_status"),
      desc = "変更状態を検索",
    },
    {
      "<leader>gS",
      picker("git_stash"),
      desc = "退避した変更を検索",
    },
    {
      "<leader>gB",
      gitbrowse_open,
      mode = { "n", "x" },
      desc = "リモートリポジトリを開く",
    },
    {
      "<leader>gg",
      lazygit_open,
      desc = "バージョン管理画面を開く",
    },
    {
      "<leader>gi",
      picker("gh_issue"),
      desc = "課題を検索",
    },
    {
      "<leader>z",
      zen_toggle,
      desc = "集中モードを切り替え",
    },
    {
      "<leader>Z",
      zen_zoom_toggle,
      desc = "ズームを切り替え",
    },
    {
      "<leader>gI",
      picker("gh_issue", { state = "all" }),
      desc = "すべての課題を検索",
    },
    {
      "<leader>gp",
      picker("gh_pr"),
      desc = "プルリクエストを検索",
    },
    {
      "<leader>gP",
      picker("gh_pr", { state = "all" }),
      desc = "すべてのプルリクエストを検索",
    },
    {
      "<leader>pm",
      debug_metrics,
      desc = "プラグインのメトリクスを表示",
    },
    {
      "<leader>ps",
      profiler_scratch,
      desc = "プロファイラー用スクラッチを開く",
    },
    {
      "<leader>.",
      scratch_toggle,
      desc = "スクラッチを切り替え",
    },
    {
      "<leader>S",
      scratch_select,
      desc = "スクラッチを選択",
    },
    {
      "<leader>bd",
      buffer_delete,
      desc = "バッファを削除",
    },
    {
      "<leader>cR",
      rename_file,
      desc = "ファイル名を変更",
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
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      mode = { "n", "t" },
      desc = "次の参照へ移動",
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      mode = { "n", "t" },
      desc = "前の参照へ移動",
    },
  },
  ---@type snacks.Config
  opts = function()
    local preview = picker_preview()

    return {
      bigfile = {
        enabled = true,
      },
      bufdelete = {
        enabled = true,
      },
      dashboard = {
        enabled = true,
        width = 64,
        preset = {
          header = [[
███████╗███╗   ██╗ █████╗  ██████╗██╗  ██╗███████╗
██╔════╝████╗  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝
███████╗██╔██╗ ██║███████║██║     █████╔╝ ███████╗
╚════██║██║╚██╗██║██╔══██║██║     ██╔═██╗ ╚════██║
███████║██║ ╚████║██║  ██║╚██████╗██║  ██╗███████║
╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝]],
          keys = dashboard_keys(),
        },
        sections = {
          dashboard_section({ section = "header" }),
          dashboard_section({ section = "keys", gap = 1, padding = 1 }),
          dashboard_section({ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 }),
          dashboard_section({ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 }),
          dashboard_section({
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }),
          dashboard_section({ section = "startup" }),
        },
      },
      dim = {
        enabled = true,
      },
      explorer = {
        enabled = false,
      },
      gh = {
        enabled = has_executable("gh"),
      },
      git = {
        enabled = true,
      },
      gitbrowse = {
        enabled = true,
      },
      image = {
        enabled = image_enabled(),
      },
      indent = {
        enabled = true,
      },
      input = {
        enabled = true,
      },
      lazygit = {
        enabled = has_executable("lazygit"),
      },
      notifier = {
        enabled = true,
        style = "compact",
        timeout = 3000,
        top_down = false,
      },
      picker = {
        enabled = true,
        sources = picker_sources(preview),
      },
      profiler = {
        enabled = true,
      },
      quickfile = {
        enabled = true,
      },
      rename = {
        enabled = true,
      },
      scope = {
        enabled = true,
      },
      scratch = {
        enabled = true,
      },
      scroll = {
        enabled = true,
      },
      statuscolumn = {
        enabled = true,
      },
      styles = {
        notification = {
          border = "rounded",
        },
      },
      terminal = {
        enabled = true,
      },
      toggle = {
        enabled = true,
        which_key = true,
      },
      words = {
        enabled = true,
      },
      zen = {
        enabled = false,
      },
    }
  end,
  config = function(_, opts)
    local snacks = require("snacks")
    local toggle = snacks.toggle

    snacks.setup(opts)

    toggle.option("spell", { name = "スペルチェック" }):map("<leader>us")
    toggle.option("wrap", { name = "折り返し" }):map("<leader>uw")
    toggle.line_number():map("<leader>ul")
    toggle.diagnostics():map("<leader>ud")
    toggle.indent():map("<leader>ug")
    toggle.scroll():map("<leader>uS")
    toggle.words():map("<leader>ur")
    toggle.dim():map("<leader>uD")
    toggle.profiler():map("<leader>up")
    toggle.profiler_highlights():map("<leader>uP")

    if vim.lsp.inlay_hint then
      toggle.inlay_hints():map("<leader>uh")
    end
  end,
}
