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
      desc = "Toggle Git blame",
    },
    {
      "<leader>gw",
      call("toggle_word_diff"),
      desc = "Toggle Git word diff",
    },
    {
      "<leader>gp",
      call("preview_hunk"),
      desc = "Preview Git hunk",
    },
    {
      "<leader>gr",
      call("reset_hunk"),
      desc = "Reset Git hunk",
    },
    {
      "<leader>gs",
      call("stage_hunk"),
      desc = "Stage Git hunk",
    },
    {
      "<leader>gu",
      call("undo_stage_hunk"),
      desc = "Undo Git stage hunk",
    },
    {
      "<leader>gR",
      call("reset_buffer"),
      desc = "Reset Git buffer",
    },
    {
      "<leader>gS",
      call("stage_buffer"),
      desc = "Stage Git buffer",
    },
    {
      "<leader>gn",
      move_hunk("next_hunk", "]c"),
      desc = "Next Git hunk",
    },
    {
      "<leader>gN",
      move_hunk("prev_hunk", "[c"),
      desc = "Previous Git hunk",
    },
  },
  opts = {
    current_line_blame = false,
    signcolumn = true,
    word_diff = false,
  },
}
