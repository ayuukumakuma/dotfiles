local groups = {
  { "<leader>g", "バージョン管理" },
  { "<leader>l", "言語サーバー" },
  { "<leader>m", "マークダウン" },
  { "<leader>n", "通知" },
  { "<leader>s", "検索" },
  { "<leader>u", "切り替え" },
  { "<leader>c", "コード" },
  { "g", "移動" },
  { "<C-w>", "ウィンドウ" },
}

local builtin_descriptions = {
  ["g<C-a>"] = "メモリプロファイルを出力",
  ["g<C-g>"] = "カーソル位置の情報を表示",
  ["g<C-h>"] = "矩形選択モードを開始",
  ["g<C-]>"] = "カーソル下のタグへジャンプ",
  ["g#"] = "カーソル下の単語を後方検索",
  ["g$"] = "画面行の末尾へ移動",
  ["g&"] = "直前の置換を全行で繰り返す",
  ["g'"] = "ジャンプリストを変更せずマークへ移動",
  ["g`"] = "ジャンプリストを変更せずマーク位置へ移動",
  ["g*"] = "カーソル下の単語を前方検索",
  ["g+"] = "新しいテキスト状態へ移動",
  ["g,"] = "変更リストの新しい位置へ移動",
  ["g-"] = "古いテキスト状態へ移動",
  ["g0"] = "画面行の先頭へ移動",
  ["g8"] = "文字の 16 進値を表示",
  ["g;"] = "変更リストの古い位置へ移動",
  ["g?"] = "ROT13 で変換",
  ["g??"] = "現在行を ROT13 で変換",
  ["g?g?"] = "現在行を ROT13 で変換",
  ["gD"] = "現在ファイル内の定義へ移動",
  ["gE"] = "前の WORD の末尾へ移動",
  ["gH"] = "行選択モードを開始",
  ["gI"] = "列 1 で挿入モードを開始",
  ["gJ"] = "空白を入れずに行を連結",
  ["gN"] = "前の検索一致を選択",
  ["gP"] = "カーソル前に貼り付け",
  ["gQ"] = "Ex モードを開始",
  ["gR"] = "仮想置換モードを開始",
  ["gT"] = "前のタブページへ移動",
  ["gU"] = "大文字に変換",
  ["gV"] = "直前の選択範囲を再選択しない",
  ["g]"] = "カーソル下のタグを選択",
  ["g^"] = "画面行の最初の非空白文字へ移動",
  ["g_"] = "行の最後の非空白文字へ移動",
  ["ga"] = "文字の ASCII 値を表示",
  ["gd"] = "現在関数内の定義へ移動",
  ["ge"] = "前の単語の末尾へ移動",
  ["gf"] = "カーソル下のファイルを開く",
  ["gF"] = "カーソル下のファイルと行番号を開く",
  ["gg"] = "バッファ先頭へ移動",
  ["gh"] = "選択モードを開始",
  ["gi"] = "前回の挿入位置で挿入モードを開始",
  ["gj"] = "下の画面行へ移動",
  ["gk"] = "上の画面行へ移動",
  ["gm"] = "画面行の中央へ移動",
  ["gM"] = "行の中央へ移動",
  ["gn"] = "次の検索一致を選択",
  ["go"] = "バッファ内のバイト位置へ移動",
  ["gp"] = "カーソル後に貼り付け",
  ["gq"] = "整形する",
  ["gr"] = "仮想置換する",
  ["gs"] = "指定秒数スリープ",
  ["gt"] = "次のタブページへ移動",
  ["gu"] = "小文字に変換",
  ["gv"] = "直前の選択範囲を再選択",
  ["gw"] = "カーソル位置を保って整形",
  ["gx"] = "カーソル下のパスまたは URI を開く",
  ["g@"] = "operatorfunc を呼び出す",
  ["g~"] = "大文字小文字を反転",
  ["g<Down>"] = "下の画面行へ移動",
  ["g<End>"] = "画面行の末尾へ移動",
  ["g<Home>"] = "画面行の先頭へ移動",
  ["g<LeftMouse>"] = "左クリック位置へ移動",
  ["g<MiddleMouse>"] = "中クリック位置へ移動",
  ["g<RightMouse>"] = "右クリック位置へ移動",
  ["g<Tab>"] = "直前のタブページへ移動",
  ["g<Up>"] = "上の画面行へ移動",
}

local default_keymap_descriptions = {
  ["g%"] = "対応箇所へ逆方向に移動",
  gO = "ドキュメントシンボルを表示",
  gra = "コードアクションを実行",
  grn = "名前を変更",
  grr = "参照を表示",
  gri = "実装へ移動",
  grt = "型定義へ移動",
  grx = "コードレンズを実行",
  gc = "コメントを切り替え",
  gcc = "行コメントを切り替え",
  gx = "カーソル下のパスまたは URI を開く",
}

local function localize_builtin_descriptions()
  for _, mapping in ipairs(require("km-builtins")) do
    local desc = builtin_descriptions[mapping.lhs]

    if desc then
      mapping.desc = desc
    end
  end
end

local function update_keymap_description(mode, lhs, desc)
  for _, mapping in ipairs(vim.api.nvim_get_keymap(mode)) do
    if mapping.lhs == lhs then
      local opts = {
        desc = desc,
        expr = mapping.expr == 1,
        nowait = mapping.nowait == 1,
        remap = mapping.noremap == 0,
        replace_keycodes = mapping.replace_keycodes == 1,
        silent = mapping.silent == 1,
      }

      vim.keymap.set(mode, lhs, mapping.callback or mapping.rhs, opts)

      return
    end
  end
end

local function localize_default_keymaps()
  for lhs, desc in pairs(default_keymap_descriptions) do
    update_keymap_description("n", lhs, desc)
  end
end

return {
  "emmanueltouzery/key-menu.nvim",
  event = "VeryLazy",
  config = function()
    local key_menu = require("key-menu")

    localize_builtin_descriptions()
    localize_default_keymaps()
    vim.schedule(localize_default_keymaps)

    key_menu.set("n", "<leader>")

    for _, group in ipairs(groups) do
      key_menu.set("n", group[1], { desc = group[2] })
    end
  end,
}
