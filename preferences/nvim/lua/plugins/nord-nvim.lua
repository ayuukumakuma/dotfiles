return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.cmd([[colorscheme nord]])
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = true
		vim.g.nord_enable_sidebar_background = false
		vim.g.nord_cursorline_transparent = true
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false
		require("nord").set()
	end,
}
