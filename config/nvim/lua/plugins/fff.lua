local function find_files()
  require("fff").find_files()
end

local function live_grep(options)
  return function()
    require("fff").live_grep(options)
  end
end

return {
  "dmtrKovalenko/fff.nvim",
  lazy = false,
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    prompt = "🔎 ",
  },
  keys = {
    {
      "<leader>p",
      find_files,
      desc = "Find files",
    },
    {
      "<leader>f",
      live_grep(),
      desc = "Live grep",
    },
  },
}
