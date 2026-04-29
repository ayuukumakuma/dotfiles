-- nvim-treesitter のパーサー導入と構文解析の起動設定です。
local parsers = {
  "bash",
  "diff",
  "fish",
  "gitcommit",
  "json",
  "just",
  "lua",
  "markdown",
  "markdown_inline",
  "nix",
  "regex",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = function()
    require("nvim-treesitter").install(parsers, { force = true }):wait(300000)
  end,
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    local parser_filetypes = {
      bash = true,
      diff = true,
      fish = true,
      gitcommit = true,
      json = true,
      just = true,
      lua = true,
      markdown = true,
      nix = true,
      sh = true,
      toml = true,
      vim = true,
      vimdoc = true,
      yaml = true,
    }

    local function start_treesitter(args)
      if parser_filetypes[vim.bo[args.buf].filetype] then
        pcall(vim.treesitter.start, args.buf)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "diff",
        "fish",
        "gitcommit",
        "json",
        "just",
        "lua",
        "markdown",
        "nix",
        "sh",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      callback = start_treesitter,
    })

    start_treesitter({ buf = vim.api.nvim_get_current_buf() })
  end,
}
