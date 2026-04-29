-- nvim-hlslens で検索結果の現在位置と総数を見やすくします。
local function search_with_lens(key)
  return function()
    vim.cmd("normal! " .. vim.v.count1 .. key)
    require("hlslens").start()
  end
end

return {
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "n",
      search_with_lens("n"),
      desc = "次の検索結果へ移動",
      mode = "n",
    },
    {
      "N",
      search_with_lens("N"),
      desc = "前の検索結果へ移動",
      mode = "n",
    },
    {
      "*",
      search_with_lens("*"),
      desc = "カーソル下の単語を検索",
      mode = "n",
    },
    {
      "#",
      search_with_lens("#"),
      desc = "カーソル下の単語を逆方向検索",
      mode = "n",
    },
    {
      "g*",
      search_with_lens("g*"),
      desc = "カーソル下の単語を部分一致検索",
      mode = "n",
    },
    {
      "g#",
      search_with_lens("g#"),
      desc = "カーソル下の単語を逆方向部分一致検索",
      mode = "n",
    },
  },
}
