-- Neovim 全体のキーマップを設定するファイルです。

vim.keymap.set("i", "jj", "<Esc>", { desc = "インサートモードを抜ける" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "検索ハイライトを消す", silent = true })
