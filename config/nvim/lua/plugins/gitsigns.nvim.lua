-- gitsigns.nvim で Git の変更表示だけを有効にします。
-- hunk 操作などのキーマップは定義せず、バッファ内の視覚的な補助に閉じます。
return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signcolumn = true,
    signs_staged_enable = true,
    current_line_blame = true,
    word_diff = false,
    preview_config = {
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
}
