return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = true
	end,
	opts = {
		animation = true,
		clickable = false,
		animation = true,
		highlight_alternate = true,
	},
	version = "^1.0.0",
}
