-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any Key to exit..." }
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = ' '

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- プラグインのインポート
    { import = "plugins" },
  },
  -- テーマの設定
  install = { colorscheme = { "catppuccin" } },
  -- プラグインの更新を自動的に行う
  checker = { enabled = true },
})

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

map('i', 'jj', '<Esc>', opts)
map('n', '<S-h>', '^', opts)
map('n', '<S-l>', '$', opts)
map('v', '<S-h>', '^', opts)
map('v', '<S-l>', '$', opts)
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- 背景透過（カラースキーム適用後にも維持）
vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
  group = vim.api.nvim_create_augroup('TransparentBG', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
  end,
})
