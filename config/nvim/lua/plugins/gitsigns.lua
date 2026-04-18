local function call(name)
  return function()
    require("gitsigns")[name]()
  end
end

local function move_hunk(name, fallback)
  return function()
    if vim.wo.diff then
      vim.cmd.normal({ fallback, bang = true })
      return
    end

    require("gitsigns")[name]()
  end
end

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>gb",
      call("toggle_current_line_blame"),
      desc = "現在行の blame 表示を切り替え",
    },
    {
      "<leader>gw",
      call("toggle_word_diff"),
      desc = "単語差分を切り替え",
    },
    {
      "<leader>gp",
      call("preview_hunk"),
      desc = "差分ブロックをプレビュー",
    },
    {
      "<leader>gr",
      call("reset_hunk"),
      desc = "差分ブロックをリセット",
    },
    {
      "<leader>gs",
      call("stage_hunk"),
      desc = "差分ブロックをステージ",
    },
    {
      "<leader>gu",
      call("undo_stage_hunk"),
      desc = "差分ブロックのステージを取り消す",
    },
    {
      "<leader>gR",
      call("reset_buffer"),
      desc = "バッファ全体の変更をリセット",
    },
    {
      "<leader>gS",
      call("stage_buffer"),
      desc = "バッファ全体の変更をステージ",
    },
    {
      "<leader>gn",
      move_hunk("next_hunk", "]c"),
      desc = "次の差分ブロック",
    },
    {
      "<leader>gN",
      move_hunk("prev_hunk", "[c"),
      desc = "前の差分ブロック",
    },
  },
  opts = {
    current_line_blame = false,
    signcolumn = true,
    word_diff = false,
  },
}
