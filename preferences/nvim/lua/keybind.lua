local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 誓いの方向キー無効化
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
keymap('v', '<Up>', '<Nop>', opts)
keymap('v', '<Down>', '<Nop>', opts)
keymap('v', '<Left>', '<Nop>', opts)
keymap('v', '<Right>', '<Nop>', opts)
keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)
