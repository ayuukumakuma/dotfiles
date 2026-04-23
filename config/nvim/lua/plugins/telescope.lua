local function telescope_builtin(name, options)
  return function()
    require("telescope.builtin")[name](options)
  end
end

local function telescope_extension(extension, method, options)
  return function()
    require("telescope").extensions[extension][method](options)
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
    "kkharji/sqlite.lua",
    "danielfalk/smart-open.nvim",
  },
  keys = {
    {
      "<leader>p",
      telescope_extension("md_render", "find_files", {
        hidden = true,
      }),
      desc = "ファイルを検索(md-render)",
    },
    {
      "<leader>P",
      telescope_builtin("find_files", {
        hidden = true,
      }),
      desc = "ファイルを検索(find_files)",
    },
    {
      "<leader>f",
      telescope_extension("md_render", "live_grep", hidden_grep),
      desc = "文字列を検索(md-render)",
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

    opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
      md_render = {},
    })
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("md_render")
    telescope.load_extension("smart_open")
  end,
}
