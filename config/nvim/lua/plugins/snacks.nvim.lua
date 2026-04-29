-- snacks.nvim で小さな QoL 機能をまとめて導入します。
--
-- 有効化するもの:
-- 大きなファイル対策と、ファイル指定起動時の初期表示高速化。
-- 起動画面、ファイル選択、入力欄、通知など普段使いの表示を Snacks に寄せる。
-- インデント、スコープ、スクロール、ステータス列、参照ジャンプで編集画面を補助する。
-- スクラッチバッファ、ターミナル、LazyGit、ブラウザ表示、集中モードはキーマップから呼び出す。
-- コマンドラインそのもののリッチ表示は Snacks ではなく noice.nvim 側に任せる。
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      terminal = {
        border = "rounded",
        backdrop = 60,
        width = 0.85,
        height = 0.85,
        on_win = function(win)
          vim.wo[win.win].winblend = 20
        end,
        wo = {
          winblend = 20,
          winhighlight = "Normal:SnacksTerminalNormal,NormalNC:SnacksTerminalNormal,FloatBorder:SnacksTerminalBorder",
        },
      },
    },
  },
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "スマート検索" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "バッファ一覧" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "文字列検索" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "コマンド履歴" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "通知履歴" },

    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "設定ファイルを探す" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "ファイルを探す" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git管理ファイルを探す" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "最近使ったファイル" },

    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Gitブランチ一覧" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Gitログ" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git状態" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git差分ハンク" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Gitの場所をブラウザで開く", mode = { "n", "v" } },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygitを開く" },

    { "<leader>sb", function() Snacks.picker.lines() end, desc = "バッファ内の行を探す" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "開いているバッファを検索" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "診断一覧" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "現在バッファの診断一覧" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "ヘルプを探す" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "キーマップ一覧" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "コマンド一覧" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "前回のピッカーを再開" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "単語または選択範囲を検索", mode = { "n", "x" } },

    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "定義へ移動" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "宣言へ移動" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "参照一覧" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "実装へ移動" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "型定義へ移動" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "言語サーバーのシンボル一覧" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "ワークスペースのシンボル一覧" },

    { "<leader>z", function() Snacks.zen() end, desc = "集中モードを切り替え" },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "ズームを切り替え" },
    { "<leader>.", function() Snacks.scratch() end, desc = "スクラッチバッファを切り替え" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "スクラッチバッファを選択" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "バッファを削除" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "ファイル名を変更" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "すべての通知を閉じる" },
    { "<leader>t", function() Snacks.terminal(vim.o.shell) end, desc = "ターミナルを切り替え" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "次の参照へ移動", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "前の参照へ移動", mode = { "n", "t" } },
  },
}
