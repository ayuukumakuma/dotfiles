vim.g.nord_disable_background = true
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_cursorline_transparent = true

return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	config = function()
		vim.cmd[[ colorscheme nord ]]
	end
}
