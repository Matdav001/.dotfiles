return {
	"ibhagwan/fzf-lua",
	cmd = {
		"FzfLua",
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				border = false,
				preview = {
					scrollbar = false,
				}
			},
		})
	end
}
