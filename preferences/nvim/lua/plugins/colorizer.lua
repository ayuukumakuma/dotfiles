-- カラーコードの色を背景に表示

return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end
}
