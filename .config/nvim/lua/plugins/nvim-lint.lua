return {
	{
		'mfussenegger/nvim-lint',
		opts = {},
		config = function(_, opts)
			local lint = require("lint")

			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					lint.try_lint("cspell")
				end,
			})
		end,
	},
}
