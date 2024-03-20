vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ファイラ
keymap("n", "<Leader>e", ":Fern . -reveal=%<CR>", opts)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fern",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<ESC>", ":lua CloseFernOnEsc()<CR>", opts)
	end,
})
function CloseFernOnEsc()
	if vim.bo.filetype == "fern" then
		vim.cmd("bd")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", false)
	end
end

-- ファイル検索
keymap("n", "<Leader><Leader>", ":Telescope find_files<CR>", opts)
-- 全文検索
keymap("n", "<Leader>/", ":Telescope live_grep<CR>", opts)
-- バッファ移動
keymap("n", "<C-h>", ":BufferPrevious<CR>", opts)
keymap("n", "<C-l>", ":BufferNext<CR>", opts)
keymap("n", "<C-p>", ":BufferPick<CR>", opts)
keymap("n", "<C-w>", ":BufferClose<CR>", opts)
-- lazygit
keymap("n", "lg", ":LazyGit<CR>", opts)
-- terminal
keymap("n", "<C-t>", ":ToggleTerm direction=float<CR>", opts)
keymap("t", "<C-t>", [[<Cmd>ToggleTerm <CR>]], opts)
-- 入力モードを抜ける
keymap("i", "jj", "<Esc>", opts)
