local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jj", "<ESC>", opts)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", opts)
