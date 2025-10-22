-- Options
local opt = vim.opt

-- 行番号を表示
opt.number = true

-- 相対行番号を表示
opt.relativenumber = true

-- インデントにスペースを使用
opt.expandtab = true

-- インデントのスペース数
opt.tabstop = 2

-- 自動インデントのスペース数
opt.shiftwidth = 2

-- ファイルが変更されたら自動で再読込
opt.autoread = true

-- Backspaceで削除されるスペース数
opt.softtabstop = 2

-- クリップボードを共有
opt.clipboard = 'unnamedplus'

-- Keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

map('i', 'jj', '<Esc>', opts)
map('n', '<S-h>', '^', opts)
map('n', '<S-l>', '$', opts)
map('v', '<S-h>', '^', opts)
map('v', '<S-l>', '$', opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

if vim.g.vscode then
  -- map('n', '<C-h>', "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", opts)
  -- map('n', '<C-l>', "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", opts)
end
