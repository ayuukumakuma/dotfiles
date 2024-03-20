return {
				"lambdalisue/fern-renderer-nerdfont.vim",
				config = function()
								vim.g["fern#renderer"] = "nerdfont"
				end,
				dependencies = {"lambdalisue/fern.vim"}
}
