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
  lazy = false,
  build = function()
    require("nvim-treesitter").install(parsers, { force = true }):wait(300000)
  end,
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

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
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
