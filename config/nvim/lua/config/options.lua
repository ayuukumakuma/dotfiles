-- 表示系
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.showmatch = true
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "␣" }

-- インデント・タブ
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- ファイル・バックアップ
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- 操作
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.hidden = true
