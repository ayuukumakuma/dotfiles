local autocmd = vim.api.nvim_create_autocmd
autocmd("VimEnter", {
	pattern = "*",
	command = "Fern . -reveal=%",
})
