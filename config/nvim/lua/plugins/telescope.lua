local function telescope_builtin(name, options)
  return function()
    require("telescope.builtin")[name](options)
  end
end

local function flash_telescope(prompt_bufnr)
  require("flash").jump({
    pattern = "^",
    label = { after = { 0, 0 } },
    search = {
      mode = "search",
      exclude = {
        function(win)
          local buffer = vim.api.nvim_win_get_buf(win)

          return vim.bo[buffer].filetype ~= "TelescopeResults"
        end,
      },
    },
    action = function(match)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)

      picker:set_selection(match.pos[1] - 1)
    end,
  })
end

local hidden_files = {
  hidden = true,
}

local hidden_grep = {
  additional_args = function()
    return {
      "--hidden",
      "--glob",
      "!.git/*",
    }
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>p",
      telescope_builtin("find_files", hidden_files),
      desc = "ファイルを検索",
    },
    {
      "<leader>f",
      telescope_builtin("live_grep", hidden_grep),
      desc = "文字列を検索",
    },
  },
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      mappings = {
        i = {
          ["<C-s>"] = flash_telescope,
        },
        n = {
          s = flash_telescope,
        },
      },
      prompt_prefix = "🔎 ",
      selection_caret = "❯ ",
      path_display = { "smart" },
    })
  end,
}
